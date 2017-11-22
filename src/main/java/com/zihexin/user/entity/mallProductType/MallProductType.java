package com.zihexin.user.entity.mallProductType;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/11/17 0017.
 */
public class MallProductType implements Serializable {


    //资和信商品类别表
    private String type_ID;//商品类别ID
    private String type_Name;//商品类别名称
    private String parent_ID;//商品类别父ID：最高级别0
    private String channel_ID;//渠道ID：SYSTEM自定义类别、ZHX、JD、MDL
    private String level_ID;//类别级别：01一级、02二级、03三级、04四级
    private String status;//状态：00有效、01失效


    public String getType_ID() {
        return type_ID;
    }

    public void setType_ID(String type_ID) {
        this.type_ID = type_ID;
    }

    public String getType_Name() {
        return type_Name;
    }

    public void setType_Name(String type_Name) {
        this.type_Name = type_Name;
    }

    public String getParent_ID() {
        return parent_ID;
    }

    public void setParent_ID(String parent_ID) {
        this.parent_ID = parent_ID;
    }

    public String getChannel_ID() {
        return channel_ID;
    }

    public void setChannel_ID(String channel_ID) {
        this.channel_ID = channel_ID;
    }

    public String getLevel_ID() {
        return level_ID;
    }

    public void setLevel_ID(String level_ID) {
        this.level_ID = level_ID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
