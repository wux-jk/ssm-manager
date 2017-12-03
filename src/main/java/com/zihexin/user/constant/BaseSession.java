package com.zihexin.user.constant;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/11/30 0030.
 */
public abstract class BaseSession {

    //获取上下文对应的request请求
    public static HttpServletRequest getRequest(){
        ServletRequestAttributes attrs = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return attrs.getRequest();
    }

    //获取request请求包含的session对象
    public static HttpSession getSession(){
        HttpSession session = null;
        try {
            session = getRequest().getSession();
        }catch (Exception e){
            e.printStackTrace();
        }

        return session;
    }

}
