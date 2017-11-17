package com.zihexin.user.service;

import com.zihexin.user.entity.Roles;

import java.util.List;

/**
 * Created by Administrator on 2017/11/9 0009.
 */
public interface RolesService {

    List<Roles> selectUserRoleListJson(Roles roles);


    void updateUserRole(List<Roles> roleRequestList);
}
