package com.zihexin.user.service.impl;


import com.alibaba.fastjson.JSONArray;
import com.zihexin.user.entity.mallProductType.MallProductType;

import com.zihexin.user.service.MallProductTypeService;
import com.zihexin.user.util.http.HttpClientUtil;
import net.sf.json.JSONObject;
import org.apache.http.entity.StringEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/20.
 */
@Service
public class MallProductTypeServiceImpl implements MallProductTypeService {




    /**
     * 加载一类对象
     * @param mallProductType
     * @return
     */
    @Override
    public List queyProductList(MallProductType mallProductType) {

       JSONObject json = JSONObject.fromObject(mallProductType);
        String str = json.toString();
        String url = "http://localhost:8080/WelfareMall-management/product/loadHierarchy.cp";
        String doPost = HttpClientUtil.doPostHttp(url, str);
        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        List<MallProductType> mallProductTypes = JSONArray.parseArray(doPost, MallProductType.class);
        return mallProductTypes;

    }


    /**
     * 加载子类
     * @param id
     * @return
     */
    @Override
    public List loadHierarchyName(String id) {

       MallProductType mallProductType = new MallProductType();
        mallProductType.setType_ID(id);
        JSONObject json = JSONObject.fromObject(mallProductType);
        String url = "http://localhost:8080/WelfareMall-management/product/loadHierarchyName.cp";
        String doPost = HttpClientUtil.doPostHttp(url, json.toString());

        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }

        List<MallProductType> productType= JSONArray.parseArray(doPost,MallProductType.class);
        return productType;

    }



}
