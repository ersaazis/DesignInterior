<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Normalize_weight_criteria_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('normalize_weight_criteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('normalize_weight_criteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function dataEdit()
    {
        $this->db->select('normalize_weight_criteria.*,c1.name as name1, c2.name as name2');
        $this->db->join('criteria as c1', 'c1.id = normalize_weight_criteria.id_criteria1');
        $this->db->join('criteria as c2', 'c2.id = normalize_weight_criteria.id_criteria2');
        $this->db->from('normalize_weight_criteria');
        $this->db->where('input',true);
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function dataTampil()
    {
        $this->db->select('normalize_weight_criteria.*,c1.name as name1, c2.name as name2');
        $this->db->join('criteria as c1', 'c1.id = normalize_weight_criteria.id_criteria1');
        $this->db->join('criteria as c2', 'c2.id = normalize_weight_criteria.id_criteria2');
        $this->db->from('normalize_weight_criteria');
        $this->db->order_by('id_criteria1,id_criteria2');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function updateOrInsert($data)
    {
        $this->db->empty_table('normalize_weight_criteria');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $d)
            $this->db->insert('normalize_weight_criteria', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}