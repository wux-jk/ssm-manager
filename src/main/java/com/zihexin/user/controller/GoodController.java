package com.zihexin.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;

import com.zihexin.user.entity.User;
import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.CacheProperties;
import com.zihexin.user.util.FastDFSClient;
import com.zihexin.user.util.StaticFileServerUtil;
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
import java.io.File;
import java.util.*;

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


    /**
     * 查询商品
     * @param good
     * @param response
     */
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


    /**
     * <pre>insertUser(新增商品信息)
     * @param
     * @return</pre>
     */
    @RequestMapping("insertGoodInfo")
    @ResponseBody
    public String insertGoodInfo(MallItem mallItem,MallProductInfo mallProductInfo) {
        goodService.insertGoodInfo(mallItem,mallProductInfo);
        //重定向
        return "{}";
    }


    //回显
    @RequestMapping("findGoodByid")
    public ModelAndView findGoodByid(Good good,HttpServletResponse response){
        ModelAndView mav=new ModelAndView();
        Good updList=goodService.findGoodByid(good);
        mav.addObject("us",updList);
        mav.setViewName("good/upGood");
        return mav;
    }




    /**
     * 预览商品
     * @param good
     * @param request
     * @return
     */
    @RequestMapping("findKinderitor")
    public ModelAndView findKinderitor(Good good,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
       Good goodDesc=goodService.findKinderitor(good);
        mv.addObject("us",goodDesc);
        mv.setViewName("good/queryGoodDesc");
        return mv;
    }




    /**
     * 跳转到商品上架 商品库存页面
     * @return
     */
    @RequestMapping(value="/toPutawayGood", method = RequestMethod.GET)
    public ModelAndView toPutawayGood(String goodID,HttpServletRequest request){
        Map<String, String> model = new HashMap<String, String>();
        model.put("goodID",goodID);
        ModelAndView mav = new ModelAndView("good/goodRepetroy",model);
        return mav;
    }

    /**
     * 修改商品
     * @param good
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateGood")
     public void updateGood(Good good,HttpServletResponse response)throws Exception{
        goodService.updateGood(good);


    }

   //修改状态  下架
    @RequestMapping("/updateGoodStatus")
    @ResponseBody
    public void updateGoodStatus(Good good) throws Exception{
        System.out.println(good.getGoodStatus());
        goodService.updateGoodStatus(good);
    }

    //修改状态  上架
    @RequestMapping("/upGoodOnStatusStock")
    @ResponseBody
    public void upGoodOnStatusStock(Good good,HttpServletResponse response) throws Exception{
        goodService.upGoodOnStatusStock(good);
    }


    /**
     * 图片上传
     * @param uploadFile
     * @return
     */
    @RequestMapping("/pic/upload")
    @ResponseBody
    public Map uploadFile(MultipartFile uploadFile ) {

        try {

            //把图片上传的图片服务器
            FastDFSClient fastDFSClient = new FastDFSClient("classpath:conf/client.conf");
            //取文件扩展名
            String originalFilename = uploadFile.getOriginalFilename();
            String extName = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
            //得到一个图片的地址和文件名  执行上传
            String url = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
            //补充为完整的url
            url = IMAGE_SERVER_URL + url;
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
