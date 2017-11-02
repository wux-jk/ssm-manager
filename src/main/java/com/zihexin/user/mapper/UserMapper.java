package com.zihexin.user.mapper;

import com.zihexin.user.entity.User;
import org.apache.ibatis.annotations.Select;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public interface UserMapper {


    @Select("select userID as \"userID\",userName as \"userName\",userPassword as \"userPassword\" from users where" +
            " userName = #{userName} ")
    User queryLogin(User user);
}
