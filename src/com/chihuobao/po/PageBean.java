package com.chihuobao.po;

public class PageBean {

	
	private Integer page;
	private Integer rows;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	@Override
	public String toString() {
		return "PageBean [page=" + page + ", rows=" + rows + "]";
	}
	public Integer getRows() {
		return rows;
	}
	public void setRows(Integer rows) {
		this.rows = rows;
	}
}
