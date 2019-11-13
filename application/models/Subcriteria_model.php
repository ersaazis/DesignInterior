<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Subcriteria_model extends CI_Model
{
    /**
     * This function is used to get the subcriteria listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function subcriteriaListingCount($searchText = '')
    {
        $this->db->select('sc.id, sc.name as name, c.name as cname');
        $this->db->from('sub_criteria as sc');
        $this->db->join('criteria as c', 'c.id = sc.criteria_id','left');
        if(!empty($searchText)) {
            $likeSubcriteria = "(sc.name  LIKE '%".$searchText."%')";
            $this->db->where($likeSubcriteria);
        }
        $query = $this->db->get();
        
        return $query->num_rows();
    }
    function data()
    {
        $this->db->select('*');
        $this->db->from('sub_criteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    function dataArray()
    {
        $this->db->select('*');
        $this->db->from('sub_criteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }    
    function getDataArray($id_criteria)
    {
        $this->db->select('*');
        $this->db->where('criteria_id',$id_criteria);
        $this->db->from('sub_criteria');
        $query = $this->db->get();
        $result = $query->result_array();        
        return $result;
    }    
    /**
     * This function is used to get the subcriteria listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function subcriteriaListing($searchText = '', $page, $segment)
    {
        $this->db->select('sc.id, sc.name as name, c.name as cname');
        $this->db->from('sub_criteria as sc');
        $this->db->join('criteria as c', 'c.id = sc.criteria_id','left');
        if(!empty($searchText)) {
            $likeSubcriteria = "(sc.name  LIKE '%".$searchText."%')";
            $this->db->where($likeSubcriteria);
        }
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }

    function criteria()
    {
        $this->db->select('*');
        $this->db->from('criteria');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    
    /**
     * This function is used to add new subcriteria to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewSubcriteria($subcriteriaInfo)
    {
        $this->db->trans_start();
        $this->db->insert('sub_criteria', $subcriteriaInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
    
    /**
     * This function used to get subcriteria information by id
     * @param number $subcriteriaId : This is subcriteria id
     * @return array $result : This is subcriteria information
     */
    function getSubcriteriaInfo($subcriteriaId)
    {
        $this->db->select('sc.id, sc.criteria_id, sc.name as name, c.name as cname');
        $this->db->from('sub_criteria as sc');
        $this->db->join('criteria as c', 'c.id = sc.criteria_id','left');
        $this->db->where('sc.id', $subcriteriaId);
        $query = $this->db->get();
        return $query->row();
    }
    
    
    /**
     * This function is used to update the subcriteria information
     * @param array $subcriteriaInfo : This is subcriterias updated information
     * @param number $subcriteriaId : This is subcriteria id
     */
    function editSubcriteria($subcriteriaInfo, $subcriteriaId)
    {
        $this->db->where('id', $subcriteriaId);
        $this->db->update('sub_criteria', $subcriteriaInfo);
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete the subcriteria information
     * @param number $subcriteriaId : This is subcriteria id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteSubcriteria($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('sub_criteria');
        
        return 1;
    }

    /**
     * This function used to get subcriteria information by id
     * @param number $subcriteriaId : This is subcriteria id
     * @return array $result : This is subcriteria information
     */
    function getSubcriteriaInfoById($subcriteriaId)
    {
        $this->db->select('sc.id as id, sc.name as name, c.name as cname');
        $this->db->from('sub_criteria as sc');
        $this->db->join('criteria as c', 'c.id = sc.criteria_id','left');
        $this->db->where('sc.id', $subcriteriaId);
        $query = $this->db->get();
        
        return $query->row();
    }
}