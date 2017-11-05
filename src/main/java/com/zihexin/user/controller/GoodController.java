package com.zihexin.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.FastDFSClient;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

    @Value("${IMAGE_SERVER_URL}")
    private String IMAGE_SERVER_URL;

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


    /**
     * 修改
     * @param good
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateGood")
     public void updateGood(Good good,HttpServletResponse response)throws Exception{
        goodService.updateGood(good);


    }

    @RequestMapping("/pic/upload")
    @ResponseBody
    public Map uploadFile(MultipartFile uploadFile ) {
        try {

            //b把图片上传到图片服务器
            FastDFSClient fastDFSClient = new FastDFSClient("classpath:conf/client.conf");
            //取扩展名
            String originalFilename = uploadFile.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
          //得到一个图片的地址和文件
            String url = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
            //补充完整的URL
            url = "http://192.168.25.133/" + url;
            //封装到map中返回
            Map result = new HashMap<>();
            result.put("error", 0);
            result.put("url", url);
            return result;
        } catch (Exception e) {
            e.printStackTrace();
            Map result = new HashMap<>();
            result.put("error", 1);
            result.put("message", "图片上传失败");
            return result;
        }
    }








}
