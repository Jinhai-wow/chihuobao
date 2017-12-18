package com.chihuobao.controller.order;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.chihuobao.util.Utils;
import com.chihuobao.po.Address;
import com.chihuobao.po.Complain;
import com.chihuobao.po.Ordergoods;

import com.chihuobao.po.Ordertable;
import com.chihuobao.po.PageBean;
import com.chihuobao.po.UtilBean;
import com.chihuobao.po.Shop;
import com.chihuobao.po.Shopcart;
import com.chihuobao.po.Shopcartlist;
import com.chihuobao.po.UserForOrder;
import com.chihuobao.po.UserForOrderAddress;
import com.chihuobao.service.order.OrderService;
import com.github.pagehelper.PageInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	/* 映射所有路径 */
	@RequestMapping("/{page}")
	public String openPage(@PathVariable String page) {

		return page;
	}

	/*
	 * 根据订单id获取订单 ，进入订单详情页调用
	 * 
	 * @param id :订单id
	 */

	@RequestMapping(value = { "/orderDetail.action" })
	public String getOrder(Model model, @RequestParam("id") long id) {

		Ordertable order = orderService.getOrder(id);
		UserForOrder user = orderService.getUser(order.getUserid());
		model.addAttribute("username", user.getUsername());
		model.addAttribute("order", order);
		model.addAttribute("ordergoodslist", order.getOrdergoodsList());
		System.out.println(order);
		for (Ordergoods ordergoods : order.getOrdergoodsList()) {
			System.out.println(ordergoods);
		}

		return "order/orderDetail";
	}

	/*
	 * 进入订单列表页面
	 * 
	 */
	@RequestMapping(value = { "/orderList.action" })
	public String getOrderListByPagination(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "rows", required = false, defaultValue = "5") Integer rows, HttpSession session) {

		/*
		 * session.setAttribute("test", "测试session"); PageBean pageBean = new
		 * PageBean(); pageBean.setPage(page);
		 * 
		 * pageBean.setRows(rows); List<Ordertable> orderList =
		 * orderService.getOrderListByPagination(pageBean);
		 * 
		 * int orderListSize = orderService.getOrderListSize();
		 * System.out.println(orderList); System.out.println(orderListSize);
		 * 注意键值全部用小写 model.addAttribute("orderlist", orderList);
		 * model.addAttribute("orderlistsize", orderListSize);
		 */
		/*
		 * for (Ordertable ordertable : orderList) {
		 * orderService.getShop(ordertable.shopid); }
		 */

		/*
		 * for (Ordertable ordertable : orderList) {
		 * System.out.println(ordertable);
		 * 
		 * for (Ordergoods ordergoods : ordertable.getOrdergoodsList()) {
		 * System.out.println(ordergoods); } }
		 */
		return "order/orderList";
	}

	/*
	 * 
	 * 使用ajax 获取分页订单数据
	 * 
	 * 
	 */
	@RequestMapping("/ajaxorderlist.action")
	public @ResponseBody List<Ordertable> ajaxGetOrderListByPagination(@RequestBody PageBean pageBean) {
		System.out.println(pageBean);
		/* 先查ordertable的，再查ordergoods的 */
		List<Ordertable> orderList = orderService.getOrderListByPagination(pageBean);

		for (int i = 0; i < orderList.size(); i++) {
			/*
			 * if(orderList.get(i).getId()==){
			 * 
			 * }
			 */
			orderList.get(i).setOrdergoodsList(orderService.getOrdergoodsListByOrderID(orderList.get(i).getId()));

		}
		System.out.println("ajaxorderlist:" + orderList.size());
		System.out.println(orderList);
		return orderList;
	}

	/* 使用ajax获取订单数量用于计算总页数 */
	@RequestMapping("/ajaxorderlistsize.action")
	public @ResponseBody Integer ajaxGetOrderListSize() {
		return orderService.getOrderListSize();
	}

	/* 不加@RequestParam("shopcartId")也行，因为Integer shopcartid的shopcartid与传递的相同 */

	/* 下单则从shopcart和shopcartlist表查 */
	@RequestMapping("/payOrder.action")
	public String getShopCart(Model model, @RequestParam("shopcartid") Integer shopcartid,
			@RequestParam("userid") Integer userid) {
		Shopcart shopcart = orderService.getShopCart(shopcartid);
		System.out.println(shopcartid);
		UserForOrder user = orderService.getUser(userid);
		Shop shop = orderService.getShop(shopcart.getShopid());
		/* model.addAttribute("shop",shop); */
		model.addAttribute("shopcart", shopcart);
		model.addAttribute("shopcartlist", shopcart.getShopcartlist());
		/* 只查询addrss 表state=1的即默认地址,因此list里面只有一个address */
		model.addAttribute("userfromtable", user);
		model.addAttribute("addressfromtable", user.getAddresslist().get(0));
		System.out.println("user.getAddresslist().get(0)" + user.getAddresslist().get(0).getAddress());
		model.addAttribute("shopcartid", shopcartid);
		model.addAttribute("userid", userid);
		/* System.out.println(shopcart); */
		/* System.out.println(user); */
		return "order/payOrder";
	}

	/*
	 * 提交订单
	 * 
	 * @param utilbean：对应订单页面的提交数据
	 */

	@RequestMapping("/submitOrder.action")
	public String sumitOrder(UtilBean utilbean, Model model) {

		/* json转成shopcartlist lib 12月7日加入了几个json依赖的包 */

		List<Shopcartlist> shopcartlist = new ArrayList<Shopcartlist>();
		JSONArray jsonArray = JSONArray.fromObject(utilbean.getOrdergoodsinfo());

		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObject = jsonArray.getJSONObject(i);
			Shopcartlist scl = (Shopcartlist) JSONObject.toBean(jsonObject, Shopcartlist.class);
			shopcartlist.add(scl);
		}
		/*
		 * 写数据到数据库 先插入数据到ordertable表中，然后才插入到ordergoods表中
		 * ordergoods表插入的是list需要批量插入
		 */
		/* 1.新建订单对象 */
		Ordertable ordertable = new Ordertable();

		/* 2.先查询shop的数据 */
		Shop shop = orderService.getShop(utilbean.getShopid());
		UserForOrder user = orderService.getUser(utilbean.getUserid());

		/* 3设置ordertable里面的值 对着ordertable表的列设置 */
		long orderid = Utils.getOrderID();
		ordertable.setId(orderid);
		ordertable.setUserid(user.getId());
		ordertable.setShopid(utilbean.getShopid());
		ordertable.setShoppic(shop.getShopPic());
		ordertable.setShopcartid(utilbean.getShopcartid());
		ordertable.setShopname(shop.getShopName());
		ordertable.setArrivetime(utilbean.getArrivetime());
		ordertable.setDelivermethod("第三方");
		ordertable.setUseraddress(user.getAddresslist().get(0).getAddress());
		ordertable.setPaymethod("在线支付");
		/* 这里设置时间可能有问题 */

		ordertable.setCreatetime(new Date());

		/* 订单状态 0未付款 1已付款并接单，2送货中，3订单完成，4订单取消（申请退款） */
		ordertable.setOrderstate(1);
		ordertable.setTotalmoney(utilbean.getTotalMoney());
		ordertable.setRemark(utilbean.getRemark());
		ordertable.setShopphone(shop.getTelephone());
		model.addAttribute("order", ordertable);
		model.addAttribute("orderid", ordertable.getId());

		/* 向数据库添加订单 */
		orderService.addOrder(ordertable);

		/* 新建ordergoods对象 */
		for (int i = 0; i < shopcartlist.size(); i++) {
			Ordergoods ordergoods = new Ordergoods();
			ordergoods.setOrderid(orderid);
			ordergoods.setGoodsname(shopcartlist.get(i).getGoodsname());
			ordergoods.setGoodsquatity(shopcartlist.get(i).getGoodsquatity());
			ordergoods.setGoodsmoney(shopcartlist.get(i).getGoodsprice());
			/* 循环插入ordergoods表 */
			orderService.addOrderGoods(ordergoods);
		}

		System.out.println("ordertable" + ordertable);

		return "redirect:/orderList.action";

	}

	/*
	 * 到评价订单页面 id：订单id
	 */

	@RequestMapping(value = { "/evaluateOrder.action" })
	public String toEvalueOrder(Model model, @RequestParam("id") long id) {

		Ordertable order = orderService.getOrder(id);

		Date createtime = order.getCreatetime();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createtimeStr = dateFormat.format(createtime);
		model.addAttribute("createtime", createtimeStr);
		model.addAttribute("order", order);

		model.addAttribute("ordergoodslist", order.getOrdergoodsList());

		return "order/evaluateOrder";
	}
	/*
	 * 提交订单评价
	 * 
	 * @param ordertable:订单
	 */

	@RequestMapping("/submitEvaluateOrder.action")
	public String submitEvaluateOrder(Ordertable ordertable, HttpServletRequest request, RedirectAttributes attr) {
		// 已评价订单
		ordertable.setOrderstate(8);
		orderService.updateOrder(ordertable);

		return "redirect:/orderList.action";
	}

	/*
	 * 确认收货
	 * 
	 * @param id：订单id
	 */
	@RequestMapping("/confirmReceive.action")
	public String updateOrderState(long id, Model model) {

		orderService.updateOrderState(id);
		return "redirect:/orderList.action";
	}
	/*
	 * 申请取消订单
	 * 
	 * @param id：订单id
	 */

	@RequestMapping("/applyCancelOrder.action")
	public String applyCancelOrder(long id, HttpServletRequest request) {

		orderService.applyCancelOrder(id);

		return "redirect:/orderList.action";
	}
	/*
	 * 投诉
	 * 
	 * @param complain：投诉类
	 */

	@RequestMapping("/complain.action")
	public String addComplain(Complain complain) {
		orderService.addComplain(complain);

		return "redirect:/orderList.action";

	}

	/*
	 * 下单页面 添加新地址
	 * 
	 * @param userForOrderAddress：地址类 attributes：重定向后要携带参数
	 */

	@RequestMapping("/addNewAddress.action")
	public String addNewAddress(UserForOrderAddress userForOrderAddress, RedirectAttributes attributes) {

		/*
		 * UserForOrder userForOrder = new UserForOrder();
		 * userForOrder.setId(userForOrderAddress.getUserid());
		 * userForOrder.setUsername(userForOrderAddress.getUsername());
		 * userForOrder.setSex(userForOrderAddress.getSex());
		 * userForOrder.setPhone(userForOrderAddress.getPhone());
		 */
		/* 只添加地址 */
		Address address = new Address();
		address.setUserid(userForOrderAddress.getUserid());
		address.setAddress(userForOrderAddress.getUsername() + " " + userForOrderAddress.getPhone() + " "
				+ userForOrderAddress.getPosition() + " " + userForOrderAddress.getDetailaddress());

		/* orderService.updateUser(userForOrder); */
		/*先把其他地址state置0*/
		orderService.modifyAddressState();
		orderService.addAddress(address);
		/* shopcartid=1&userid=1 */
		attributes.addAttribute("shopcartid", userForOrderAddress.getShopcartid());
		attributes.addAttribute("userid", userForOrderAddress.getUserid());

		return "redirect:/payOrder.action";

	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

}
