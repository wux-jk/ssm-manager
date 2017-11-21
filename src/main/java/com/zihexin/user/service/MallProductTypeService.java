package com.zihexin.user.service;


import com.zihexin.user.entity.mallProductType.MallProductType;

import java.util.List;

/**
 * Created by Administrator on 2017/11/20.
 */
public interface MallProductTypeService {


    List queyProductList(MallProductType mallProductType);

    List loadHierarchyName(String id);


}
