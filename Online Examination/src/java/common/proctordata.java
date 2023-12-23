/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.sql.ResultSet;

/**
 *
 * @author Sam
 */
public class proctordata {

    private int id;
    private String name;
    private String email;
    private String mobile;
    private String password;
    private int status;

    public proctordata(int id, String name, String email, String mobile, String password, int status) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.password = password;
        this.status = status;
    }

    public proctordata() {
        this.id = id;
        this.name = name;
        this.email = email;
        this.mobile = mobile;
        this.password = password;
        this.status = status;
    }

    public proctordata(ResultSet s) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getMobile() {
        return mobile;
    }

    public int getStatus() {
        return status;
    }
}
