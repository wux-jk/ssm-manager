package com.zihexin.user.controller;

import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.service.ProductTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/11/20 0020.
 */
@Controller
public class ProductType {

    @Autowired
    private ProductTypeService productTypeService;


    @RequestMapping("getDropdown")
    @ResponseBody
    List<Map<String, Object>> selectTreeListJson(MallProductType mallProductType) {
        List<Map<String, Object>> treeList = productTypeService.getDropdown(mallProductType);
        return treeList;
    }
}
