package com.zihexin.user.controller;

import com.zihexin.user.entity.Good;
import com.zihexin.user.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */

@Controller
@RequestMapping("/good")
public class GoodController {

    @Autowired
    private GoodService goodService;


    @RequestMapping("/queryGoodList")
    @ResponseBody
    public List<Good> queryGoodList(){
        List<Good> goodList= goodService.queryGoiodList();
        return  goodList;

    }


}
