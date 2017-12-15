/**
 * 
 */
package com.chihuobao.vo;

import java.util.List;

import com.chihuobao.po.ManInfo;
import com.chihuobao.po.UserComment;

/**
 * @description 商家信息的扩展类
 * @author 王锦海
 * @date 2017年12月6日
 * @version 1.0
 */
public class BusinessMsgCustom {
	private UserComment userComment;
	private ManInfo manInfo;
	private Integer userComConuts;
	private Integer sysMsgCounts;
	private List<UserComment> uComments;
	private List<ManInfo> mInfos;
	
	public UserComment getUserComment() {
		return userComment;
	}
	public void setUserComment(UserComment userComment) {
		this.userComment = userComment;
	}
	public ManInfo getManInfo() {
		return manInfo;
	}
	public void setManInfo(ManInfo manInfo) {
		this.manInfo = manInfo;
	}
	public Integer getUserComConuts() {
		return userComConuts;
	}
	public void setUserComConuts(Integer userComConuts) {
		this.userComConuts = userComConuts;
	}
	public Integer getSysMsgCounts() {
		return sysMsgCounts;
	}
	public void setSysMsgCounts(Integer sysMsgCounts) {
		this.sysMsgCounts = sysMsgCounts;
	}
	public List<UserComment> getuComments() {
		return uComments;
	}
	public void setuComments(List<UserComment> uComments) {
		this.uComments = uComments;
	}
	public List<ManInfo> getmInfos() {
		return mInfos;
	}
	public void setmInfos(List<ManInfo> mInfos) {
		this.mInfos = mInfos;
	}
	
	
}
