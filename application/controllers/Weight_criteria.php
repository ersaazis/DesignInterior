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
            $inputXXX = $this->input->post('input');
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
            ///////////////////////////////////////////////// AHP
            $startAHP = microtime(TRUE); 
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
            $stopAHP = microtime(TRUE); 
            ///////////////////////////////////////////////// END AHP
            $memUsageAhp=memory_get_usage();
            ///////////////////////////////////////////////// F AHP
            $startFAHP = microtime(TRUE); 

            $dataA=array(
                1 => array(1,1,1),
                2 => array(1,2,3),
                3 => array(2,3,4),
                4 => array(3,4,5),
                5 => array(4,5,6),
                6 => array(5,6,7),
                7 => array(6,7,8),
                8 => array(7,8,9),
                9 => array(9,9,9),
            );
            $dataB=array(
                1 => array(1/1,1/1,1/1),
                2 => array(1/3,1/2,1/1),
                3 => array(1/4,1/3,1/2),
                4 => array(1/5,1/4,1/3),
                5 => array(1/6,1/5,1/4),
                6 => array(1/7,1/6,1/5),
                7 => array(1/8,1/7,1/6),
                8 => array(1/9,1/8,1/7),
                9 => array(1/9,1/9,1/9),
            );
            $inputFahp=array();
            foreach($inputXXX as $in){
                $inputFahp[] = array(
                    'id_criteria1' => $in['id_criteria1'],
                    'id_criteria2' => $in['id_criteria2'],
                    'weight' => $dataA[$in['weight']],
                );
                $inputFahp[] = array(
                    'id_criteria1' => $in['id_criteria2'],
                    'id_criteria2' => $in['id_criteria1'],
                    'weight' => $dataB[$in['weight']],
                );
            }

            $criteria= $this->criteria_model->dataArray();
            for($i=0;$i<count($criteria);$i++)
                for($j=$i;$j<count($criteria);$j++){
                    if($i==$j)
                        $inputFahp[] = array(
                            'id_criteria1' => $criteria[$i]['id'],
                            'id_criteria2' => $criteria[$i]['id'],
                            'weight' => $dataA[1],
                        );
                }
            
            // print_r($inputFahp);
            //Fuzzy Geometric Mean
            $FGM=array();
            foreach($inputFahp as $i){
                if(empty($FGM[$i['id_criteria1']][0])){
                    $FGM[$i['id_criteria1']][0]=$i['weight'][0];
                }
                else{
                   $FGM[$i['id_criteria1']][0]*=$i['weight'][0];
                }
                if(empty($FGM[$i['id_criteria1']][1])){
                    $FGM[$i['id_criteria1']][1]=$i['weight'][1];
                }
                else{
                   $FGM[$i['id_criteria1']][1]*=$i['weight'][1];
                }
                if(empty($FGM[$i['id_criteria1']][2])){
                    $FGM[$i['id_criteria1']][2]=$i['weight'][2];
                }
                else{
                   $FGM[$i['id_criteria1']][2]*=$i['weight'][2];
                }

            }
            foreach($FGM as $k=>$fgm){
                $FGM[$k][0]=pow($fgm[0],(1/$jumCriteria));
                $FGM[$k][1]=pow($fgm[1],(1/$jumCriteria));
                $FGM[$k][2]=pow($fgm[2],(1/$jumCriteria));
            }

            $sumFGM=array();
            foreach($FGM as $fgm){
                if(empty($sumFGM[0])){
                    $sumFGM[0]=$fgm[0];
                }
                else{
                   $sumFGM[0]+=$fgm[0];
                }
                if(empty($sumFGM[1])){
                    $sumFGM[1]=$fgm[1];
                }
                else{
                   $sumFGM[1]+=$fgm[1];
                }
                if(empty($sumFGM[2])){
                    $sumFGM[2]=$fgm[2];
                }
                else{
                   $sumFGM[2]+=$fgm[2];
                }
            }
            // print_r($sumFGM);

            $inverseSumFGM=array();
            $inverseSumFGM[0]=1/$sumFGM[2];
            $inverseSumFGM[1]=1/$sumFGM[1];
            $inverseSumFGM[2]=1/$sumFGM[0];
            
            // print_r($inverseSumFGM);
            // FUZZY WEIGHT
            $fw=array();
            foreach($FGM as $k=>$fgm){
                $fw[$k][0]=$fgm[0]*$inverseSumFGM[0];
                $fw[$k][1]=$fgm[1]*$inverseSumFGM[1];
                $fw[$k][2]=$fgm[2]*$inverseSumFGM[2];
            }
            // print_r($fw);

            // Center Of Area
            $coa=array();
            $sumCoa=0;
            foreach($fw as $k=>$x){
                $coa[$k]=($x[0]+$x[1]+$x[2])/3;
                $sumCoa+=$coa[$k];
            }
            // print_r($sumCoa);

            // Normalize COA
            $nCoa=array();
            foreach($coa as $k=>$x){
                $nCoa[]=array(
                    'score'=> $x/$sumCoa,
                    'id_criteria' => $k
                );
            }
            // print_r($nCoa);
            // print_r($criteria_ahp);
            $stopFAHP = microtime(TRUE); 
            ///////////////////////////////////////////////// END F AHP
            $memUsageFahp=memory_get_usage();
            
            $this->load->model('weight_criteria_model');
            $result = $this->weight_criteria_model->updateOrInsert($input);
            
            $this->load->model('normalize_weight_criteria_model');
            $result1 = $this->normalize_weight_criteria_model->updateOrInsert($normalize);

            $this->load->model('criteria_ahp_model');
            $result2 = $this->criteria_ahp_model->updateOrInsert($criteria_ahp);

            $this->load->model('criteria_fahp_model');
            $result2 = $this->criteria_fahp_model->updateOrInsert($nCoa);

            $waktuAHP = array('value'=>$stopAHP-$startAHP);
            $this->db->where('key','waktuAHP');
            $this->db->update('setting', $waktuAHP);

            $waktuFAHP = array('value'=>$stopFAHP-$startFAHP);
            $this->db->where('key','waktuFAHP');
            $this->db->update('setting', $waktuFAHP);

            $memUsageAhp = array('value'=>$memUsageAhp);
            $this->db->where('key','memUsageAhp');
            $this->db->update('setting', $memUsageAhp);

            $memUsageFahp = array('value'=>$memUsageFahp);
            $this->db->where('key','memUsageFahp');
            $this->db->update('setting', $memUsageFahp);

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