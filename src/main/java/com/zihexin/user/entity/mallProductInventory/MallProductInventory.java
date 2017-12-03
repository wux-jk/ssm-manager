package com.zihexin.user.entity.mallProductInventory;

import java.io.Serializable;

/**
 * Created by Administrator on 2017/11/29 0029.
 */
public class MallProductInventory implements Serializable{


    //库存表
    private String inventory_ID; //库存ID
    private String product_Sku; //商品SKU
    private Integer inventory_count;//库存数量
    private String sataus;//状态：00有效，01失效


    public Integer getInventory_count() {
        return inventory_count;
    }

    public void setInventory_count(Integer inventory_count) {
        this.inventory_count = inventory_count;
    }

    public String getInventory_ID() {
        return inventory_ID;
    }

    public void setInventory_ID(String inventory_ID) {
        this.inventory_ID = inventory_ID;
    }

    public String getProduct_Sku() {
        return product_Sku;
    }

    public void setProduct_Sku(String product_Sku) {
        this.product_Sku = product_Sku;
    }

    public String getSataus() {
        return sataus;
    }

    public void setSataus(String sataus) {
        this.sataus = sataus;
    }
}
