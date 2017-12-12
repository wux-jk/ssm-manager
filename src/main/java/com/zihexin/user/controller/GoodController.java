package com.zihexin.user.controller;

import com.alibaba.fastjson.JSONObject;
import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;


import com.zihexin.user.entity.User;

import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang3.StringUtils;
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
import javax.servlet.http.HttpSession;
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
     * 条件 查询商品
     * @param
     * @param response
     */
    @RequestMapping("/queryGoodList")
    @ResponseBody
    public String queryGoodList(HttpServletRequest request,MallProductInfo mallProductInfo,HttpServletResponse response) {
        //List goodList=new ArrayList<>();
        String goodList="";
        try {
            String pageIndex=request.getParameter("page");
            String pageSize=request.getParameter("rows");
            mallProductInfo.setPageIndex(Integer.valueOf(pageIndex)-1);
            mallProductInfo.setPageSize(Integer.valueOf(pageSize));
            mallProductInfo.setPageNumber(pageSize);
            goodList= goodService.queryGoiodList(mallProductInfo);
        }catch (Exception e){
            e.printStackTrace();
        }

        JSONObject jsonObject = JSONObject.parseObject(goodList);
        String json = jsonObject.toString();
       /* writeJson(goodList, response);*/
        return json;

    }


    /**
     * 查询京东商品信息
     */
    @RequestMapping("/queryItemList")
    @ResponseBody
    public String queryItemList(MallItem mallItem,HttpServletResponse response){
       String item="";
        try {
            item  = goodService.queryItemList(mallItem);

        }catch (Exception e){
            e.printStackTrace();
        }
       return item;
    }


    /**
     * <pre>insertinfo导入商品库)
     * @param
     * @return</pre>
     */
    @RequestMapping("insertGoodInfo")
    @ResponseBody
    public String insertGoodInfo(MallItem mallItem,MallProductInfo mallProductInfo) {

      String recode =  goodService.insertGoodInfo(mallItem, mallProductInfo);
        //重定向
        return recode;
    }


    //回显 查id
    @RequestMapping("findGoodByid")
    public ModelAndView findGoodByid(MallProductInfo mallProductInfo,HttpServletResponse response){
        ModelAndView mav=new ModelAndView();
        List<MallProductInfo> updList=goodService.findGoodByid(mallProductInfo);
        mav.addObject("us",updList.get(0));
        mav.setViewName("good/upGood");
        return mav;
    }


    /**
     * 修改商品 并插入日志表 新增快照表快照表
     * @param
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateProductInfo")
    public void updateProductInfo(MallProductInfo mallProductInfo,User user,HttpServletResponse response,HttpServletRequest request)throws Exception{
        HttpSession session = request.getSession();
        User users = (User) session.getAttribute("userInfo");
        mallProductInfo.setUserName(users.getUserName());
        goodService.updateProductInfo(mallProductInfo);


    }

    /**
     * 预览商品
     * @param
     * @param request
     * @return
     */
    @RequestMapping("findKinderitor")
    public ModelAndView findKinderitor(MallProductInfo mallProductInfo,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        List<MallProductInfo> proDesc=goodService.findKinderitor(mallProductInfo);
        mv.addObject("us",proDesc.get(0));
        mv.setViewName("good/queryGoodDesc");
        return mv;
    }




    /**
     * 跳转到商品上架 商品库存页面
     * @return
     */
    @RequestMapping(value="/toPutawayGood", method = RequestMethod.GET)
    public ModelAndView toPutawayGood(String product_ID, HttpServletRequest request){
        Map<String, String> model = new HashMap<String, String>();
        model.put("product_ID",product_ID);
        ModelAndView mav = new ModelAndView("good/goodRepetroy",model);
        return mav;
    }



   //修改状态  下架
    @RequestMapping("/updateGoodStatus")
    @ResponseBody
    public void updateGoodStatus(MallProductInfo mallProductInfo,HttpServletResponse response) throws Exception{
        goodService.updateGoodStatus(mallProductInfo);
    }

    //修改状态  上架
    @RequestMapping("/upGoodOnStatusStock")
    @ResponseBody
    public void upGoodOnStatusStock(MallProductInfo mallProductInfo,HttpServletResponse response) throws Exception{
        goodService.upGoodOnStatusStock(mallProductInfo);
    }


    /**
     * 图片上传
     * @param uploadFile
     * @return
     */
    @RequestMapping("/pic/upload")
    @ResponseBody
    public String uploadFile(MultipartFile uploadFile ) {

        try {


            //取文件扩展名
           String originalFilename = uploadFile.getOriginalFilename();
           String orgName = originalFilename.substring(originalFilename.lastIndexOf(".") );
            //给文件名随机一个ID  避免重名覆盖原来的文件
            String randomName=UUID.randomUUID().toString() + orgName;
             String pic_path="";
            //获取Tomcat服务器所在的路径
            String tomcat_path = System.getProperty( "user.dir" );
            //获取Tomcat服务器所在路径的最后一个文件目录
            String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("\\")+1,tomcat_path.length());
            //若最后一个文件目录为bin目录，则服务器为手动启动
            if(("bin").equals(bin_path)){//手动启动Tomcat时获取路径为：D:\Software\Tomcat-8.5\bin
                //获取保存上传图片的文件路径
                pic_path = tomcat_path.substring(0,System.getProperty( "user.dir" ).lastIndexOf("\\")) +"\\webapps"+"\\img\\";
            }else{//服务中自启动Tomcat时获取路径为：D:\Software\Tomcat-8.5
                pic_path = tomcat_path+"\\webapps"+"\\img\\";
            }
            File filePath=new File(pic_path);
            if(!filePath.exists()){
               filePath.mkdir();
            }
            File fileDir = new File(pic_path+randomName);
            String fileName="xxx.jpg";
            uploadFile.transferTo(fileDir);
             String dir = StaticFileServerUtil.sendPost( CacheProperties.RESOURCE_SERVER_URL + CacheProperties.UPLOAD_DIR + fileName,fileDir);
             fileDir.delete();

            //封装到map中返回
            Map result = new HashMap<>();
            result.put("error", 0);
            result.put("url", CacheProperties.RESOURCE_SERVER_URL+dir);
           String json = JsonUtils.objectToJson(result);
            return json;
        } catch (Exception e) {
            e.printStackTrace();
            Map result = new HashMap<>();
            result.put("error", 1);
            result.put("message", "图片上传失败");
            String json = JsonUtils.objectToJson(result);
            return json;

        }
    }








}
