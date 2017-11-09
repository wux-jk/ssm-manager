package com.zihexin.user.service.impl;

import com.zihexin.user.constant.Constanr;
import com.zihexin.user.entity.Roles;
import com.zihexin.user.entity.User;
import com.zihexin.user.mapper.UserMapper;
import com.zihexin.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    UserMapper userMapper;


    @Override
    public Map<String, Object> loginUser(User user,HttpServletRequest request) {
        HttpSession session = request.getSession();
        Map<String,Object> map=new HashMap<String,Object>();
        //查询用户
       User user1= userMapper.queryLogin(user);

        if (user1==null){
            map.put("falg" , Constanr.LOGIN_USER_ERROR);//用户名不存在
        }else if (user1.getUserPassword().equals(user.getUserPassword())){
            map.put("falg" ,Constanr.LOGIN_SUCCESS);//登录成功
            session.setAttribute("userInfo",user1);
        }else {
            map.put("falg" ,Constanr.LOGIN_PWD_ERROR);//密码错误
        }
        return map;
    }

    @Override
    public List<User> queryUserList(User user) {
        return userMapper.queryUserList(user);
    }


    @Override
    public List<Roles> selectUserRoleListJson(Roles roles) {
        return userMapper.selectUserRoleListJson(roles);
    }
}
