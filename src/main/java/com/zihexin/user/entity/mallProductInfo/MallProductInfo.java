package com.zihexin.user.entity.mallProductInfo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/17 0017.
 */
public class MallProductInfo implements Serializable {


    //资和信商品明细表
    private String product_ID;//主键
    private String product_Type_ID;//商品分类ID
    private String product_Name;//商品名称
    private String product_Desc;//商品描述
    private Integer sale_Count;//已售数量
    private String channel_SKU;//渠道SKU
    private String channel_ID;//渠道ID
    private String channel_Item_ID;//渠道商品ID
    private String channel_Item_Typr_ID;//渠道商品分类ID
    private String sataus;//状态00：上架    01：编辑 02 失效
    private String upc;//条码
    private String weight;//重量
    private String brand_Name;//品牌名称
    private String product_Area;//区域
    private String unit;//单位
    private Date update_Time;//更新时间
    private String top_Status;//热度状态0：有效    1：失效
    private String gift_Status;//礼包状态   0：有效    1：失效
    private Integer channel_Price;//渠道单价
    private Integer agreement_Price;//协议单价
    private Integer sale_Price;//售卖单价
    private String product_SKU;//资和信SKU
    private String img_URL;//首页图片URL
    private String product_Type_ID_T;//商品分类ID 二级
    private String product_ID_TH;//商品分类ID 三级
    private String product_Type_ID_F;//商品分类ID 四级




    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }

    public String getProduct_Type_ID() {
        return product_Type_ID;
    }

    public void setProduct_Type_ID(String product_Type_ID) {
        this.product_Type_ID = product_Type_ID;
    }

    public String getProduct_Name() {
        return product_Name;
    }

    public void setProduct_Name(String product_Name) {
        this.product_Name = product_Name;
    }

    public String getProduct_Desc() {
        return product_Desc;
    }

    public void setProduct_Desc(String product_Desc) {
        this.product_Desc = product_Desc;
    }

    public Integer getSale_Count() {
        return sale_Count;
    }

    public void setSale_Count(Integer sale_Count) {
        this.sale_Count = sale_Count;
    }

    public String getChannel_SKU() {
        return channel_SKU;
    }

    public void setChannel_SKU(String channel_SKU) {
        this.channel_SKU = channel_SKU;
    }

    public String getChannel_ID() {
        return channel_ID;
    }

    public void setChannel_ID(String channel_ID) {
        this.channel_ID = channel_ID;
    }

    public String getChannel_Item_ID() {
        return channel_Item_ID;
    }

    public void setChannel_Item_ID(String channel_Item_ID) {
        this.channel_Item_ID = channel_Item_ID;
    }

    public String getChannel_Item_Typr_ID() {
        return channel_Item_Typr_ID;
    }

    public void setChannel_Item_Typr_ID(String channel_Item_Typr_ID) {
        this.channel_Item_Typr_ID = channel_Item_Typr_ID;
    }

    public String getSataus() {
        return sataus;
    }

    public void setSataus(String sataus) {
        this.sataus = sataus;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getBrand_Name() {
        return brand_Name;
    }

    public void setBrand_Name(String brand_Name) {
        this.brand_Name = brand_Name;
    }

    public String getProduct_Area() {
        return product_Area;
    }

    public void setProduct_Area(String product_Area) {
        this.product_Area = product_Area;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public Date getUpdate_Time() {
        return update_Time;
    }

    public void setUpdate_Time(Date update_Time) {
        this.update_Time = update_Time;
    }

    public String getTop_Status() {
        return top_Status;
    }

    public void setTop_Status(String top_Status) {
        this.top_Status = top_Status;
    }

    public String getGift_Status() {
        return gift_Status;
    }

    public void setGift_Status(String gift_Status) {
        this.gift_Status = gift_Status;
    }

    public Integer getChannel_Price() {
        return channel_Price;
    }

    public void setChannel_Price(Integer channel_Price) {
        this.channel_Price = channel_Price;
    }

    public Integer getAgreement_Price() {
        return agreement_Price;
    }

    public void setAgreement_Price(Integer agreement_Price) {
        this.agreement_Price = agreement_Price;
    }

    public Integer getSale_Price() {
        return sale_Price;
    }

    public void setSale_Price(Integer sale_Price) {
        this.sale_Price = sale_Price;
    }

    public String getImg_URL() {
        return img_URL;
    }

    public void setImg_URL(String img_URL) {
        this.img_URL = img_URL;
    }

    public String getProduct_SKU() {
        return product_SKU;
    }

    public void setProduct_SKU(String product_SKU) {
        this.product_SKU = product_SKU;
    }

    public String getProduct_Type_ID_T() {
        return product_Type_ID_T;
    }

    public void setProduct_Type_ID_T(String product_Type_ID_T) {
        this.product_Type_ID_T = product_Type_ID_T;
    }

    public String getProduct_ID_TH() {
        return product_ID_TH;
    }

    public void setProduct_ID_TH(String product_ID_TH) {
        this.product_ID_TH = product_ID_TH;
    }

    public String getProduct_Type_ID_F() {
        return product_Type_ID_F;
    }

    public void setProduct_Type_ID_F(String product_Type_ID_F) {
        this.product_Type_ID_F = product_Type_ID_F;
    }






}
