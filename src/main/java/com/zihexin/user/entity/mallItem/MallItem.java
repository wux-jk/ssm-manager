package com.zihexin.user.entity.mallItem;

import java.io.Serializable;
import java.util.Date;

/**
 * Created by Administrator on 2017/11/17 0017.
 */
public class MallItem implements Serializable {

    //供应商表
    private String id; //主键
    private String name;//名称
    private String descRiption;//描述
    private Integer sale_Count;//已售数量
    private String channel_SKU;//渠道SKU
    private String channel_ID;//渠道ID
    private String item_Type_ID;//商品分类ID
    private String status;//状态    0：有效  1：失效
    private String upc;//条码
    private String weight;//重量
    private String brand_Name;//品牌名称
    private String product_Area;//区域
    private String unit;//单位
    private Date update_Time;//更新时间
    private String top_Status;//状态   0：有效    1：失效
    private String gift_Status;//状态   0：有效    1：失效
    private Integer channel_Price;//渠道单价
    private Integer agreement_Price;//协议单价
    private Integer sale_Price;//售卖单价
    private String img_url;//主图

    public String getImg_url() {
        return img_url;
    }

    public void setImg_url(String img_url) {
        this.img_url = img_url;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescRiption() {
        return descRiption;
    }

    public void setDescRiption(String descRiption) {
        this.descRiption = descRiption;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public String getChannel_ID() {
        return channel_ID;
    }

    public void setChannel_ID(String channel_ID) {
        this.channel_ID = channel_ID;
    }

    public String getChannel_SKU() {
        return channel_SKU;
    }

    public void setChannel_SKU(String channel_SKU) {
        this.channel_SKU = channel_SKU;
    }

    public Integer getSale_Count() {
        return sale_Count;
    }

    public void setSale_Count(Integer sale_Count) {
        this.sale_Count = sale_Count;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getItem_Type_ID() {
        return item_Type_ID;
    }

    public void setItem_Type_ID(String item_Type_ID) {
        this.item_Type_ID = item_Type_ID;
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

    public String getProduct_Area() {
        return product_Area;
    }

    public void setProduct_Area(String product_Area) {
        this.product_Area = product_Area;
    }

    public String getBrand_Name() {
        return brand_Name;
    }

    public void setBrand_Name(String brand_Name) {
        this.brand_Name = brand_Name;
    }

    public Date getUpdate_Time() {
        return update_Time;
    }

    public void setUpdate_Time(Date update_Time) {
        this.update_Time = update_Time;
    }

    public String getGift_Status() {
        return gift_Status;
    }

    public void setGift_Status(String gift_Status) {
        this.gift_Status = gift_Status;
    }

    public String getTop_Status() {
        return top_Status;
    }

    public void setTop_Status(String top_Status) {
        this.top_Status = top_Status;
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
}
