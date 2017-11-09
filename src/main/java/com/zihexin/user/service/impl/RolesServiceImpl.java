package com.zihexin.user.service.impl;

import com.zihexin.user.entity.Roles;
import com.zihexin.user.mapper.RolesMapper;
import com.zihexin.user.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/9 0009.
 */
@Service
public class RolesServiceImpl implements RolesService {

    @Autowired
    private RolesMapper rolesMapper;

    /**
     * 用户附角色 查询用户角色 ztree
     * @return
     */
    @Override
    public List<Roles> selectUserRoleListJson(Roles roles) {

        return rolesMapper.selectUserRoleListJson(roles);
    }
}
