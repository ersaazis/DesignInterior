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
                    'id_criteria1' => $in['id_criteria2'],
                    'id_criteria2' => $in['id_criteria1'],
                    'weight' => (float) (1/(int) $in['weight']),
                );
            
            $criteria= $this->criteria_model->dataArray();
            for($i=0;$i<count($criteria);$i++)
                for($j=$i;$j<count($criteria);$j++){
                    if($i==$j)
                        $input[] = array(
                            'id_criteria1' => $criteria[$i]['id'],
                            'id_criteria2' => $criteria[$i]['id'],
                            'weight' => 1,
                        );
                }
            // print_r($input);

            
            //SUM
            $sum=array();
            foreach($input as $i){
                if(empty($sum[$i['id_criteria2']]))
                    $sum[$i['id_criteria2']]=$i['weight'];
                else
                   $sum[$i['id_criteria2']]+=$i['weight'];
            }
            // print_r($sum);

            // Jum Criteria
            $jumCriteria=count($sum);

            //NORMALIZE
            $normalize=array();
            foreach($input as $i){
                $normalize[]=array(
                    'id_criteria1' => $i['id_criteria1'],
                    'id_criteria2' => $i['id_criteria2'],
                    'weight' => $i['weight']/$sum[$i['id_criteria2']],
                );
            }
            // print_r($normalize);

            //SUM2
            $sum2=array();
            foreach($normalize as $i){
                if(empty($sum2[$i['id_criteria1']]))
                    $sum2[$i['id_criteria1']]=$i['weight'];
                else
                    $sum2[$i['id_criteria1']]+=$i['weight'];
            }
            // print_r($sum2);

            // SCORE
            $score=array();
            foreach($sum2 as $k=>$v){
                $score[$k]=$v/$jumCriteria;
                $criteria_ahp[]=array(
                    'score'=> $score[$k],
                    'id_criteria' => $k
                );
            }
            // print_r($score);

            // EIGEN MAX
            $emax=0;
            foreach($sum as $k=>$v){
                $emax+=$v*($score[$k]);
            }
            // print_r($emax);

            // CI
            $ci=($emax-$jumCriteria)/($jumCriteria-1);
            // print_r($ci);

            $ri=array(
                1=>'0',
                2=>'0',
                3=>'0.58',
                4=>'0.9',
                5=>'1.12',
                6=>'1.24',
                7=>'1.32',
                8=>'1.41',
                9=>'1.45',
                10=>'1.49',
                11=>'1.51',
                12=>'1.48',
                13=>'1.56',
                14=>'1.57',
                15=>'1.59',
            );
            // CR
            $cr=$ci/$ri[$jumCriteria];
            // print_r($cr);
            // print_r($criteria_ahp);
            $this->load->model('weight_criteria_model');
            $result = $this->weight_criteria_model->updateOrInsert($input);
            
            $this->load->model('normalize_weight_criteria_model');
            $result1 = $this->normalize_weight_criteria_model->updateOrInsert($normalize);

            $this->load->model('criteria_ahp_model');
            $result2 = $this->criteria_ahp_model->updateOrInsert($criteria_ahp);

            if($result > 0 and $result1 > 0 and $result2 > 0)
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