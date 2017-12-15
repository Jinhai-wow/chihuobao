package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单数据分析实体类
 * @author 谢韦烈
 *2017-12-08
 */
public class OrderAnalyse implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer page;     //扩展属性：页码
	private Integer rows;	  //扩展属性：条数
	private String fromdate;  //扩展属性：初时间
	private String todate;    //扩展属性：始时间
	
	
	private Integer id;
	private String shopName;
	private String shopStyleName;
	private String goodsName;
	private String goodsStyleName;
	private Integer total;
	private Date createTime;
	private Double goodsMoney;
	private Double totalMoney;
	
	
	
	
	
	public String getFromdate() {
		return fromdate;
	}
	public void setFromdate(String fromdate) {
		this.fromdate = fromdate;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
	public Double getGoodsMoney() {
		return goodsMoney;
	}
	public void setGoodsMoney(Double goodsMoney) {
		this.goodsMoney = goodsMoney;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getShopStyleName() {
		return shopStyleName;
	}
	public void setShopStyleName(String shopStyleName) {
		this.shopStyleName = shopStyleName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsStyleName() {
		return goodsStyleName;
	}
	public void setGoodsStyleName(String goodsStyleName) {
		this.goodsStyleName = goodsStyleName;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}
