package com.zihexin.user.controller;

import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;

import com.zihexin.user.entity.Roles;
import com.zihexin.user.entity.User;

import com.zihexin.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
public class UserController extends BaseController {

    @Autowired
    private UserService userService;


    /**
     * 登录验证用户
     * @param user
     * @param request
     * @return
     */
    @RequestMapping("LoginAuthentication")
    @ResponseBody
    Map<String,Object> loginUser(User user,HttpServletRequest request){

            //查询用户信息
         Map<String,Object> map = userService.loginUser(user,request);

        return  map;


    }




    /**
     *查询用户列表
     * @param user
     * @param response
     */
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
     * 角色操作跳转页面
     * @param ma
     * @param user
     * @return
     */
    @RequestMapping("toUserRoles")
    public String toUserRoles(ModelMap ma,User user){
        ma.addAttribute("userID",user.getUserID());
        return "user/userRole";
    }

    //修改用户回显
    @RequestMapping("findUserByid")
    public ModelAndView findUserByid(User user,HttpServletResponse response){


        ModelAndView mv=new ModelAndView();
        User usList=userService.findUserByid(user);
        mv.addObject("user",usList);
        mv.setViewName("user/updateUser");
        return mv;
    }


    /**
     * 修改用户
     * @param user
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateUser")
    public void updateUser(User user,HttpServletResponse response)throws Exception{
        userService.updateUser(user);


    }



    //跳转到新增用户
    @RequestMapping("toUserPage")
    public ModelAndView toUserPage(User user){
        ModelAndView ma=new ModelAndView();
        ma.setViewName("user/insertUser");
        return ma;
    }

    /**
     * <pre>insertUser(新增用户信息)
     * @param
     * @return</pre>
     */
    @RequestMapping("insertUserInfo")
    @ResponseBody
    public String insertUserInfo(User user) {
        userService.insertUserInfo(user);
        //重定向
        return "{}";
    }


}
