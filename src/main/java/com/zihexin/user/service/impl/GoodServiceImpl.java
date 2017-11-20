package com.zihexin.user.service.impl;

import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.mapper.GoodMapper;
import com.zihexin.user.mapper.ProductMapper;
import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.JsonUtils;
import com.zihexin.user.util.http.HttpClientUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


    //条查
    @Override
    public List<Good> queryGoiodList(Good good) {

        return goodMapper.queryGoiodList(good);
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

    @Override
    public Good findGoodByid(Good good) {



        /*  Map<String, String> param = new HashMap<>();
        param.put("goodID",good.getGoodID());
        param.put("MainData","99999JJJ");
        param.put("MsgInfo","99999JJJ");
        param.put("ChannelID","99999JJJ");*/
       /* JSONObject json = JSONObject.fromObject(good);
        String str = json.toString();*/
//		 String url = "https://202.85.211.63/itunes/communication/message";http://10.6.16.233:443/GiftCardServer


       /* String doPost = HttpClientUtil.doPostHttp( url, param);

        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
*/




      return goodMapper.findGoodByid(good);
    }




    @Override
    public Good findKinderitor(Good good) {

        return goodMapper.findKinderitor(good);
    }

    @Override
    public void updateGood(Good good) {
        int a=goodMapper.updateGood(good);
    }
}
