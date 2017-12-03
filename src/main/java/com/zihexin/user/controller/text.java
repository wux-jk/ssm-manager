package com.zihexin.user.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/28 0028.
 */
public class text {

    public static void main(String[] args) {
       /* String messages = "{\"channelID\":\"JD\",\"channel_SKU\":\"3100015\",\"queryExts\":\"appintroduce\"}";

       JSONObject     obj= JSON.parseObject(messages);

        System.out.println(obj.getString("channelID"));*/

       /* JSONArray   jsonarray= JSONObject.parseArray(messages);*/

      /*  System.out.println(jsonarray);*/

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间



    }
}
