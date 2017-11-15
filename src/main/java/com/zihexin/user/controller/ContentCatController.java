package com.zihexin.user.controller;

import com.zihexin.user.entity.EasyUITreeNode;
import com.zihexin.user.service.ContentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by Administrator on 2017/11/14 0014.
 */
@Controller
public class ContentCatController {
    @Autowired
    private ContentCategoryService contentCategoryService;

  /*  @RequestMapping("/content/category/list")
    @ResponseBody
    public List<EasyUITreeNode> getContentCatList( @RequestParam(name="id",)Long parentId) {
        List<EasyUITreeNode> list = contentCategoryService.getContentCatList(parentId);
        return list;
    }*/
}
