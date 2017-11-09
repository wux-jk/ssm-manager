package com.zihexin.user.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public class User implements Serializable{

    private Integer userID;

    private String userName;

    private String userPassword;

    private Integer rolesID;

    public Integer getRolesID() {
        return rolesID;
    }

    public void setRolesID(Integer rolesID) {
        this.rolesID = rolesID;
    }

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }



}
