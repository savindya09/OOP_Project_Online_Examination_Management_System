/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import connection.DB;
import java.sql.ResultSet;

/**
 *
 * @author Sam
 */
public class CustomModel {

    public ResultSet ExaminorSubject(String id) {
        try {

            ResultSet s = DB.search("select examinator_subject.id as subid,subject.name as subname from examinator_subject inner join subject on examinator_subject.subject_id=subject.id where examinator_subject.examinator_id='" + id + "' and examinator_subject.status='1'");

            return s;

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
    }
    public ResultSet AllExaminorSubject() {
        try {

            ResultSet s = DB.search("select examinator_subject.id as exsubid,subject.name as subname,examinator.name as exname from examinator_subject inner join subject on examinator_subject.subject_id=subject.id inner join examinator on examinator.id=examinator_subject.examinator_id where examinator_subject.status='1'");

            return s;

        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
    }
}
