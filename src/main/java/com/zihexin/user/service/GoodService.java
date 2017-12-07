package com.zihexin.user.service;

import com.zihexin.user.entity.Good;


import com.zihexin.user.entity.User;

import com.zihexin.user.entity.mallItem.MallItem;
import com.zihexin.user.entity.mallProductInfo.MallProductInfo;
import com.zihexin.user.entity.mallProductType.MallProductType;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */
public interface GoodService {
    List<MallProductInfo> queryGoiodList(MallProductInfo mallProductInfo);





    List<MallProductInfo> findKinderitor(MallProductInfo mallProductInfo);

    void updateGoodStatus(MallProductInfo mallProductInfo);

        //修改状态  新增库存数量
    void upGoodOnStatusStock(MallProductInfo mallProductInfo);


    void insertGoodInfo(MallItem mallItem,MallProductInfo mallProductInfo);

  List<MallProductInfo> findGoodByid(MallProductInfo mallProductInfo);

    String queryItemList(MallItem mallItem);

    void updateProductInfo(MallProductInfo mallProductInfo);

    /*int selectGoodCount(MallProductInfo mallProductInfo);*/
}
