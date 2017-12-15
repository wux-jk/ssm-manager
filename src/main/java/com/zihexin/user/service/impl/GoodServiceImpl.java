package com.zihexin.user.service.impl;



import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.zihexin.user.entity.Good;


import com.zihexin.user.entity.User;

import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;


import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.CommonUrl;
import com.zihexin.user.util.JsonUtils;
import com.zihexin.user.util.http.HttpClientUtil;

import net.sf.json.JSONObject;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */
@Service
public class GoodServiceImpl implements GoodService{



    //条查；查询商品信息表列表
    @Override
    public String queryGoiodList(MallProductInfo mallProductInfo) {

        //把对象转成json
        JSONObject proJson = JSONObject.fromObject(mallProductInfo);
         String str = proJson.toString();
        String url = CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/queryGoodInfo.cp";
        String doPost = HttpClientUtil.doPostHttp(url, str);
        doPost=doPost.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
        try {
            doPost=URLDecoder.decode(doPost, "UTF-8");
          } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
         return doPost;


    }



    /**
     * 查询京东商品信息
     * @param mallItem
     * @return
     */
    @Override
    public String queryItemList(MallItem mallItem) {
        Map map = new HashMap<>();
      /*  String channelId="";
       if (StringUtils.isNoneEmpty(mallItem.getChannel_ID()) &&  "1001".equals(mallItem.getChannel_ID())){
         channelId="JD";
        }*/

        map.put("channelId",mallItem.getChannel_ID());
        map.put("sku",mallItem.getChannel_Sku());
        map.put("queryExts","appintroduce");
        JSONObject itemJjson = JSONObject.fromObject(map);
        String item= itemJjson.toString();
        String url = CommonUrl.PRODUCTINFO_URL +  "WelfareMall-management/product/queryProductDetail.cp";
        String doPost = HttpClientUtil.doPostHttp(url, item);
        doPost=doPost.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
        try {
            doPost = URLDecoder.decode(doPost, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

          return doPost;
    }



    /**
     * 导入商品信息
     * @param
     */
    @Override
    public String insertGoodInfo(MallItem mallItem,MallProductInfo mallProductInfo) {

        Map<String,Object> map = new HashMap<>(); //截取供应商的地址
        String str =  mallItem.getImg_url().substring(11); //截取URL的img标签
        int i = str.lastIndexOf("'");
        String substring = str.substring(0, str.length()-4);
        mallItem.setImg_url(substring);

        //截取zhx商品信息的url地址
        String ss = mallProductInfo.getImg_Url().replace("alt=\"\"","");//todo 替换方法太糙
        ss = ss.substring(ss.indexOf("http"));
        int j = ss.indexOf("\"");
        String subs = ss.substring(0,j);//todo 只有第一张图会上传
        mallProductInfo.setImg_Url(subs);
        map.put("mallItem",mallItem);
        map.put("productInfo",mallProductInfo);

        //把map转成json
        JSONObject mjson = JSONObject.fromObject(map);
        String strMap = mjson.toString();
        String url = CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/insertGoodInfo.cp";
        String doPost = HttpClientUtil.doPostHttp(url, strMap);
//E:\workspase-good\WelfareMall\WelfareMall-operation
       try {
            doPost =(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        return doPost;

    }


    /***
     * 修改商品  并新增日志表 新增快照表
     * @param mallProductInfo
     */
    @Override
    public void updateProductInfo(MallProductInfo mallProductInfo) {
        String ss = mallProductInfo.getImg_Url().replace("alt=\"\"","");//todo 替换方法太糙
        ss = ss.substring(ss.indexOf("http"));
        int i = ss.indexOf("\"");
        String substring = ss.substring(0,i);//todo 只有第一张图会上传
        mallProductInfo.setImg_Url(substring);
        JSONObject mjson = JSONObject.fromObject(mallProductInfo);
        String goodPro = mjson.toString();
        String url = CommonUrl.GOODINFO_URL +"WelfareMall-operation/productInfo/updateProductInfo.cp";
        String doPost = HttpClientUtil.doPostHttp(url, goodPro);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
     }

    }


    /**
     * 修改商品库存和上架状态
     * @param
     */
    @Override
    public void upGoodOnStatusStock(MallProductInfo mallProductInfo) {
        mallProductInfo.setStatus("00");
        JSONObject mjson = JSONObject.fromObject(mallProductInfo);
        String goodPro = mjson.toString();
        String url =CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/upGoodOnStatusStock.cp";
        String doPost = HttpClientUtil.doPostHttp(url, goodPro);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


    }







    /**
     * 修改商品状态 下架 清库存
     * @param mallProductInfo
     */
    @Override
    public void updateGoodStatus(MallProductInfo mallProductInfo) {
        mallProductInfo.setStatus("02");
       JSONObject mjson = JSONObject.fromObject(mallProductInfo);
        String goodPro = mjson.toString();
        String url =CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/updateGoodStatus.cp";
        String doPost = HttpClientUtil.doPostHttp(url, goodPro);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


    }

    /**
     * 回显  查id
     * @param
     * @return
     */
  @Override
    public List findGoodByid(MallProductInfo mallProductInfo) {

        JSONObject json = JSONObject.fromObject(mallProductInfo);
        String str = json.toString();
        String url = CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/findGoodByid.cp";


        String doPost = HttpClientUtil.doPostHttp(url, str);
        doPost=doPost.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

      List<MallProductInfo> infos = JSONArray.parseArray(doPost, MallProductInfo.class);
      return infos;
    }


    /**
     * 预览商品
     * @param mallProductInfo
     * @return
     */
    @Override
    public List<MallProductInfo> findKinderitor(MallProductInfo mallProductInfo) {
        JSONObject json = JSONObject.fromObject(mallProductInfo);
        String str = json.toString();
        String url = CommonUrl.GOODINFO_URL + "WelfareMall-operation/productInfo/findGoodByid.cp";
        String doPost = HttpClientUtil.doPostHttp(url, str);
        doPost=doPost.replaceAll("%(?![0-9a-fA-F]{2})", "%25");
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        List<MallProductInfo> infos = JSONArray.parseArray(doPost, MallProductInfo.class);
        return infos;
    }


  }
