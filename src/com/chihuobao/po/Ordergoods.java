package com.chihuobao.po;

import java.io.Serializable;

public class Ordergoods implements Serializable{
    
/*	private Integer id;
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
*/
	private long orderid;

    public long getOrderid() {
		return orderid;
	}

	public void setOrderid(long orderid) {
		this.orderid = orderid;
	}

	private String goodsname;

    private Integer goodsquatity;

    private Double goodsmoney;



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

    public Double getGoodsmoney() {
        return goodsmoney;
    }

    public void setGoodsmoney(Double goodsmoney) {
        this.goodsmoney = goodsmoney;
    }

	@Override
	public String toString() {
		return "Ordergoods [ orderid=" + orderid + ", goodsname=" + goodsname + ", goodsquatity="
				+ goodsquatity + ", goodsmoney=" + goodsmoney + "]";
	}

	
    
  
}