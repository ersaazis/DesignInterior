<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Criteria_model extends CI_Model
{
    /**
     * This function is used to get the criteria listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function criteriaListingCount($searchText = '')
    {
        $this->db->select('*');
        $this->db->from('criteria');
        if(!empty($searchText)) {
            $likeCriteria = "(name  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $query = $this->db->get();
        
        return $query->num_rows();
    }
    
    function data()
    {
        $this->db->select('*');
        $this->db->from('criteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('criteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }
    /**
     * This function is used to get the criteria listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function criteriaListing($searchText = '', $page, $segment)
    {
        $this->db->select('*');
        $this->db->from('criteria');
        if(!empty($searchText)) {
            $likeCriteria = "(name  LIKE '%".$searchText."%')";
            $this->db->where($likeCriteria);
        }
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    
    /**
     * This function is used to add new criteria to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewCriteria($criteriaInfo)
    {
        $this->db->trans_start();
        $this->db->insert('criteria', $criteriaInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
    
    /**
     * This function used to get criteria information by id
     * @param number $criteriaId : This is criteria id
     * @return array $result : This is criteria information
     */
    function getCriteriaInfo($criteriaId)
    {
        $this->db->select('*');
        $this->db->from('criteria');
        $this->db->where('id', $criteriaId);
        $query = $this->db->get();
        
        return $query->row();
    }
    
    
    /**
     * This function is used to update the criteria information
     * @param array $criteriaInfo : This is criterias updated information
     * @param number $criteriaId : This is criteria id
     */
    function editCriteria($criteriaInfo, $criteriaId)
    {
        $this->db->where('id', $criteriaId);
        $this->db->update('criteria', $criteriaInfo);
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete the criteria information
     * @param number $criteriaId : This is criteria id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteCriteria($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('criteria');
        
        return 1;
    }

    /**
     * This function used to get criteria information by id
     * @param number $criteriaId : This is criteria id
     * @return array $result : This is criteria information
     */
    function getCriteriaInfoById($criteriaId)
    {
        $this->db->select('*');
        $this->db->from('criteria');
        $this->db->where('id', $criteriaId);
        $query = $this->db->get();
        
        return $query->row();
    }
}