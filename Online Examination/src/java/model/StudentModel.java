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
public class StudentModel {
   public int saveStudent(String name,String email,String mobile,String b_id){
        try {
            DB.iud("insert into student(name,email,mobile,password,status,batch_id) values('"+name+"','"+email+"','"+mobile+"','ABC123','1','"+b_id+"')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public ResultSet getAllStudent(){
        try{
            ResultSet s=DB.search("select * from student where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateStudent(String pid,String name,String mobile){
       try {
            DB.iud("update student set name='"+name+"',mobile='"+mobile+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int updateStudentPassword(String pid,String password){
       try {
            DB.iud("update student set password='"+password+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int deleteStudent(String pid){
//       try {
//            DB.iud("delete from student where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update student set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int[] loginStudent(String email,String password){
        try{
            ResultSet s=DB.search("select id,password from student where email='"+email+"' and status='1'");
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
    public ResultSet dataStudent(String id){
        try{
            
            ResultSet s=DB.search("select * from student where id='"+id+"'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    } 
}
