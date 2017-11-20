package com.zihexin.user.mapper;

import com.zihexin.user.entity.mallProductType.MallProductType;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/20 0020.
 */
public interface ProductMapper {


    List<Map<String,Object>> getDropdown(MallProductType mallProductType);
}
