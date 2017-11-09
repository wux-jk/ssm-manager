package com.zihexin.user.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/11/6.
 */
public class Roles implements Serializable{
    private Integer rolesID;

    private String rolesName;

    private Integer userID;

    public Integer getUserID() {
        return userID;
    }

    public void setUserID(Integer userID) {
        this.userID = userID;
    }

    public Integer getRolesID() {
        return rolesID;
    }

    public void setRolesID(Integer rolesID) {
        this.rolesID = rolesID;
    }

    public String getRolesName() {
        return rolesName;
    }

    public void setRolesName(String rolesName) {
        this.rolesName = rolesName;
    }
}
