package com.zihexin.user.service;

import com.zihexin.user.entity.Good;
import com.zihexin.user.entity.User;

import java.util.List;

/**
 * Created by Administrator on 2017/10/27 0027.
 */
public interface GoodService {
    List<Good> queryGoiodList(Good good);

   /* List<Good> findGoodByid(Good good);*/

    Good findGoodByid(Good good);



}
