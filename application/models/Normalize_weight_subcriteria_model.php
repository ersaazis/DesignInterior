<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class normalize_weight_subcriteria_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('normalize_weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('normalize_weight_subcriteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function updateOrInsert($data)
    {
        $this->db->empty_table('normalize_weight_subcriteria');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $da)
            foreach($da as $d)
                $this->db->insert('normalize_weight_subcriteria', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}