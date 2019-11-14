<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Subcriteria_ahp_model extends CI_Model
{
    function data()
    {
        $this->db->select('*');
        $this->db->from('subcriteria_ahp');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('subcriteria_ahp');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    function getScoreAHP($id)
    {
        $this->db->select('*');
        $this->db->from('subcriteria_ahp');
        $this->db->where('id_criteria',$id);
        $query = $this->db->get();
        $result = $query->row();        
        return $result;
    }
    function updateOrInsert($data)
    {
        $this->db->empty_table('subcriteria_ahp');
        // print_r($data);
        $this->db->trans_start();
        foreach($data as $d)
            $this->db->insert('subcriteria_ahp', $d);
        $insert_id = $this->db->insert_id();
        $this->db->trans_complete();
        
        return $insert_id;
    }
}