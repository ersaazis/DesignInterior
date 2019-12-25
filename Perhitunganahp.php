<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';


class Perhitunganahp extends BaseController
{
    public function __construct()
    {
        parent::__construct();
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
            $this->load->model('weight_criteria_model');
            $data['weight'] = $this->weight_criteria_model->dataTampil();

            $this->global['pageTitle'] = 'CodeInsect : Calculation Results for AHP';
            $this->loadViews("perhitungan/ahp", $this->global, $data, NULL);
        }
    }
}

?>