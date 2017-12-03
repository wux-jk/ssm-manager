package com.zihexin.user.entity.mallProductInfo;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/17 0017.
 */
public class MallProductInfo implements Serializable {



    //资和信商品明细表
    private String product_ID;  //主键
    private String product_Type_ID;//商品分类IDproduct_Type_ID
    private String product_Name;//商品名称
    private String product_Desc;//商品描述
    private Integer  sale_Count;//已售数量
    private String channel_Sku;//渠道SKU
    private String channel_ID;//渠道ID
    private String channel_Item_ID;//渠道商品ID
    private String channel_Item_Type_ID;//渠道商品分类ID
    private String status;//状态00：上架、01：编辑、02失效
    private String upc;//条码
    private String weight;//重量
    private String brand_Name;//品牌名称
    private String product_Area;//区域
    private String unit;//单位
    private Date update_Time;//更新时间
    private String top_Status;//热度状态：0有效，1失效
    private String gift_Status;//礼包状态：0有效，     1失效
    private Double agreement_Price;//供应商协议单价
    private Double channel_Price;///供应商的售卖单价
    private Double sale_Price;//售卖单价
    private String product_Sku;//资和信SKU
    private String img_Url;//首页图片URL
    private String product_Type_ID_T;//商品分类ID 二级
    private String product_Type_ID_TH;//商品分类ID 三级
    private String product_Type_ID_F;//商品分类ID 四级
    private String snapshot_Id;//快照ID

    private String type_ID;//商品类别ID

    private Integer inventory_count;//库存数量

    private String userID;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public Integer getInventory_count() {
        return inventory_count;
    }

    public void setInventory_count(Integer inventory_count) {
        this.inventory_count = inventory_count;
    }

    public String getType_ID() {
        return type_ID;
    }

    public void setType_ID(String type_ID) {
        this.type_ID = type_ID;
    }

    public String getSnapshot_Id() {
        return snapshot_Id;
    }

    public void setSnapshot_Id(String snapshot_Id) {
        this.snapshot_Id = snapshot_Id;
    }

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

    public String getChannel_Sku() {
        return channel_Sku;
    }

    public void setChannel_Sku(String channel_Sku) {
        this.channel_Sku = channel_Sku;
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

    public String getChannel_Item_Type_ID() {
        return channel_Item_Type_ID;
    }

    public void setChannel_Item_Type_ID(String channel_Item_Type_ID) {
        this.channel_Item_Type_ID = channel_Item_Type_ID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUpc() {
        return upc;
    }

    public void setUpc(String upc) {
        this.upc = upc;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
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

    public Double getAgreement_Price() {
        return agreement_Price;
    }

    public void setAgreement_Price(Double agreement_Price) {
        this.agreement_Price = agreement_Price;
    }

    public Double getChannel_Price() {
        return channel_Price;
    }

    public void setChannel_Price(Double channel_Price) {
        this.channel_Price = channel_Price;
    }

    public Double getSale_Price() {
        return sale_Price;
    }

    public void setSale_Price(Double sale_Price) {
        this.sale_Price = sale_Price;
    }

    public String getProduct_Sku() {
        return product_Sku;
    }

    public void setProduct_Sku(String product_Sku) {
        this.product_Sku = product_Sku;
    }

    public String getImg_Url() {
        return img_Url;
    }

    public void setImg_Url(String img_Url) {
        this.img_Url = img_Url;
    }

    public String getProduct_Type_ID_T() {
        return product_Type_ID_T;
    }

    public void setProduct_Type_ID_T(String product_Type_ID_T) {
        this.product_Type_ID_T = product_Type_ID_T;
    }

    public String getProduct_Type_ID_TH() {
        return product_Type_ID_TH;
    }

    public void setProduct_Type_ID_TH(String product_Type_ID_TH) {
        this.product_Type_ID_TH = product_Type_ID_TH;
    }

    public String getProduct_Type_ID_F() {
        return product_Type_ID_F;
    }

    public void setProduct_Type_ID_F(String product_Type_ID_F) {
        this.product_Type_ID_F = product_Type_ID_F;
    }






}
