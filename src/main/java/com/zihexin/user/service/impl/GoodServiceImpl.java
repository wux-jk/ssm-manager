package com.zihexin.user.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.zihexin.user.entity.Good;

import com.zihexin.user.entity.User;

import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.mapper.GoodMapper;

import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.JsonUtils;
import com.zihexin.user.util.http.HttpClientUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Autowired
    private GoodMapper goodMapper;


    //条查；查询商品信息表列表
    @Override
    public List<MallProductInfo> queryGoiodList(MallProductInfo mallProductInfo) {

        JSONObject json = JSONObject.fromObject(mallProductInfo);
        String str = json.toString();
        String url = "http://localhost:8080/WelfareMall-management/productInfo/queryGoodInfo.cp";
        String doPost = HttpClientUtil.doPostHttp(url, str);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<MallProductInfo> goodInfo = JSONArray.parseArray(doPost, MallProductInfo.class);
        return goodInfo;


    }

    /**
     * 查询京东商品信息
     * @param mallItem
     * @return
     */
    @Override
    public List<MallItem> queryItemList(MallItem mallItem) {
        Map map = new HashMap<>();
        map.put("channel_ID",mallItem.getChannel_ID());
        map.put("channel_SKU",mallItem.getChannel_SKU());
        map.put("queryExts","appintroduce");
        JSONObject itemJjson = JSONObject.fromObject(map);
        String item= itemJjson.toString();
        String url = "http://10.7.13.56:8080/WelfareMall-management/product/queryProductDetail.cp ";

     /*   String url = "http://10.6.5.114:8080/WelfareMall-management/product/queryProductDetail.cp";*/
        String doPost = HttpClientUtil.doPostHttp(url, item);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<MallItem> itemInfo = JSONArray.parseArray(doPost, MallItem.class);
        return itemInfo;

    }

    /**
     * 新增商品信息
     * @param mallItem
     * @param mallProductInfo
     */
    @Override
    public void insertGoodInfo(MallItem mallItem, MallProductInfo mallProductInfo) {

        Map<String,Object> map = new HashMap<>();
        map.put("mallItem",mallItem);
        map.put("productInfo",mallProductInfo);

        //把map转成json
        JSONObject mjson = JSONObject.fromObject(map);
        String strMap = mjson.toString();
        String url = "http://localhost:8080/WelfareMall-management/productInfo/insertGoodInfo.cp";
        String doPost = HttpClientUtil.doPostHttp(url, strMap);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }




    }


    /***
     * 修改商品  并新增日志表
     * @param mallProductInfo
     */
    @Override
    public void updateProductInfo(MallProductInfo mallProductInfo) {

    }

    /**
     * 修改商品库存和上架状态
     * @param good
     */
    @Override
    public void upGoodOnStatusStock(Good good) {
        good.setGoodStatus(2);
        //修改商品上架状态
        goodMapper.upGoodStatus(good);
       //修改商品库存
        goodMapper.upGoodStock(good);

    }





    //下架
    @Override
    public void updateGoodStatus(Good good) {
        goodMapper.updateGoodStatus(good);
    }

    /**
     * 回显  查id
     * @param
     * @return
     */
    @Override
    public List<MallProductInfo> findGoodByid(MallProductInfo mallProductInfo) {

        JSONObject json = JSONObject.fromObject(mallProductInfo);
        String str = json.toString();
        String url = "http://localhost:8080/WelfareMall-management/productInfo/findGoodByid.cp";
        String doPost = HttpClientUtil.doPostHttp(url, str);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<MallProductInfo> mallProductInfos = JSONArray.parseArray(doPost, MallProductInfo.class);
        return mallProductInfos;
    }





    @Override
    public Good findKinderitor(Good good) {

        return goodMapper.findKinderitor(good);
    }


}
