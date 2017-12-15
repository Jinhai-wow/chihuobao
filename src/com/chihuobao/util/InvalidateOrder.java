package com.chihuobao.util;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.chihuobao.po.Ordertable;
import com.chihuobao.po.User;
import com.chihuobao.service.order.OrderService;

public class InvalidateOrder {

	@Autowired
	private OrderService orderService;
	/*@Autowired  
	private HttpSession session;  
	  
	@Autowired  
	private HttpServletRequest request; */
	
	public void invalidateOrder(){
		/*HttpSession session=
		session.setAttribute("id", 1);
		(int) session.getAttribute("id");*/
		/*整合时用  User user =(User) session.getAttribute("user");*/
		
		/*if(session!=null){
		System.out.println("testSession="+session.getAttribute("test"));
		}*/
		/*int userid=1;*/
		
		System.out.println("定时订单");
		List<Long> invalidateOrderList=new ArrayList<Long>();
	   /* 因为quartz在项目启动时就会启动，不能只根据当前用户，用户不会在项目启动时就登录*/
		List<Ordertable> nopayOrderList=orderService.getOrderNoPay();
		/*遍历所有未付款订单，查出其中的过期失效订单*/
		for(Ordertable nopayOrder:nopayOrderList){
			/*long gap=nopayOrder.getCreatetime().getTime()-System.currentTimeMillis();*/
			/*System.out.println("createtime="+nopayOrder.getCreatetime().getTime());*/
			/*System.out.println("diff="+checkOrder(nopayOrder));
			*/
			/*System.out.println("diff="+checkOrder(nopayOrder));*/
			long diff=checkOrder(nopayOrder);
			/*订单失效时间为30分钟  1800000毫秒*/
			if(diff>1800000){
				
				invalidateOrderList.add(nopayOrder.getId());
				System.out.println("nopayOrderId="+nopayOrder.getId());
			}
		
		}
		if(invalidateOrderList!=null&&invalidateOrderList.size()>0){
			System.out.println("invalidateOrderList.size"+invalidateOrderList.size());
			
			System.out.println("invalidateOrderList="+invalidateOrderList);
		/*	先关闭写数据库，开发完才打开*/
	orderService.modifyOrderState(invalidateOrderList);
		}
		 
	}
	
	public Long checkOrder(Ordertable  nopayOrder) {
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Long diff = null;
        if (nopayOrder != null) {
        	
        	
            Date createTime = nopayOrder.getCreatetime();
            try {
                diff = sdf.parse(sdf.format(date)).getTime() - sdf.parse(sdf.format(createTime)).getTime();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 返回值为毫秒
        return diff;
    }
	
}
