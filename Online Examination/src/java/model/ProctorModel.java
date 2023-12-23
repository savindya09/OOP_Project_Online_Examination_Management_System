
package model;

import common.SystemVarList;
import common.proctordata;
import connection.DB;
import java.sql.ResultSet;

public class ProctorModel {
    public int saveProctor(String name,String email,String mobile){
        try {
            DB.iud("insert into proctor(name,email,mobile,password,status) values('"+name+"','"+email+"','"+mobile+"','ABC123','1')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public ResultSet getAllProctor(){
        try{
            ResultSet s=DB.search("select * from proctor where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateProctor(String pid,String name,String mobile){
       try {
            DB.iud("update proctor set name='"+name+"',mobile='"+mobile+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int updateProctorPassword(String pid,String password){
       try {
            DB.iud("update proctor set password='"+password+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int deleteProctor(String pid){
//       try {
//            DB.iud("delete from proctor where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update proctor set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    public int[] loginProctor(String email,String password){
        try{
            ResultSet s=DB.search("select id,password from proctor where email='"+email+"' and status='1'");
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
    public ResultSet dataProctor(String id){
        try{
            
            ResultSet s=DB.search("select * from proctor where id='"+id+"'");
               
                return s;
            
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
}
