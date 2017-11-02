package com.zihexin.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.service.GoodService;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
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



    @RequestMapping("/updateGood")
     public void updateGood(Good good,HttpServletResponse response)throws Exception{
        goodService.updateGood(good);
        System.out.println("输出----------------------------------"+ good);
        System.out.println(good);

    }

   /* @RequestMapping("imageUpload")
    @ResponseBody
    public JSONObject imageUpload(HttpServletRequest request,HttpServletResponse response){
        HashMap<String, String> extMap = new HashMap<String, String>();
             //支持的文件类型
             extMap.put("image", "jpg,jpeg,png,bmp");
            //最大文件大小
             long maxSize = 32505856;

             //是否选择文件

    }*/





}
