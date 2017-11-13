package com.zihexin.user.service.impl;

import com.zihexin.user.constant.Constanr;
import com.zihexin.user.entity.Good;

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
    private UserMapper userMapper;


    /**
     *  登录   验证用户
     * @param user
     * @param request
     * @return
     */
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
            //把用户信息存入session
            session.setAttribute("userInfo",user1);
        }else {
            map.put("falg" ,Constanr.LOGIN_PWD_ERROR);//密码错误
        }
        return map;
    }

    /**
     * 查询用户列表
     * @param user
     * @return
     */
    @Override
    public List<User> queryUserList(User user) {
        return userMapper.queryUserList(user);
    }


    /**
     * 角色操作  修改用户角色
     * @param roleRequestList
     */
    @Override
    public void updateUserRole(List<Roles> roleRequestList) {
        //删除用户之前的而所有角色
        userMapper.deleteAllRolesByUserID(roleRequestList.get(0));

        //在添加用户勾选的所有角色
        userMapper.insertUserRolesList(roleRequestList);
    }

    /**
     * 查用户id  做回显
     * @param user
     * @return
     */
    @Override
    public User findUserByid(User user) {
        return userMapper.findUserByid(user);
    }


    /**
     * 修改用户
     * @param user
     */
    @Override
    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    /**
     * 新增用户信息
     * @param user
     */
    @Override
    public void insertUserInfo(User user) {
        userMapper.insertUserInfo(user);
    }
}
