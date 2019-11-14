<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

class Assessment extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->isLoggedIn();   
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
            $this->global['pageTitle'] = 'CodeInsect : Assessment';
            $this->load->model('criteria_model');
            $this->load->model('subcriteria_model');
            $data['criteria'] = $this->criteria_model->dataArray();
            foreach ($data['criteria'] as $cr) {
                $data['subcriteria'][$cr['id']] = $this->subcriteria_model->getDataArray($cr['id']);
            }
            $this->loadViews("assessment/input", $this->global, $data, NULL);
        }
    }
    function calculate()
    {
        if($this->isTicketter() == FALSE)
        {
            $this->loadThis();
        }
        else
        {
            $this->global['pageTitle'] = 'CodeInsect : Assessment';
            $this->load->model('Criteria_ahp_model');
            $this->load->model('Subcriteria_ahp_model');
            $this->load->model('Subcriteria_model');
            $this->load->model('Alternative_model');
            $criteriaAHP=$this->Criteria_ahp_model->data();
            $subcriteriaAHP=$this->Subcriteria_ahp_model->data();
            $AHPc=array();
            foreach($criteriaAHP as $cahp){
                $AHPc[$cahp->id_criteria]=$cahp->score;
            }
            $AHPsubc=array();
            foreach($subcriteriaAHP as $sahp){
                $AHPsubc[$sahp->id_subcriteria]=$sahp->score;
            }
            $inputs = $this->input->post('input');
            $input=array();
            $s_criteria = $this->db->select('value')->where('key', 'spesialcriteria')->get('setting')->row('value');
            $point=0;
            foreach($inputs as $in){
                if($in['id_criteria'] == $s_criteria)
                    continue;
                    $point+=$AHPc[$in['id_criteria']] * $AHPsubc[$in['id_subcriteria']];
            }

            $subcriteria=$this->Subcriteria_model->dataArray();
            $totalBOBOT=array();
            foreach($subcriteria as $sub){
                if($sub['criteria_id'] != $s_criteria)
                    continue;
                $totalBOBOT[$sub['id']]=$point+($AHPc[$s_criteria]*$AHPsubc[$sub['id']]);
            }
            $data['totalBOBOT'] = $totalBOBOT;
            $data['alternative'] = $this->Alternative_model->data();
            $this->loadViews("assessment/hasil", $this->global, $data, NULL);
        }
    }
}

?>