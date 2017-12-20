package com.chihuobao.po;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Ordertable implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private long id;
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	private String usercomment; //用户对订单的评论 --谢韦烈
	
	

	public String getUsercomment() {
		return usercomment;
	}

	public void setUsercomment(String usercomment) {
		this.usercomment = usercomment;
	}

	private Integer userid;

    private Integer shopid;
    
    private Integer shopcartid;
    public Integer getShopcartid() {
		return shopcartid;
	}

	public void setShopcartid(Integer shopcartid) {
		this.shopcartid = shopcartid;
	}

	private String shopname;

	/*存放的是图片名*/
	private String shoppic;

    public String getShoppic() {
		return shoppic;
	}

	public void setShoppic(String shoppic) {
		this.shoppic = shoppic;
	}

	private String arrivetime;

    private String delivermethod;

    private String useraddress;

    private String paymethod;

    private Date createtime;

    private Integer orderstate;

    private Double totalmoney;

    /*private String evaluate;*/

    private String remark;

    private String shopservice;

    private String deliverspeed;

    private String evaluatefood;
    
    private String shopphone; 
    private String shopremark; 
    
   

	public String getShopremark() {
		return shopremark;
	}

	public void setShopremark(String shopremark) {
		this.shopremark = shopremark;
	}

	private List<Ordergoods> ordergoodsList;
/*此处使用一对多映射，ordertable为一，ordergoods为多*/
   

	

	public List<Ordergoods> getOrdergoodsList() {
		return ordergoodsList;
	}

	public void setOrdergoodsList(List<Ordergoods> ordergoodsList) {
		this.ordergoodsList = ordergoodsList;
	}



    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getShopid() {
        return shopid;
    }

    public void setShopid(Integer shopid) {
        this.shopid = shopid;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public String getArrivetime() {
        return arrivetime;
    }

    public void setArrivetime(String arrivetime) {
        this.arrivetime = arrivetime == null ? null : arrivetime.trim();
    }

    public String getDelivermethod() {
        return delivermethod;
    }

    public void setDelivermethod(String delivermethod) {
        this.delivermethod = delivermethod == null ? null : delivermethod.trim();
    }

    public String getUseraddress() {
        return useraddress;
    }

    public void setUseraddress(String useraddress) {
        this.useraddress = useraddress == null ? null : useraddress.trim();
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod == null ? null : paymethod.trim();
    }

    

    @Override
	public String toString() {
		return "Ordertable [id=" + id + ", userid=" + userid + ", shopid=" + shopid + ", shopcartid=" + shopcartid
				+ ", shopname=" + shopname + ", arrivetime=" + arrivetime + ", delivermethod=" + delivermethod
				+ ", useraddress=" + useraddress + ", paymethod=" + paymethod + ", createtime=" + createtime
				+ ", orderstate=" + orderstate + ", totalmoney=" + totalmoney + ", remark=" + remark + ", shopservice="
				+ shopservice + ", deliverspeed=" + deliverspeed + ", evaluatefood=" + evaluatefood + ", shopphone="
				+ shopphone + ", shopremark=" + shopremark + ", ordergoodsList=" + ordergoodsList + "]";
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(Integer orderstate) {
        this.orderstate = orderstate;
    }

    public Double getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(Double totalmoney) {
        this.totalmoney = totalmoney;
    }

/*    public String getEvaluate() {
        return evaluate;
    }

    public void setEvaluate(String evaluate) {
        this.evaluate = evaluate == null ? null : evaluate.trim();
    }*/

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getShopservice() {
        return shopservice;
    }

    public void setShopservice(String shopservice) {
        this.shopservice = shopservice == null ? null : shopservice.trim();
    }

    public String getDeliverspeed() {
        return deliverspeed;
    }

    public void setDeliverspeed(String deliverspeed) {
        this.deliverspeed = deliverspeed == null ? null : deliverspeed.trim();
    }

    public String getEvaluatefood() {
        return evaluatefood;
    }

    public void setEvaluatefood(String evaluatefood) {
        this.evaluatefood = evaluatefood == null ? null : evaluatefood.trim();
    }

	public String getShopphone() {
		return shopphone;
	}

	public void setShopphone(String shopphone) {
		this.shopphone = shopphone;
	}

	

	
   
 
    
}