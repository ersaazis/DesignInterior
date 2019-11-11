<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Weight_criteria_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('weight_criteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('weight_criteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function dataEdit()
    {
        $this->db->select('*');
        $this->db->from('weight_criteria');
        $this->db->where('weight >',1);
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function updateOrInsert($data)
    {
        $this->db->empty_table('weight_criteria');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $d)
            $this->db->insert('weight_criteria', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}