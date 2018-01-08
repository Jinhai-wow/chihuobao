package com.chihuobao.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import com.chihuobao.po.Ordergoods;
import com.chihuobao.po.Shop;
import com.chihuobao.po.User;

/**
 * 管理员操作的订单扩展类
 * @author 谢韦烈
 *2017-12-05
 */
public class ManagerOrderVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer page;
	private Integer rows;
	private List<Long> ids;
	
	private Long id;
	private Integer userId;
	private String userName;  //用户名称
	private Integer shopId;
	private String shopName;
	private String shopService;
	private String arriveTime;
	private String deliverMethod;
	private String userAddress;
	private String payMethod;
	private Date createTime;
	private Integer orderState;
	private Double totalMoney;
	private String evaluate;
	private String remark;
	private String usercomment;  //用户评论
	
	public String getShopService() {
		return shopService;
	}
	public void setShopService(String shopService) {
		this.shopService = shopService;
	}
	private List<Ordergoods> orderGoodsList;
	
	private Shop shop;      //商家实体类
	private User user;      //用户实体类
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public List<Ordergoods> getOrderGoodsList() {
		return orderGoodsList;
	}
	public void setOrderGoodsList(List<Ordergoods> orderGoodsList) {
		this.orderGoodsList = orderGoodsList;
	}
	public String getUsercomment() {
		return usercomment;
	}
	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
	}
	public List<Long> getIds() {
		return ids;
	}
	public void setIds(List<Long> ids) {
		this.ids = ids;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getOrderState() {
		return orderState;
	}
	public void setOrderState(Integer orderState) {
		this.orderState = orderState;
	}
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getEvaluate() {
		return evaluate;
	}
	public void setEvaluate(String evaluate) {
		this.evaluate = evaluate;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	
	public String getArriveTime() {
		return arriveTime;
	}
	public void setArriveTime(String arriveTime) {
		this.arriveTime = arriveTime;
	}
	public String getDeliverMethod() {
		return deliverMethod;
	}
	public void setDeliverMethod(String deliverMethod) {
		this.deliverMethod = deliverMethod;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
}
