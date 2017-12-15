package com.chihuobao.po;

import java.util.Date;
/**
 * 
 * @description 管理员的回复信息实体类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class ManInfo {
    private Integer infoId;

    private Integer manageId;

    private String infomation;//内容

    private Integer sendObject;//回复对象

    private Integer sendId;//对象id

    private Date infoDate;//回复时间

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoid) {
        this.infoId = infoid;
    }

    public Integer getManageId() {
        return manageId;
    }

    public void setManageId(Integer manageid) {
        this.manageId = manageid;
    }

    public String getInfomation() {
        return infomation;
    }

    public void setInfomation(String infomation) {
        this.infomation = infomation == null ? null : infomation.trim();
    }

    public Integer getSendObject() {
        return sendObject;
    }

    public void setSendObject(Integer sendobject) {
        this.sendObject = sendobject;
    }

    public Integer getSendId() {
        return sendId;
    }

    public void setSendId(Integer sendid) {
        this.sendId = sendid;
    }

    public Date getInfoDate() {
        return infoDate;
    }

    public void setInfoDate(Date infodate) {
        this.infoDate = infodate;
    }
}