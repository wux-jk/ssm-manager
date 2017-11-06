package com.zihexin.user.service;

import com.zihexin.user.entity.User;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/24 0024.
 */
public interface UserService {


    Map<String,Object> loginUser(User user,HttpServletRequest request);
}
