package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;

import com.chihuobao.po.Shop;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.po.Ordertable;

/**
 * StorerAccount的vo扩展类
 * @author Administrator
 *
 */

public class StorerAccountVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private StorerAccount storerAccount;
	
	private List<Integer> ids;
	
	private List<StorerAccount> storerAccountList;
	
	private Integer page;
	
	private Integer rows;
	
	private Shop shop;
	
	private Double disbursement;//资金支出
	
	private Double income;//资金收入
	
	private List<Ordertable> orders;//订单信息
	
	private Integer listCounts;//记录数
	
	private String newPassword;
	
	
	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public Integer getListCounts() {
		return listCounts;
	}

	public void setListCounts(Integer listCounts) {
		this.listCounts = listCounts;
	}

	public Double getDisbursement() {
		return disbursement;
	}

	public void setDisbursement(Double disbursement) {
		this.disbursement = disbursement;
	}

	public Double getIncome() {
		return income;
	}

	public void setIncome(Double income) {
		this.income = income;
	}

	public List<Ordertable> getOrders() {
		return orders;
	}

	public void setOrders(List<Ordertable> orders) {
		this.orders = orders;
	}
	
	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
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

	public List<StorerAccount> getStorerAccountList() {
		return storerAccountList;
	}

	public void setStorerAccountList(List<StorerAccount> storerAccountList) {
		this.storerAccountList = storerAccountList;
	}

	public StorerAccount getStorerAccount() {
		return storerAccount;
	}

	public void setStorerAccount(StorerAccount storerAccount) {
		this.storerAccount = storerAccount;
	}

	public List<Integer> getIds() {
		return ids;
	}

	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}

}
