package com.zihexin.user.mapper;

import com.zihexin.user.entity.User;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public interface UserMapper {


    @Select( "select t_userID as \"userID\",t_userName as \"userName\",t_password as \"userPassword\" from t_user where" +
            " t_userName = \"userName\" and  t_password = \"userPassword\" ")
    User queryLogin(User user);
}
