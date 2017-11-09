package com.zihexin.user.controller;

import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Roles;
import com.zihexin.user.entity.User;

import com.zihexin.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
@Controller
@RequestMapping("/login")
public class UserController extends BaseController{

    @Autowired
    private UserService userService;


    @RequestMapping("LoginAuthentication")
    @ResponseBody
    Map<String,Object> loginUser(User user,HttpServletRequest request){

            //查询用户信息
         Map<String,Object> map = userService.loginUser(user,request);

        return  map;


    }


    /**
     53      *查询用户列表
     54      * @param user
     55      * @param response
     56      */
         @RequestMapping("queryUserList")
         @ResponseBody
        public void queryUserList(User user,HttpServletResponse response) {
             List<User> userList=new ArrayList<User>();
                 try {
                     userList= userService.queryUserList(user);
                     }catch (Exception e){
                         e.printStackTrace();
                     }
             writeJson(userList,response);
      }

    /**
     71      * 角色操作跳转页面
     72      * @param ma
     73      * @param user
     74      * @return
     75      */
    @RequestMapping("toUserRoles")
    public String toUserRoles(ModelMap ma,User user){
        ma.addAttribute("userID",user.getUserID());
        return "/userRole";

    }

    /**
     83      * 用户附角色 查询用户角色 ztree
     84      * @return
     85      */
         @RequestMapping("selectUserRoleListJson")
         @ResponseBody
         public List<Roles> selectUserRoleListJson(Roles roles){
             List<Roles> rolesList=userService.selectUserRoleListJson(roles);
             return rolesList;

         }




}
