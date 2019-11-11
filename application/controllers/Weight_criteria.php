<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Weight_criteria extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('weight_criteria_model');
        $this->load->model('criteria_model');
        $this->isLoggedIn();   
    }
    
    function index()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $data['weight'] = $this->weight_criteria_model->dataEdit();
            $data['criteria'] = $this->criteria_model->dataArray();
            $this->load->model('criteria_model');            
            $this->global['pageTitle'] = 'CodeInsect : Weight Criteria';
            $this->loadViews("criteria/weight", $this->global, $data, NULL);
        }
    }

    function addOrEdit()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $input = $this->input->post('input');
            foreach($input as $in)
                $input[] = array(
                    'log_name1' => $in['log_name1'],
                    'log_name2' => $in['log_name2'],
                    'id_criteria1' => $in['id_criteria2'],
                    'id_criteria2' => $in['id_criteria1'],
                    'weight' => (float) (1/(int) $in['weight']),
                );
            
            $criteria= $this->criteria_model->dataArray();
            for($i=0;$i<count($criteria);$i++)
                for($j=$i;$j<count($criteria);$j++){
                    if($i==$j)
                        $input[] = array(
                            'log_name1' => $criteria[$i]['name'],
                            'log_name2' => $criteria[$i]['name'],
                            'id_criteria1' => $criteria[$i]['id'],
                            'id_criteria2' => $criteria[$i]['id'],
                            'weight' => 1,
                        );
                }
            // print_r($input);

            $this->load->model('weight_criteria_model');
            $result = $this->weight_criteria_model->updateOrInsert($input);
            
            if($result > 0)
            {
                $this->session->set_flashdata('success', 'New Weight Criteria created successfully');
            }
            else
            {
                $this->session->set_flashdata('error', 'Weight Criteria creation failed');
            }
            redirect('Weight_criteria');
        }
    }
}

?>