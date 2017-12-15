package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;
/**
 * 管理员操作表
 * 谢韦烈 2017-11-28
 * @author Administrator
 *
 */

public class ManagerOpera implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;   //主键
	private String operation;  //操作
	private Date operaDate;		//操作时间
	private Integer operaRole;   //执行操作的对象
	
	
	public Integer getOperaRole() {
		return operaRole;
	}
	public void setOperaRole(Integer operaRole) {
		this.operaRole = operaRole;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public Date getOperaDate() {
		return operaDate;
	}
	public void setOperaDate(Date operaDate) {
		this.operaDate = operaDate;
	}
	
	
}
