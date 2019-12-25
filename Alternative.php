<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Alternative extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('alternative_model');
        $this->isLoggedIn();   
    }
    
    function spesialcriteria()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $id_subcriteria = $this->input->post('id_subcriteria');
            $data = array('value'=>$id_subcriteria);
            $this->db->where('key','spesialcriteria');
            $this->db->update('setting', $data);
            $this->session->set_flashdata('success', 'New Alternative created successfully');
            redirect('alternative');
        }
    }

    /**
     * This function is used to load the alternative list
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
            
            $count = $this->alternative_model->alternativeListingCount($searchText);

			$returns = $this->paginationCompress ( "alternative/", $count, 10 );
            $this->load->model('criteria_model');
            $data['criteria'] = $this->criteria_model->dataArray();
            $data['s_criteria'] = $this->db->select('value')->where('key', 'spesialcriteria')->get('setting')->row('value');

            $data['alternativeRecords'] = $this->alternative_model->alternativeListing($searchText, $returns["page"], $returns["segment"]);
            
            $this->global['pageTitle'] = 'CodeInsect : Alternative Listing';
            
            $this->loadViews("alternative/alternative", $this->global, $data, NULL);
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
            $this->global['pageTitle'] = 'CodeInsect : Add New Alternative';
            $data['subcriteria'] = $this->subcriteria_model->data();
            $data['s_criteria'] = $this->db->select('value')->where('key', 'spesialcriteria')->get('setting')->row('value');
            $this->loadViews("alternative/alternativeAddNew", $this->global, $data, NULL);
        }
    }
    
    /**
     * This function is used to add new alternative to the system
     */
    function addNewAlternative()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $this->form_validation->set_rules('name','Alternative Name','trim|required|max_length[128]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $id_subcriteria = $this->input->post('id_subcriteria');
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $alternativeInfo = array('name'=>$name,'id_subcriteria'=>$id_subcriteria);
                $this->load->model('alternative_model');
                $result = $this->alternative_model->addNewAlternative($alternativeInfo);
                
                if($result > 0)
                {
                    $this->session->set_flashdata('success', 'New Alternative created successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Alternative creation failed');
                }
                
                redirect('alternative/addNew');
            }
        }
    }

    
    /**
     * This function is used load alternative edit information
     * @param number $alternativeId : Optional : This is alternative id
     */
    function editOld($alternativeId = NULL)
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            if($alternativeId == null)
            {
                redirect('alternative');
            }
            $this->load->model('subcriteria_model');            
            $data['subcriteria'] = $this->subcriteria_model->data();
            $data['s_criteria'] = $this->db->select('value')->where('key', 'spesialcriteria')->get('setting')->row('value');

            $data['alternativeInfo'] = $this->alternative_model->getAlternativeInfo($alternativeId);
            
            $this->global['pageTitle'] = 'CodeInsect : Edit Alternative';
            
            $this->loadViews("alternative/alternativeEditOld", $this->global, $data, NULL);
        }
    }
    
    
    /**
     * This function is used to edit the alternative information
     */
    function editAlternative()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');
            
            $alternativeId = $this->input->post('id');
            
            $this->form_validation->set_rules('name','Alternative Name','trim|required|max_length[128]');
            
            if($this->form_validation->run() == FALSE)
            {
                $this->editOld($alternativeId);
            }
            else
            {
                $id_subcriteria = $this->input->post('id_subcriteria');
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('name'))));
                $alternativeInfo = array('name'=>$name,'id_subcriteria'=>$id_subcriteria);

                $result = $this->alternative_model->editAlternative($alternativeInfo, $alternativeId);                
                if($result == true)
                {
                    $this->session->set_flashdata('success', 'Alternative updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'Alternative updation failed');
                }
                
                redirect('alternative');
            }
        }
    }


    /**
     * This function is used to delete the alternative using alternativeId
     * @return boolean $result : TRUE / FALSE
     */
    function deleteAlternative()
    {
        if($this->isTicketter() == FALSE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $id = $this->input->post('id');
            $result = $this->alternative_model->deleteAlternative($id);
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