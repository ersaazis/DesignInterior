<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

class Alternative_model extends CI_Model
{
    /**
     * This function is used to get the alternative listing count
     * @param string $searchText : This is optional search text
     * @return number $count : This is row count
     */
    function alternativeListingCount($searchText = '')
    {
        $this->db->select('*');
        $this->db->from('alternative');
        if(!empty($searchText)) {
            $likeAlternative = "(name  LIKE '%".$searchText."%')";
            $this->db->where($likeAlternative);
        }
        $query = $this->db->get();
        
        return $query->num_rows();
    }
    function data()
    {
        $this->db->select('*');
        $this->db->from('alternative');
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    /**
     * This function is used to get the alternative listing count
     * @param string $searchText : This is optional search text
     * @param number $page : This is pagination offset
     * @param number $segment : This is pagination limit
     * @return array $result : This is result
     */
    function alternativeListing($searchText = '', $page, $segment)
    {
        $this->db->select('*');
        $this->db->from('alternative');
        if(!empty($searchText)) {
            $likeAlternative = "(name  LIKE '%".$searchText."%')";
            $this->db->where($likeAlternative);
        }
        $this->db->limit($page, $segment);
        $query = $this->db->get();
        $result = $query->result();        
        return $result;
    }
    
    /**
     * This function is used to add new alternative to system
     * @return number $insert_id : This is last inserted id
     */
    function addNewAlternative($alternativeInfo)
    {
        $this->db->trans_start();
        $this->db->insert('alternative', $alternativeInfo);
        
        $insert_id = $this->db->insert_id();
        
        $this->db->trans_complete();
        
        return $insert_id;
    }
    
    /**
     * This function used to get alternative information by id
     * @param number $alternativeId : This is alternative id
     * @return array $result : This is alternative information
     */
    function getAlternativeInfo($alternativeId)
    {
        $this->db->select('*');
        $this->db->from('alternative');
        $this->db->where('id', $alternativeId);
        $query = $this->db->get();
        
        return $query->row();
    }
    
    
    /**
     * This function is used to update the alternative information
     * @param array $alternativeInfo : This is alternatives updated information
     * @param number $alternativeId : This is alternative id
     */
    function editAlternative($alternativeInfo, $alternativeId)
    {
        $this->db->where('id', $alternativeId);
        $this->db->update('alternative', $alternativeInfo);
        
        return TRUE;
    }
    
    
    
    /**
     * This function is used to delete the alternative information
     * @param number $alternativeId : This is alternative id
     * @return boolean $result : TRUE / FALSE
     */
    function deleteAlternative($id)
    {
        $this->db->where('id', $id);
        $this->db->delete('alternative');
        
        return 1;
    }

    /**
     * This function used to get alternative information by id
     * @param number $alternativeId : This is alternative id
     * @return array $result : This is alternative information
     */
    function getAlternativeInfoById($alternativeId)
    {
        $this->db->select('*');
        $this->db->from('alternative');
        $this->db->where('id', $alternativeId);
        $query = $this->db->get();
        
        return $query->row();
    }
}