/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import common.SystemVarList;
import connection.DB;

/**
 *
 * @author Sam
 */
public class Examinor_SubjectModel {
    public int saveExaminorSubject(String exid,String subid){
        try {
            DB.iud("insert into examinator_subject(examinator_id,subject_id,status) values('"+exid+"','"+subid+"','1')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public int deleteExaminorSubject(String pid){
//       try {
//            DB.iud("delete from examinator_subject where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update examinator_subject set status='0' where id='"+pid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
}
