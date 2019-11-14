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

            //SUM
            $sum=array();
            foreach($input as $i){
                if(empty($sum[$i['id_criteria']][$i['id_subcriteria2']]))
                    $sum[$i['id_criteria']][$i['id_subcriteria2']]=$i['weight'];
                else
                   $sum[$i['id_criteria']][$i['id_subcriteria2']]+=$i['weight'];
            }
            // print_r($sum);

            // Jum Criteria
            foreach($input as $i){
                $jumCriteria[$i['id_criteria']]=count($sum[$i['id_criteria']]);
            }
            // print_r($jumCriteria);

            //NORMALIZE
            $normalize=array();
            foreach($input as $i){
                $normalize[$i['id_criteria']][]=array(
                    'id_criteria' => $i['id_criteria'],
                    'id_subcriteria1' => $i['id_subcriteria1'],
                    'id_subcriteria2' => $i['id_subcriteria2'],
                    'weight' => $i['weight']/$sum[$i['id_criteria']][$i['id_subcriteria2']],
                );
            }
            // print_r($normalize);

            //SUM2
            $sum2=array();
            foreach($normalize as $i){
                foreach ($i as $j)
                    if(empty($sum2[$j['id_criteria']][$j['id_subcriteria1']]))
                        $sum2[$j['id_criteria']][$j['id_subcriteria1']]=$j['weight'];
                    else
                        $sum2[$j['id_criteria']][$j['id_subcriteria1']]+=$j['weight'];
            }
            // print_r($sum2);

            // SCORE
            $score=array();
            foreach($sum2 as $ke=>$va){
                foreach($va as $k=>$v){
                    $score[$k]=$v/$jumCriteria[$ke];
                    $subcriteria_ahp[]=array(
                        'score'=> $score[$k],
                        'id_criteria' => $ke,
                        'id_subcriteria' => $k
                    );
                }
            }
            // print_r($score);

            // EIGEN MAX
            $emax=array();
            foreach($sum as $ke=>$va){
                foreach($va as $k=>$v){
                    if(empty($emax[$ke]))
                        $emax[$ke]=$v*($score[$k]);
                    else
                        $emax[$ke]+=$v*($score[$k]);
                }
            }
            // print_r($emax);

            // CI
            foreach($emax as $k=>$v)
                $ci[$k]=($v-$jumCriteria[$k])/($jumCriteria[$k]-1);
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
            // foreach($ci as $k=>$v)
                // $cr[$k]=$v/$ri[$jumCriteria[$k]];
            // print_r($cr);
            // print_r($subcriteria_ahp);
            $this->load->model('weight_subcriteria_model');
            $result = $this->weight_subcriteria_model->updateOrInsert($input);
            
            $this->load->model('normalize_weight_subcriteria_model');
            $result1 = $this->normalize_weight_subcriteria_model->updateOrInsert($normalize);

            $this->load->model('subcriteria_ahp_model');
            $result2 = $this->subcriteria_ahp_model->updateOrInsert($subcriteria_ahp);

            $this->load->model('Weight_subcriteria_model');
            $result3 = $this->Weight_subcriteria_model->updateOrInsert($input);
            
            if($result > 0 and $result1 > 0 and $result2 > 0 and $result3 > 0)
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