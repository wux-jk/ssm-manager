package com.zihexin.user.mapper;

import com.zihexin.user.entity.Roles;
import com.zihexin.user.entity.User;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public interface UserMapper {


    @Select("select u.t_userName as \"userName\",u.t_password as \"userPassword\",r.rolesID as \"rolesID\" from t_user u,t_roles r,t_u_r_center ur " +
            "  where u.t_userID=ur.t_userID and ur.rolesID=r.rolesID and t_userName = #{userName} ")
    User queryLogin(User user);

    @Select("select t_userID as \"userID\",t_userName as \"userName\" from t_user ")
    List<User> queryUserList(User user);

    @Select("select ")
    List<Roles> selectUserRoleListJson(Roles roles);
}
