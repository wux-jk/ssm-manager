package com.zihexin.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2017/10/26 0026.
 */
@Controller
@RequestMapping("/")
public class PageController {

    /**
     * 页面跳转 到搜索商品页面
     * @param
     * @return
     */
    @RequestMapping(value = "edit.jhtml", method = RequestMethod.GET)
    public ModelAndView showPage(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("queryGood");
        return modelAndView;
    }

    @RequestMapping(value = "toquery.jhtml", method = RequestMethod.GET)
    public ModelAndView toquery(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("enditGood");
        return modelAndView;
    }


    /**
     * 跳转到用户展示列表
     * @return
     */
    @RequestMapping("toUserList.jhtml")
       public ModelAndView toUserList(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userList");
        return modelAndView;
    }


}
