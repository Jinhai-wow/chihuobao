package com.chihuobao.po;

import java.io.Serializable;

public class Shopcartlist implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String toString() {
		return "Shopcartlist [shopcartid=" + shopcartid + ", goodsname=" + goodsname + ", goodsquatity=" + goodsquatity
				+ ", goodsprice=" + goodsprice + "]";
	}

	private Integer shopcartid;

    private String goodsname;

    private Integer goodsquatity;

    private Double goodsprice;

    public Integer getShopcartid() {
        return shopcartid;
    }

    public void setShopcartid(Integer shopcartid) {
        this.shopcartid = shopcartid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname == null ? null : goodsname.trim();
    }

    public Integer getGoodsquatity() {
        return goodsquatity;
    }

    public void setGoodsquatity(Integer goodsquatity) {
        this.goodsquatity = goodsquatity;
    }

    public Double getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(Double goodsprice) {
        this.goodsprice = goodsprice;
    }
}