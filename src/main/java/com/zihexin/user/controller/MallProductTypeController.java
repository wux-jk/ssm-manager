package com.zihexin.user.controller;

import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.mallProductType.MallProductType;

import com.zihexin.user.service.MallProductTypeService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Administrator on 2017/11/20.
 */
@RequestMapping("product")
@Controller
public class MallProductTypeController extends BaseController {

    @Autowired
    private MallProductTypeService mallProductTypeService;


    /**
     * 一类
     *
     * @param response
     * @param mallProductType
     */
    @RequestMapping("loadOneName")
    public void loadOneName(HttpServletResponse response, MallProductType mallProductType) {
        if (mallProductType.getParent_ID() == null) {
            mallProductType.setParent_ID("0");
        }
        List mallList = mallProductTypeService.queyProductList(mallProductType);
        String json = JSONArray.fromObject(mallList).toString();
        ajaxOut(json, response);
    }

    /**
     * 加载二类
     * @param
     * @param
     */
    @RequestMapping("loadHierarchyName")
    public void loadHierarchyName(HttpServletResponse response,HttpServletRequest request) {
        String id = request.getParameter("id");
        try {
            if (id != null && id != ""){
                List conuList= mallProductTypeService.loadHierarchyName(id);
                String couJson = JSONArray.fromObject(conuList).toString();
                ajaxOut(couJson,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }


    /**
     * 加载三类
     * @param
     * @param
     */
    @RequestMapping("loadThreeName")
    public void loadThreeName(HttpServletResponse response,HttpServletRequest request) {
        String id = request.getParameter("id");
        try {
            if (id != null && id != ""){
                List treeList= mallProductTypeService.loadHierarchyName(id);
                String couJson = JSONArray.fromObject(treeList).toString();
                ajaxOut(couJson,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    /**
     * 加载四类
     * @param
     * @param
     */
    @RequestMapping("loadfourName")
    public void loadfourName(HttpServletResponse response,HttpServletRequest request) {
        String id = request.getParameter("id");
       try {
            if (id != null && id != ""){
                List treeList= mallProductTypeService.loadHierarchyName(id);
                String couJson = JSONArray.fromObject(treeList).toString();
                ajaxOut(couJson,response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
