package com.zihexin.user.controller;

import com.zihexin.user.entity.User;

import com.zihexin.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
@Controller
@RequestMapping("/login")
public class UserController {

    @Autowired
    private UserService userService;


    @RequestMapping("LoginAuthentication")
    @ResponseBody
    Map<String,Object> loginUser(User user,HttpServletRequest request){

            //查询用户信息
         Map<String,Object> map = userService.loginUser(user,request);

        return  map;


    }






}
