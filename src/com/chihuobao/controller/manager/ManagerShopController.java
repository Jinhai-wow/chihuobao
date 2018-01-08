package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.po.ShopData;
import com.chihuobao.po.StorerMessage;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerMessageService;
import com.chihuobao.service.manager.ManagerShopService;

import com.chihuobao.vo.GoodsVo;
import com.chihuobao.vo.ShopDataVo;
import com.chihuobao.vo.ShopVo;


/**
 * 管理员对商家controller类
 * @author 谢韦烈
 *2017-12-04
 */

@Controller
@RequestMapping(value="/manager")
public class ManagerShopController {
	
	@Autowired
	private ManagerShopService shopService; //管理员的商店业务逻辑接口类
	
	@Autowired
	private ManageOperService mOperService; //记录操作业务逻辑接口类
	
	@Autowired
	private ManagerMessageService mMessageService; //消息管理的服务接口

	ManagerOpera mOpera = new ManagerOpera(); //记录操作实体类
	StorerMessage storerMessage = new StorerMessage(); //商家消息实体类

	//跳转到商店显示页面
	@RequestMapping(value="/shop.action")
	public String shopList(){
		
		return "manager/manageShopList";
	}
	
	
	//查找所有商店
	@RequestMapping(value="/selectShoplist.action")
	public @ResponseBody
	Map<String, Object> selectShoplist(Integer page, Integer rows){
		
		Map<String, Object> shopResult = new HashMap<String, Object>();
		
		ShopVo vo = new ShopVo();
		
		vo.setRows(rows);
		
		vo.setPage((page - 1) * rows);
		
		// 查找商品总条数
		Integer total = shopService.selectShopTotal();
		List<ShopVo> shopVo = shopService.selectShopList(vo);
		
		shopResult.put("total", total);
		shopResult.put("rows", shopVo);

		return shopResult;
	}
	
	//根据搜索条件查询所有商店
	@RequestMapping(value="/searchShopByContext.action")
	public @ResponseBody 
	Map<String, Object> searchShopByContext(String shopName, Integer shopStyleId, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> searchShop = new HashMap<String, Object>();
		String name = "";

		if (shopName != "".trim() && shopName != null) {
			name = new String(shopName.getBytes("ISO-8859-1"), "UTF-8");

			System.out.println(name);
		}

		ShopVo vo = new ShopVo();

		vo.setShopName(name);
		vo.setShopStyleId(shopStyleId);

		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商店总条数
		Integer total = shopService.selectTotalByContext(vo);

		// 有条件的查找商店
		List<ShopVo> goodsVo = shopService.searchGoodsByContextPage(vo);
		
		for(ShopVo shopvo : goodsVo){
			System.out.println(shopvo.getShopName());
		}
	
		searchShop.put("total", total);
		searchShop.put("rows", goodsVo);

		return searchShop;
	}
	
