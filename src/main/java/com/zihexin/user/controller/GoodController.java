package com.zihexin.user.controller;

import com.zihexin.user.constant.BaseController;
import com.zihexin.user.entity.Good;
import com.zihexin.user.service.GoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/10/27 0027.
 */

@Controller
@RequestMapping("/good")
public class GoodController extends BaseController {

    private Good good = new Good();

    @Autowired
    private GoodService goodService;


    @RequestMapping("/queryGoodList")
    @ResponseBody
    public void queryGoodList(Good good,HttpServletResponse response) {
        List<Good> goodList=new ArrayList<Good>();
        try {
            goodList= goodService.queryGoiodList(good);
        }catch (Exception e){
            e.printStackTrace();
        }
        writeJson(goodList,response);

    }

    public void findGoodByid(){

    }


}
