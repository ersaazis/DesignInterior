<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Criteria_ahp_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('criteria_ahp');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('criteria_ahp');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }

    function updateOrInsert($data)
    {
        $this->db->empty_table('criteria_ahp');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $d)
            $this->db->insert('criteria_ahp', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}