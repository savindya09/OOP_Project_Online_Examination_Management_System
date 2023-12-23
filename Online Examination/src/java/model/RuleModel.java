
package model;

import common.SystemVarList;
import common.proctordata;
import connection.DB;
import java.sql.ResultSet;

public class RuleModel {
    
    public int saveRule(String name){
        try {
            DB.iud("insert into rules(data,status) values('"+name+"','1')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public ResultSet getAllRule(){
        try{
            ResultSet s=DB.search("select * from rules where status='1'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateRule(String pid,String name){
       try {
            DB.iud("update rules set data='"+name+"' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    
    public int deleteRule(String pid){
//       try {
//            DB.iud("delete from rules where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update rules set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
   
}
