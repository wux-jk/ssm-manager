package com.zihexin.user.service.impl;

import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.mapper.ProductMapper;
import com.zihexin.user.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/20 0020.
 */
@Service
public class ProductTypeServiceImpl implements ProductTypeService{

    @Autowired
    private ProductMapper productMapper;

    @Override
    public List<Map<String, Object>> getDropdown(MallProductType mallProductType) {
        return productMapper.getDropdown(mallProductType);
    }
}
