package com.zihexin.user.mapper;

import com.zihexin.user.entity.User;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public interface UserMapper {


    @Select("select u.userName as \"userName\",u.userPassword as \"userPassword\",r.role_Name as  \"rolesName\" from users u,t_roles r,t_u_r_center ur " +
            " where u.userID=ur.userID and ur.rolesID=r.role_ID and u.userName = #{userName} ")
    User queryLogin(User user);
}
