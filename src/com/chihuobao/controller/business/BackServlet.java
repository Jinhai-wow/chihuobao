package com.chihuobao.controller.business;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//显示支付结果的页面
/**
 * 如何使用get/post请求
 * 1.请求 一个静态页面或图形文件时使用get,因为仅仅需要发送文件名
 * 2.发送大数据的时候使用post请求
 * 3.上传文件时使用post
 * 4.发送用户名,密码或其他保密信息使用post方法
 * 
 * 
 * */

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chihuobao.service.impl.order.OrderServiceImpl;
import com.chihuobao.service.order.OrderService;
public class BackServlet extends HttpServlet {
	//get请求
	
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/**
		 * this的3中用法
		 * 1.表示类中的属性
         2.调用本类的构造方法
         3.表示当前对象
        */
		this.doPost(request, response);
	}
	//post请求
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//设置编码
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		//获取表单参数的值
		String r1_Code=request.getParameter("r1_Code");
		//获得了网页的画笔，这时你就可以通过这个画笔在网页上画任何你想要显示的东西。
		PrintWriter pw=response.getWriter();
		
		if("1".equals(r1_Code))
		{
			String p1_MerId=request.getParameter("p1_MerId");
			String r3_Amt=request.getParameter("r3_Amt");
			String r6_Order=request.getParameter("r6_Order");
			String rp_PayDate=request.getParameter("rp_PayDate");
			
			Long orderidLon = Long.parseLong(r6_Order);
			
			System.out.println(orderidLon+"------------=========++++++++"+r6_Order);
			
			String path = request.getContextPath();
			response.sendRedirect(path+"/tmp.action?id="+orderidLon);
		}
		else
		{
			pw.println("支付失败！");
		}
		
		
		/*String p2_Order=request.getParameter("orderId");
		System.out.println(p2_Order+"------------------");*/
		
		
		
		
		
	}
	
	

}
