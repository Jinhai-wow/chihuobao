/**
 * 
 */
package com.chihuobao.controller.business;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;

import com.chihuobao.po.Goods;
import com.chihuobao.po.Shop;
import com.chihuobao.service.business.BusinessService;
import com.chihuobao.util.PaymentUtil;
import com.chihuobao.vo.BusinessCustom;
import com.chihuobao.vo.ShopCustom;

/**
 * @description 用户查看商家页面相关控制类
 * @author 王锦海
 * @date 2017年12月15日
 * @version 1.0
 */
@Controller
class BusinessForUserController {
	@Autowired
	private BusinessService busienssService;
	
	
	@RequestMapping(value="/user/getBusiness.action")
	public String userGetBusiness(Model model, Integer shopId,HttpSession session){
//		shopId = 7;
		try {
			if (shopId == null) {
				return "user/user_login_register";
			}
			ShopCustom shop = busienssService.selectShopMsgById(shopId);
			List<Goods> goods = busienssService.seleteGoodByShopId(shopId);
			model.addAttribute("shopMsg", shop);
			model.addAttribute("goodslist", goods);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "business/business_error";
		}
		return "business/business_to_user";
	}
	
	
	@RequestMapping(value="/pay.action")
	public String pay(String orderId,String money,String FrpId){
		
		System.out.println(orderId+"--"+money+"--"+FrpId);
		
		String 	p0_Cmd="Buy",
				p1_MerId="10001126856",
				p2_Order=orderId,
				p3_Amt="0.1",
				p4_Cur="CNY",
				p5_Pid="",
				p6_Pcat="",
				p7_Pdesc="",
				p8_Url="http://172.16.12.159:8080/CHB/backServlet",
				p9_SAF="",
				pa_MP="",
				pd_FrpId=FrpId,
				pr_NeedResponse="1";
		
		String keyValue="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		String hmac=PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		String url="https://www.yeepay.com/app-merchant-proxy/node?"+
		"&p0_Cmd="+p0_Cmd+
		"&p1_MerId="+p1_MerId+
		"&p2_Order="+p2_Order+
		"&p3_Amt="+p3_Amt+
		"&p4_Cur="+p4_Cur+
		"&p5_Pid="+p5_Pid+
		"&p6_Pcat="+p6_Pcat+
		"&p7_Pdesc="+p7_Pdesc+
		"&p8_Url="+p8_Url+
		"&p9_SAF="+p9_SAF+
		"&pa_MP="+pa_MP+
		"&pd_FrpId="+pd_FrpId+
		"&pr_NeedResponse="+pr_NeedResponse+
		"&hmac="+hmac;
		//重新发送请求
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/back.action")
	public void back(String r1_Code){
		
		System.out.println(666666+"---------------------------");
		/*String r1_Code=request.getParameter("r1_Code");
		//获得了网页的画笔，这时你就可以通过这个画笔在网页上画任何你想要显示的东西。
		PrintWriter pw=response.getWriter();
		if("1".equals(r1_Code))
		{
			String p1_MerId=request.getParameter("p1_MerId");
			String r3_Amt=request.getParameter("r3_Amt");
			String r6_Order=request.getParameter("r6_Order");
			String rp_PayDate=request.getParameter("rp_PayDate");
			pw.println("支付成功！<br/>"
					+ "商户编号："+p1_MerId+"<br/>"
					+ "支付金额："+r3_Amt+"<br/>"
					+"商户订单号："+r6_Order+"<br/>"
					+"支付成功时间："+rp_PayDate);
		}
		else
		{
			pw.println("支付失败！");
		}
*/
		
	}
	
	
	
}
