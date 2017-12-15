package com.chihuobao.vo;

import java.io.Serializable;
import java.util.List;

import com.chihuobao.po.ManagerOpera;

/**
 * ManagerOpera的vo类
 * @author Administrator
 *
 */

public class ManagerOperaVo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	private List<Integer> ids;
	private Integer page;
	private Integer rows;
	private ManagerOpera mOpera;
	
	
	public ManagerOpera getmOpera() {
		return mOpera;
	}
	public void setmOpera(ManagerOpera mOpera) {
		this.mOpera = mOpera;
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
	
	
	
	
}
