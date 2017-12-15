package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.po.ManagerOrderGoods;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerOrderService;
import com.chihuobao.vo.ManagerOrderVo;




@Controller
@RequestMapping(value="/manager")
public class ManagerOrderController {
	
	@Autowired
	private ManagerOrderService orderService;
	
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();
	

	//跳转到商家显示页面
	@RequestMapping(value="/order.action")
	public String shopList(){
		
		return "manager/manageOrderList";
	}
	
	//查找所有订单
	@RequestMapping(value="/selectOrderList.action")
	public @ResponseBody
	Map<String, Object> selectShoplist(Integer page, Integer rows){
		
		Map<String, Object> orderResult = new HashMap<String, Object>();
		
		ManagerOrderVo vo = new ManagerOrderVo();
		
		vo.setRows(rows);
		
		vo.setPage((page - 1) * rows);
		
		// 查找商品总条数
		Integer total = orderService.selectOrderTotal();
		List<ManagerOrderVo> orderVo = orderService.selectOrderList(vo);
		
		orderResult.put("total", total);
		orderResult.put("rows", orderVo);

		return orderResult;
	}
	
	
	/**
	 * 查找订单的类型
	 * @return
	 */
	@RequestMapping(value="/orderState.action")
	public @ResponseBody 
	Map<String, Object> selectOrderState(){
		
		Map<String, Object> orderState = new HashMap<String, Object>();
		String [] stateName = {"已结单","未收货"};
		
		try {

			List<ManagerOrderVo> orderVo = orderService.selectOrderState();
			
			orderState.put("orderVo", orderVo);
			orderState.put("stateName", stateName);
			orderState.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			orderState.put("success", "666");
		}
		
		return orderState;
	}
	
	
	@RequestMapping(value="/searchOrderByContext.action")
	public @ResponseBody 
	Map<String, Object> searchOrderByContext(String userAddress, Integer orderState, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> searchOrder = new HashMap<String, Object>();
		String adderss = "";

		if (userAddress != "".trim() && userAddress != null) {
			adderss = new String(userAddress.getBytes("ISO-8859-1"), "UTF-8");

			System.out.println(adderss);
		}

		ManagerOrderVo vo = new ManagerOrderVo();

		vo.setUserAddress(adderss);
		vo.setOrderState(orderState);

		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 按条件查找商家总条数
		Integer total = orderService.selectTotalByContext(vo);

		// 有条件的查找商家
		List<ManagerOrderVo> orderVo = orderService.searchOrderByContextPage(vo);
		
		searchOrder.put("total", total);
		searchOrder.put("rows", orderVo);

		return searchOrder;
	}
	
	
	/**
	 * 删除订单
	 * @param ids
	 * @return
	 */
	@RequestMapping(value="/deleteOrder.action")
	public @ResponseBody Map<String, Object> deleteOrder(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Long> idList = new ArrayList<Long>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Long.parseLong(idStringList[i]));
		}

		ManagerOrderVo vo = new ManagerOrderVo();
		vo.setIds(idList);

		Map<String, Object> deleteOrder = new HashMap<String, Object>();
		try {
			orderService.deleteOrderByids(vo);
			deleteOrder.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteOrder.put("success", false);
			// 失败原因
			deleteOrder.put("msg", e.getMessage());
		}
		
		
		// 将管理员删除操作存入表
		mOpera.setOperation("删除订单id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);


		return deleteOrder;
	}
	
	
	/**
	 * 查看订单详情
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/orderGoodsDetail.action")
	public String orderGoodsDetail(Long id, Model model) {

		List<ManagerOrderGoods> vo = orderService.selectOrderGoodsByOrderId(id);
		
		
		model.addAttribute("orderDetail", vo);

		return "manager/orderDetail";
	}
	
}
