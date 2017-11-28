package com.zihexin.user.service;

import com.zihexin.user.entity.Good;

import com.zihexin.user.entity.User;

import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */
public interface GoodService {
    List<MallProductInfo> queryGoiodList(MallProductInfo mallProductInfo);





    Good findKinderitor(Good good);

    void updateGoodStatus(Good good);

        //修改状态  新增库存数量
    void upGoodOnStatusStock(Good good);


    void insertGoodInfo(MallItem mallItem, MallProductInfo mallProductInfo);

    List<MallProductInfo> findGoodByid(MallProductInfo mallProductInfo);

    List<MallItem> queryItemList(MallItem mallItem);

    void updateProductInfo(MallProductInfo mallProductInfo);
}
