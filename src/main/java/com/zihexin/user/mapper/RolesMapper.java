package com.zihexin.user.mapper;

import com.zihexin.user.entity.Roles;

import java.util.List;

/**
 * Created by Administrator on 2017/11/9 0009.
 */
public interface RolesMapper {

    List<Roles> selectUserRoleListJson(Roles roles);
    void insertUserRolesList(Roles roleRequestList);
    void deleteAllRolesByUserID(Roles roles);

}
