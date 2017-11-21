package com.zihexin.user.mapper;



import com.zihexin.user.entity.mallProductType.MallProductType;

import java.util.List;

/**
 * Created by Administrator on 2017/11/20.
 */
public interface MallProductTypeMapper {


    List queyProductList(MallProductType mallProductType);

    List loadHierarchyName(String id);


}
