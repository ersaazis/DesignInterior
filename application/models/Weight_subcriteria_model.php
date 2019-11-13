<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Weight_subcriteria_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function getDataArray($id_criteria)
    {
        $this->db->select('weight_subcriteria.*,c1.name as name1, c2.name as name2');
        $this->db->join('sub_criteria as c1', 'c1.id = weight_subcriteria.id_subcriteria1');
        $this->db->join('sub_criteria as c2', 'c2.id = weight_subcriteria.id_subcriteria2');
        $this->db->where('id_criteria',$id_criteria);
        $this->db->where('input',true);
        $this->db->from('weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function dataEdit()
    {
        $this->db->select('*');
        $this->db->where('weight >',1);
        $this->db->from('weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function updateOrInsert($data)
    {
        $this->db->empty_table('weight_subcriteria');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $d)
            $this->db->insert('weight_subcriteria', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}