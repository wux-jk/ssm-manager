package com.zihexin.user.controller;

import com.zihexin.user.entity.Roles;
import com.zihexin.user.service.RolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2017/11/9 0009.
 */
@Controller
@RequestMapping("/roles")
public class RolesController {

    @Autowired
    private RolesService rolesService;

    /**
     * 用户附角色 查询用户角色 ztree
     * @return
     */
    @RequestMapping("selectUserRoleListJson")
    @ResponseBody
    public List<Roles> selectUserRoleListJson(Roles roles){
        List<Roles> rolesList=rolesService.selectUserRoleListJson(roles);
        return rolesList;
    }

    /**
     * 修改用户角色   把之前的角色删掉  在重新添加一个
     * @param roleRequestList
     * @return
     */
    @RequestMapping("updateUserRole")
    @ResponseBody
    String updateUserRole(@RequestBody List<Roles> roleRequestList) {
        rolesService.updateUserRole(roleRequestList);
        return "{}";
    }


}
