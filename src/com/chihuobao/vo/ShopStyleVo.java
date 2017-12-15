package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;

public class ShopStyleVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;
	private String styleName;
	private String styleDesc;
	
	private Integer page;
	private Integer rows;
	private List<Integer> ids;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getStyleName() {
		return styleName;
	}
	public void setStyleName(String styleName) {
		this.styleName = styleName;
	}
	public String getStyleDesc() {
		return styleDesc;
	}
	public void setStyleDesc(String styleDesc) {
		this.styleDesc = styleDesc;
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
	public List<Integer> getIds() {
		return ids;
	}
	public void setIds(List<Integer> ids) {
		this.ids = ids;
	}
	
	

	
}
