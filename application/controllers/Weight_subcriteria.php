<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Weight_subcriteria extends BaseController
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('weight_subcriteria_model');
        $this->load->model('weight_criteria_model');
        $this->load->model('criteria_model');
        $this->load->model('subcriteria_model');
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
            $data['criteria'] = $this->criteria_model->dataArray();
            foreach ($data['criteria'] as $cr) {
                $data['weight'][$cr['id']] = $this->weight_subcriteria_model->getDataArray($cr['id']);
            }
            foreach ($data['criteria'] as $cr) {
                $data['subcriteria'][$cr['id']] = $this->subcriteria_model->getDataArray($cr['id']);
            }
            $this->global['pageTitle'] = 'CodeInsect : Weight Subriteria';
            $this->loadViews("subcriteria/weight", $this->global, $data, NULL);
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
                    'id_criteria' => $in['id_criteria'],
                    'id_subcriteria1' => $in['id_subcriteria2'],
                    'id_subcriteria2' => $in['id_subcriteria1'],
                    'weight' => (float) (1/(int) $in['weight']),
                );
            
            $subcriteria= $this->subcriteria_model->dataArray();
            for($i=0;$i<count($subcriteria);$i++)
                for($j=$i;$j<count($subcriteria);$j++)
                    if($i==$j)
                        $input[] = array(
                            'id_criteria' => $subcriteria[$i]['criteria_id'],
                            'id_subcriteria1' => $subcriteria[$i]['id'],
                            'id_subcriteria2' => $subcriteria[$i]['id'],
                            'weight' => 1,
                        );
            // print_r($input);

            $this->load->model('Weight_subcriteria_model');
            $result = $this->Weight_subcriteria_model->updateOrInsert($input);
            
            if($result > 0)
            {
                $this->session->set_flashdata('success', 'New Weight Criteria created successfully');
            }
            else
            {
                $this->session->set_flashdata('error', 'Weight Subcriteria creation failed');
            }
            redirect('Weight_subcriteria');
        }
    }
}

?>