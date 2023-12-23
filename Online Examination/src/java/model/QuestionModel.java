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
public class QuestionModel {
    public int saveQuestion(String question,String a,String b,String c,String d,String answer,String pid){
        try {
            DB.iud("insert into qa(question,a,b,c,d,correct,status,paper_id) values('"+question+"','"+a+"','"+b+"','"+c+"','"+d+"','"+answer+"','1','"+pid+"')");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        }
    }
    public ResultSet getAllQuestion(String id){
        try{
            ResultSet s=DB.search("select * from qa where status='1' and paper_id='"+id+"'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public ResultSet getAllQuestionOne(String id){
        try{
            ResultSet s=DB.search("select * from qa where status='1' and id='"+id+"'");
            return s;
        }catch(Exception e){
            e.printStackTrace();
            return null;
            
        }
    }
    public int updateQuestion(String qid,String question,String a,String b,String c,String d,String answer){
       try {
            DB.iud("update qa set question='"+question+"',a='"+a+"',b='"+b+"',c='"+c+"',d='"+d+"',correct='"+answer+"' where id='"+qid+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
    
    public int deleteQuestion(String did){
//       try {
//            DB.iud("delete from qa where id='"+pid+"'");
//            return SystemVarList.SAVE_SUCCESS;
//        } catch (Exception e) {
//            e.printStackTrace();
//            return SystemVarList.SAVE_FAILURE;
//        }
        try {
            DB.iud("update qa set status='0' where id='"+did+"'");
            return SystemVarList.SAVE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return SystemVarList.SAVE_FAILURE;
        } 
    }
}
