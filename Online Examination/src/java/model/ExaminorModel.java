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
public class ExaminorModel {
    public int saveExaminor(String name,String email,String mobile){
        try {
            DB.iud("insert into examinator(name,email,mobile,password,status) values('"+name+"','"+email+"','"+mobile+"','ABC123','1')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public ResultSet getAllExaminor(){
        try{
            ResultSet s=DB.search("select * from examinator where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateExaminor(String pid,String name,String mobile){
       try {
            DB.iud("update examinator set name='"+name+"',mobile='"+mobile+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int updateExaminorPassword(String pid,String password){
       try {
            DB.iud("update examinator set password='"+password+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int deleteExaminor(String pid){
//       try {
//            DB.iud("delete from examinator where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update examinator set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int[] loginExaminor(String email,String password){
        try{
            ResultSet s=DB.search("select id,password from examinator where email='"+email+"' and status='1'");
            if(s.next()){
                String m=s.getString("password");
                String mid=s.getString("id");
            if(m.equals(password)){
                int a=1;
                return new int[] {SystemVarList.LOGIN_SUCCESS,a};
            }else{
                return new int[] {SystemVarList.LOGIN_FAILURE,0};
            }
            }
            
        }catch(Exception e){
            e.printStackTrace();
            return new int[] {SystemVarList.LOGIN_FAILURE,0};
            
        }
        return new int[] {SystemVarList.LOGIN_FAILURE,0};
    }
    public ResultSet dataExaminor(String id){
        try{
            
            ResultSet s=DB.search("select * from examinator where id='"+id+"'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
}
