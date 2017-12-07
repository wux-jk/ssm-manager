package com.zihexin.user.entity.productinfolog;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public class MallProductInfoLog implements Serializable {


    //日志表
    private String product_ID;//主键
    private String product_Sku;//资和信SKUproduct_Sku
    private String channel_Sku;//渠道SKU
    private String channel_ID;//渠道ID
    private String product_Name;//商品名称
    private Integer agreement_Price;//供应商协议单价
    private Integer channel_Price;//渠道单价
    private Integer sale_Price;//售卖单价
    private String userName;

    public String getChannel_Sku() {
        return channel_Sku;
    }

    public void setChannel_Sku(String channel_Sku) {
        this.channel_Sku = channel_Sku;
    }

    public String getProduct_ID() {
        return product_ID;
    }

    public void setProduct_ID(String product_ID) {
        this.product_ID = product_ID;
    }

    public String getProduct_Sku() {
        return product_Sku;
    }

    public void setProduct_Sku(String product_Sku) {
        this.product_Sku = product_Sku;
    }


    public String getChannel_ID() {
        return channel_ID;
    }

    public void setChannel_ID(String channel_ID) {
        this.channel_ID = channel_ID;
    }

    public String getProduct_Name() {
        return product_Name;
    }

    public void setProduct_Name(String product_Name) {
        this.product_Name = product_Name;
    }

    public Integer getAgreement_Price() {
        return agreement_Price;
    }

    public void setAgreement_Price(Integer agreement_Price) {
        this.agreement_Price = agreement_Price;
    }

    public Integer getChannel_Price() {
        return channel_Price;
    }

    public void setChannel_Price(Integer channel_Price) {
        this.channel_Price = channel_Price;
    }

    public Integer getSale_Price() {
        return sale_Price;
    }

    public void setSale_Price(Integer sale_Price) {
        this.sale_Price = sale_Price;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
