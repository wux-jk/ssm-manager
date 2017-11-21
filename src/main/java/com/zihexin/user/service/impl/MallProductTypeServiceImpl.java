package com.zihexin.user.service.impl;


import com.zihexin.user.entity.mallProductType.MallProductType;
import com.zihexin.user.mapper.MallProductTypeMapper;
import com.zihexin.user.service.MallProductTypeService;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/20.
 */
@Service
public class MallProductTypeServiceImpl implements MallProductTypeService {

    @Autowired
    private MallProductTypeMapper mallProductTypeMapper;


    /**
     * 加载一类对象
     * @param mallProductType
     * @return
     */
    @Override
    public List queyProductList(MallProductType mallProductType) {

        JSONObject json = JSONObject.fromObject(mallProductType);
        String str = json.toString();

        //String url = "https://202.85.211.63/itunes/communication/message";http://10.6.16.233:443/GiftCardServer
       /* String doPost = HttpClientUtil.doPostHttp( url, str);

        try {
            System.out.println(URLDecoder.decode(doPost, "UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
*/


        return mallProductTypeMapper.queyProductList(mallProductType);
    }


    @Override
    public List loadHierarchyName(String id) {
        return mallProductTypeMapper.loadHierarchyName(id);
    }



}
