/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import common.SystemVarList;
import connection.DB;
import java.sql.ResultSet;

/**
 *
 * @author Sam
 */
public class PaperModel {
    public ResultSet getAllPaper(){
        try{
            ResultSet s=DB.search("select * from paper where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public ResultSet PaperData(String id){
        try{
            
            ResultSet s=DB.search("select * from paper where examinator_subject_id='"+id+"' and status='1'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updatePaper(String pid,String name,String qcount){
       try {
            DB.iud("update paper set name='"+name+"',qcount='"+qcount+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    
    public int deletePaper(String pid){
//       try {
//            DB.iud("delete from paper where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update paper set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int savePaper(String name,String count,String sid){
        try {
            DB.iud("insert into paper(name,qcount,status,examinator_subject_id) values('"+name+"','"+count+"','1','"+sid+"')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
}
