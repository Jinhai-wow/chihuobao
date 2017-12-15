package com.chihuobao.po;

import java.io.Serializable;
import java.util.List;

public class Shopcart implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String toString() {
		return "Shopcart [shopcartid=" + shopcartid + ", shopid=" + shopid + ", shopname=" + shopname + ", totalprice="
				+ totalprice + ", userid=" + userid + ", shopcartlist=" + shopcartlist + "]";
	}

	private Integer shopcartid;

    private Integer shopid;

    private String shopname;

    private Double totalprice;

    private Integer userid;
    
    private List<Shopcartlist>shopcartlist;

    public List<Shopcartlist> getShopcartlist() {
		return shopcartlist;
	}

	public void setShopcartlist(List<Shopcartlist> shopcartlist) {
		this.shopcartlist = shopcartlist;
	}

	public Integer getShopcartid() {
        return shopcartid;
    }

    public void setShopcartid(Integer shopcartid) {
        this.shopcartid = shopcartid;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public Double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Double totalprice) {
        this.totalprice = totalprice;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }
}