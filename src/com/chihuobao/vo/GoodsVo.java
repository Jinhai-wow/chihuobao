package com.chihuobao.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * 实体goods的vo操作实体类
 * @author Administrator
 *
 */
public class GoodsVo  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private List<Integer> ids;
	private Integer page;
	private Integer rows;
	//private Goods goods;
	
	//private GoodsStyle goodsStyle;
	
	
	
	
	private String styleName;
	
	private String shopName;
	
	
	private Integer id;
	private String goodNumber;
	private String goodName;
	private Integer goodStyleId;
	private Double price;
	private Integer quantity;
	private String goodPic;
	
	private Date createTime;
	private Integer sellState;
	
	
	
	
	
	
	@Override
	public String toString() {
		return "GoodsVo [ styleName=" + styleName + ", shopName="
				+ shopName + ", goodNumber=" + goodNumber + ", goodName=" + goodName + ", goodStyleId="
				+ goodStyleId + ", price=" + price + ", quantity=" + quantity + ", goodPic=" + goodPic + ", createTime="
				+ createTime + ", sellState=" + sellState + "]";
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getSellState() {
		return sellState;
	}
	public void setSellState(Integer sellState) {
		this.sellState = sellState;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGoodNumber() {
		return goodNumber;
	}
	public void setGoodNumber(String goodNumber) {
		this.goodNumber = goodNumber;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public Integer getGoodStyleId() {
		return goodStyleId;
	}
	public void setGoodStyleId(Integer goodStyleId) {
		this.goodStyleId = goodStyleId;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getGoodPic() {
		return goodPic;
	}
	public void setGoodPic(String goodPic) {
		this.goodPic = goodPic;
	}
	
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
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
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	
	
}
