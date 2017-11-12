package com.zihexin.user.entity;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/11/6.
 */
public class Roles implements Serializable{
    private Integer rolesID;

    private String rolesName;

    private Integer userID;

    private Integer id;

    private String name;

    private Integer pid;

    private boolean checked;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

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
