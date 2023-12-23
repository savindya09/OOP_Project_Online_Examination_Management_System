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
public class ExamModel {
   public ResultSet getAllExam(){
        try{
            ResultSet s=DB.search("select * from exam where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateExam(String exid,String name,String date,String duration,String bacthid,String paperid){
       try {
            DB.iud("update exam set name='"+name+"',datetime='"+date+"',duration='"+duration+"',batch_id='"+bacthid+"',paper_id='"+paperid+"' where id='"+exid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int saveExam(String name,String ddate,String dduration,String batch,String paper,String adminid){
        try {
            DB.iud("insert into exam(name,datetime,duration,batch_id,admin_id,paper_id,status) values('"+name+"','"+ddate+"','"+dduration+"','1','"+batch+"','"+adminid+"','"+paper+"')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public int deleteExam(String pid){
//       try {
//            DB.iud("delete from exam where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update exam set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public ResultSet dataExam(String id){
        try{
            
            ResultSet s=DB.search("select * from exam where id='"+id+"'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
}
