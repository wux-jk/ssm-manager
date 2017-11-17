package com.zihexin.user.service.impl;

import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.mapper.GoodMapper;
import com.zihexin.user.service.GoodService;
import com.zihexin.user.util.http.HttpClientUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
