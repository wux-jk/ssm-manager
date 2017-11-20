package com.zihexin.user.mapper;

import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;
import com.zihexin.user.entity.mallProductType.MallProductType;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */
public interface GoodMapper {


    List<Good> queryGoiodList(Good good);

    /*List<Good> findGoodByid(Good good);*/


    Good findGoodByid(Good good);


    int updateGood(Good good);

    Good findKinderitor(Good good);

    void updateGoodStatus(Good good);


    //上架的方法
    void upGoodStatus(Good good);

    //修改库存的方法
    void upGoodStock(Good good);


}
