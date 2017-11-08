package com.zihexin.user.service.impl;

import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.mapper.GoodMapper;
import com.zihexin.user.service.GoodService;
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