	//删除商店
	@RequestMapping(value="/deleteShop.action")
	public @ResponseBody Map<String, Object> deleteShop(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		ShopVo vo = new ShopVo();
		vo.setIds(idList);

		Map<String, Object> deleteShop = new HashMap<String, Object>();
		try {
			shopService.deleteGoodsByids(vo);
			deleteShop.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteShop.put("success", false);
			// 失败原因
			deleteShop.put("msg", e.getMessage());
		}
		
		
		// 将管理员删除操作存入表
		mOpera.setOperation("删除商店id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);

		return deleteShop;
	}
	
	
	//查看详情
	@RequestMapping(value="/ShopGoodsDetail.action")
	public String shopGoodsDetail(Integer id, Model model) {

		List<GoodsVo> vo = shopService.selectGoodsByShopId(id);
		
		
		model.addAttribute("shopDetail", vo);

		return "manager/shopDetail";
	}
	

			
	//跳转审核页面
	@RequestMapping(value="/shopData.action")
	public String shopData(){
		
		return "manager/managerAuditShopDataList";
	}
	//跳转到审核成功查看页面
	@RequestMapping(value="/shopDataAuditSuccess.action")
	public String shopDataAuditSuccess(){
		
		return "manager/managerAuditSuccessList";
	}
	//跳转到审核失败查看页面
	@RequestMapping(value="/shopDataAuditFalse.action")
	public String shopDataAuditFalse(){
			
		return "manager/managerAuditFalseList";
	}
	
	
	//审核商家入驻资料
	@RequestMapping(value="/selectShopDataList.action")
	public @ResponseBody
	Map<String,Object> selectShopDataList(Integer page,Integer rows,Integer auditState){
		
		Map<String,Object> shopDataResult = new HashMap<String, Object>();
		ShopDataVo shopDataVo = new ShopDataVo();
		shopDataVo.setRows(rows);
		shopDataVo.setPage((page - 1) * rows);
		shopDataVo.setAuditState(auditState);
		Integer total = shopService.selectShopDataTotal(shopDataVo);
		
		List<ShopDataVo> shopDataList = shopService.selectShopDataList(shopDataVo);
		for(ShopDataVo vo : shopDataList){
			System.out.println(vo.getOutPic()+"-"+vo.getShopId()+"-"+vo.getShopNumber());
		}   
		
		
		shopDataResult.put("total", total);
		shopDataResult.put("rows", shopDataList);
		
		return shopDataResult;
	}
	
	//根据商店审核资料id获取信息回显到审核页面
	@RequestMapping(value="/shopDataEdit.action")
	public @ResponseBody ShopData shopDataEdit(Integer id,HttpSession session){
		
		ShopData shopData = shopService.shopDataEdit(id);
		System.out.println(shopData.getInPic()+"-"+shopData.getOutPic()+"-"+shopData.getOwnerId()
		+"-"+shopData.getOwnerIdDownPic()+"-"+shopData.getOwnerIdUpPic());
		
		session.setAttribute("Data", shopData);
		return shopData;
	}
	
	//审核成功并将状态id置1
	@RequestMapping(value="/auditSuccess.action")
	public @ResponseBody 
	Map<String, Object> auditSuccess(ShopData shopData) {

		Map<String, Object> result = new HashMap<String, Object>();
		Integer shopId = shopData.getShopId();
		
		try {
			
			shopService.auditSuccess(shopId);
			//保存建议
			shopService.auditShopDataAdvise(shopData);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		
		
		// 将管理员更新操作存入表
		mOpera.setOperation("审核商家id为"+shopId+"的通过操作");
		mOperService.saveManageOper(mOpera);
		
		//将审核商店申请资料存入用户消息表
		storerMessage.setMessage("你好，你的审核资料已通过审核，请查看，如有问题可联系客服");
		storerMessage.setStorerId(selectStorerIdByShopId(shopId));
		mMessageService.saveStorerMessage(storerMessage);

		return result;
	}
	
	//审核失败并将状态值置为2
	@RequestMapping(value="/auditFail.action")
	public @ResponseBody 
	Map<String, Object> auditFail(ShopData shopData) {
		Integer shopId = shopData.getShopId();
		
		Map<String, Object> result = new HashMap<String, Object>();

		try {
			
			shopService.auditFail(shopId);
			//保存建议
			shopService.auditShopDataAdvise(shopData);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		// 将管理员更新操作存入表
		mOpera.setOperation("审核商家id为"+shopId+"的不通过操作");
		mOperService.saveManageOper(mOpera);
		
		//将审核商店申请资料存入用户消息表
		storerMessage.setMessage("你好，你的审核资料未通过审核，请查看，如有问题可联系客服");
		storerMessage.setStorerId(selectStorerIdByShopId(shopId));
		mMessageService.saveStorerMessage(storerMessage);


		return result;
	}
	
	
	
	
	//根据资料id删除审核的资料结果
	@RequestMapping(value="/deleteAuditShopData.action")
	public @ResponseBody Map<String, Object> deleteAuditShopData(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		ShopDataVo vo = new ShopDataVo();
		vo.setIds(idList);

		Map<String, Object> deleteShop = new HashMap<String, Object>();
		try {
			shopService.deleteAuditShopData(vo);
			deleteShop.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteShop.put("success", false);
			// 失败原因
			deleteShop.put("msg", e.getMessage());
		}
		
		
		// 将管理员删除操作存入表
		mOpera.setOperation("删除商店id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);

		return deleteShop;
	}
	
	
	//审核地址定位
	@RequestMapping(value="/position.action")
	public String position(String longitude,String latitude,String serviceScope,HttpServletRequest req){
		
		req.setAttribute("longitude", longitude);
		req.setAttribute("latitude", latitude);
		req.setAttribute("serviceScope", serviceScope);
		//System.out.println(longitude+"-"+latitude+"-"+serviceScope);
		return "manager/shopPosition";
	}
	
	//根据shopId找出storerId
	public Integer selectStorerIdByShopId(Integer shopId){
		
		Integer storerId = shopService.selectStorerIdByShopId(shopId);
		return storerId;
	}
	
}
