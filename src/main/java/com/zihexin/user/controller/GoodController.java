package com.zihexin.user.controller;

import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */

@Controller
@RequestMapping("/good")
public class GoodController extends BaseController {

    private Good good = new Good();

    @Autowired
    private GoodService goodService;


    @RequestMapping("/queryGoodList")
    @ResponseBody
    public void queryGoodList(Good good,HttpServletResponse response) {
        List<Good> goodList=new ArrayList<Good>();
        try {
            goodList= goodService.queryGoiodList(good);
        }catch (Exception e){
            e.printStackTrace();
        }
        writeJson(goodList,response);

    }

  /* @RequestMapping("findGoodByid")
    public String findGoodByid(Good good,HttpServletRequest request)throws Exception{
            List<Good> us=goodService.findGoodByid(good);
       System.out.println(us);
            request.setAttribute("us",us);
            return "upGood";

    }*/
   //回显
   @RequestMapping("findGoodByid")
   public ModelAndView findGoodByid(Good good,HttpServletResponse response){
       ModelAndView mav=new ModelAndView();
       Good updList=goodService.findGoodByid(good);
       mav.addObject("us",updList);
       mav.setViewName("upGood");
       return mav;
   }






}
