package com.chihuobao.po;

import java.util.Date;
/**
 * 
 * @description 客户评论实体类
 * @author 王锦海
 * @date 2017年11月28日
 * @version 1.0
 */
public class UserComment {
    private Integer commentUserId;

    private Integer userId;//用户id

    private Integer shopId;//商店id

    private String userComment;// 内容

    private Date commentDate;// 时间

    public Integer getCommentUserId() {
        return commentUserId;
    }

    public void setCommentUserId(Integer commentuserid) {
        this.commentUserId = commentuserid;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userid) {
        this.userId = userid;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopid) {
        this.shopId = shopid;
    }

    public String getUserComment() {
        return userComment;
    }

    public void setUserComment(String usercomment) {
        this.userComment = usercomment == null ? null : usercomment.trim();
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentdate(Date commentdate) {
        this.commentDate = commentdate;
    }
}