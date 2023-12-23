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
public class AdminModel {
    public int[] loginAdmin(String email,String password){
        try{
            ResultSet s=DB.search("select id,password from admin where email='"+email+"' and status='1'");
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
    public ResultSet dataAdmin(String id){
        try{
            
            ResultSet s=DB.search("select * from admin where id='"+id+"'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateAdmin(String pid,String name){
       try {
            DB.iud("update admin set name='"+name+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int updateAdminPassword(String pid,String password){
       try {
            DB.iud("update admin set password='"+password+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
}
