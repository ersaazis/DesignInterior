<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Criteria extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('criteria_model');
        $this->isLoggedIn();   
    }
    
    /**
     * This function is used to load the criteria list
     */
    function index()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {        
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;
            
            $this->load->library('pagination');
            
            $count = $this->criteria_model->criteriaListingCount($searchText);

			$returns = $this->paginationCompress ( "criteria/", $count, 10 );
            
            $data['criteriaRecords'] = $this->criteria_model->criteriaListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'CodeInsect : Criteria Listing';
            
            $this->loadViews("criteria", $this->global, $data, NULL);
        }
    }

    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->model('criteria_model');            
            $this->global['pageTitle'] = 'CodeInsect : Add New Criteria';
            $this->loadViews("criteriaAddNew", $this->global, NULL, NULL);
        }
    }
    
    /**
     * This function is used to add new criteria to the system
     */
    function addNewCriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('name','Criteria Name','trim|required|max_length[128]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $criteriaInfo = array('name'=>$name);
                $this->load->model('criteria_model');
                $result = $this->criteria_model->addNewCriteria($criteriaInfo);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Criteria created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Criteria creation failed');
                }
                
                redirect('criteria/addNew');
            }
        }
    }

    
    /**
     * This function is used load criteria edit information
     * @param number $criteriaId : Optional : This is criteria id
     */
    function editOld($criteriaId = NULL)
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            if($criteriaId == null)
            {
                redirect('criteria');
            }
            
            $data['criteriaInfo'] = $this->criteria_model->getCriteriaInfo($criteriaId);
            
            $this->global['pageTitle'] = 'CodeInsect : Edit Criteria';
            
            $this->loadViews("criteriaEditOld", $this->global, $data, NULL);
        }
    }
    
    
    /**
     * This function is used to edit the criteria information
     */
    function editCriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $criteriaId = $this->input->post('id');
            
            $this->form_validation->set_rules('name','Criteria Name','trim|required|max_length[128]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->editOld($criteriaId);
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $criteriaInfo = array('name' => $name);
                $result = $this->criteria_model->editCriteria($criteriaInfo, $criteriaId);                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Criteria updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Criteria updation failed');
                }
                
                redirect('criteria');
            }
        }
    }


    /**
     * This function is used to delete the criteria using criteriaId
     * @return boolean $result : TRUE / FALSE
     */
    function deleteCriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $id = $this->input->post('id');
            $result = $this->criteria_model->deleteCriteria($id);
            // $result =1;
            if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
            else { echo(json_encode(array('status'=>FALSE))); }
        }
    }
    
    /**
     * Page not found : error 404
     */
    function pageNotFound()
    {
        $this->global['pageTitle'] = 'CodeInsect : 404 - Page Not Found';
        
        $this->loadViews("404", $this->global, NULL, NULL);
    }
}

?>