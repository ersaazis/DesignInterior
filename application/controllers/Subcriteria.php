<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : Subcriteria (SubcriteriaController)
 * Subcriteria Class to control all subcriteria related operations.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Subcriteria extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('subcriteria_model');
        $this->isLoggedIn();   
    }
    
    /**
     * This function is used to load the subcriteria list
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
            
            $count = $this->subcriteria_model->subcriteriaListingCount($searchText);

			$returns = $this->paginationCompress ( "subcriteria/", $count, 10 );
            
            $data['subcriteriaRecords'] = $this->subcriteria_model->subcriteriaListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'CodeInsect : Subcriteria Listing';
            
            $this->loadViews("subcriteria", $this->global, $data, NULL);
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
            $this->load->model('subcriteria_model');            
            $data['criteria'] = $this->subcriteria_model->criteria();
            $this->global['pageTitle'] = 'CodeInsect : Add New Subcriteria';
            $this->loadViews("subcriteriaAddNew", $this->global, $data, NULL);
        }
    }
    
    /**
     * This function is used to add new subcriteria to the system
     */
    function addNewSubcriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('name','Subcriteria Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('cname','Criteria','trim|required|numeric');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $criteria_id = $this->input->post('cname');
                $subcriteriaInfo = array('name'=>$name,'criteria_id'=>$criteria_id);
                $this->load->model('subcriteria_model');
                $result = $this->subcriteria_model->addNewSubcriteria($subcriteriaInfo);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Subcriteria created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Subcriteria creation failed');
                }
                
                redirect('subcriteria/addNew');
            }
        }
    }

    
    /**
     * This function is used load subcriteria edit information
     * @param number $subcriteriaId : Optional : This is subcriteria id
     */
    function editOld($subcriteriaId = NULL)
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            if($subcriteriaId == null)
            {
                redirect('subcriteria');
            }
            
            $data['criteria'] = $this->subcriteria_model->criteria();
            $data['subcriteriaInfo'] = $this->subcriteria_model->getSubcriteriaInfo($subcriteriaId);
            
            $this->global['pageTitle'] = 'CodeInsect : Edit Subcriteria';
            
            $this->loadViews("subcriteriaEditOld", $this->global, $data, NULL);
        }
    }
    
    
    /**
     * This function is used to edit the subcriteria information
     */
    function editSubcriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $subcriteriaId = $this->input->post('id');
            
            $this->form_validation->set_rules('name','Subcriteria Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('cname','Criteria','trim|required|numeric');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->editOld($subcriteriaId);
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $criteria_id = $this->input->post('cname');
                $subcriteriaInfo = array('name'=>$name,'criteria_id'=>$criteria_id);
                $result = $this->subcriteria_model->editSubcriteria($subcriteriaInfo, $subcriteriaId);                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Subcriteria updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Subcriteria updation failed');
                }
                
                redirect('subcriteria');
            }
        }
    }


    /**
     * This function is used to delete the subcriteria using subcriteriaId
     * @return boolean $result : TRUE / FALSE
     */
    function deleteSubcriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $id = $this->input->post('id');
            $result = $this->subcriteria_model->deleteSubcriteria($id);
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