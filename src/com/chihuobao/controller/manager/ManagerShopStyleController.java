package com.chihuobao.controller.manager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.po.ShopStyle;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerShopStyleService;
import com.chihuobao.vo.ShopStyleVo;


@Controller
@RequestMapping(value="/manager")
public class ManagerShopStyleController {

	@Autowired
	private ManagerShopStyleService shopStyleService;
	
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();
	
	
	
	@RequestMapping(value="/shopStyle.action")
	public @ResponseBody 
	Map<String, Object> selectShopStyle(){
		
		Map<String, Object> ShopStyleResult = new HashMap<String, Object>();
		
		try {

			List<ShopStyle> ShopStyle = shopStyleService.selectShopStyle();
			
			for(ShopStyle ss : ShopStyle){
				System.out.print(ss.getStyleName());
			}
			
			
			ShopStyleResult.put("goodsStyle", ShopStyle);
			ShopStyleResult.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			ShopStyleResult.put("success", "666");
		}
		
		return ShopStyleResult;
	}
	
	//加载商家类型列表界面
	@RequestMapping(value="/goodsStyle.action")
	public String goodsStyle(){
		
		return "manager/manageShopStyleList";
	}
	
	
	//新增商家类型
	@RequestMapping(value="/saveShopStyle.action")
	public @ResponseBody Map<String, Object> saveShopStyle(ShopStyle shopStyle){
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		try{
			shopStyleService.saveShopStyle(shopStyle);
			result.put("success", true);
		}catch(Exception e){
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		// 将管理员新增操作存入表
		mOpera.setOperation("新增商家类型为"+shopStyle.getStyleName()+"的操作");
		mOperService.saveManageOper(mOpera);

		
		
		return result;
	}
	
	
	//查看所有的商家类型列表
	@RequestMapping(value="/shopStyleList.action")
	public @ResponseBody 
	Map<String, Object> selectshopStyleList(Integer page, Integer rows){
		
		Map<String, Object> shopStyleResult = new HashMap<String, Object>();
		
		ShopStyleVo vo = new ShopStyleVo();
		
		vo.setRows(rows);
		
		vo.setPage((page - 1) * rows);
		
		// 查找商品总条数
		Integer total = shopStyleService.selectShopStyleTotal();
		List<ShopStyleVo> shopStyle = shopStyleService.selectShopStyleList(vo);
	
		shopStyleResult.put("total", total);
		shopStyleResult.put("rows", shopStyle);

		return shopStyleResult;
	}
	
	
	//根据id搜索类型显示到编辑页面
	@RequestMapping(value="/shopStyleEdit.action")
	public @ResponseBody ShopStyle selectShopStyleByid(Integer id) {

		ShopStyle shopStyle = shopStyleService.selectShopStyleByid(id);

		return shopStyle;
	}
	
	
	//更新编辑的功能
	@RequestMapping(value="/updateShopStyle.action")
	public @ResponseBody 
	Map<String, Object> updateShopStyle(ShopStyle shopStyle) {

		Map<String, Object> result = new HashMap<String, Object>();

		try {
			shopStyleService.updateShopStyle(shopStyle);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		// 将管理员更新操作存入表
		mOpera.setOperation("更新商家类型为"+shopStyle.getStyleName()+"的操作");
		mOperService.saveManageOper(mOpera);

		return result;
	}
	
	
	//根据id删除商品分类
	@RequestMapping(value="/deleteShopStyle.action")
	public @ResponseBody Map<String, Object> deleteShopStyle(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		ShopStyleVo vo = new ShopStyleVo();
		vo.setIds(idList);

		Map<String, Object> deleteShopStyle = new HashMap<String, Object>();
		try {
			shopStyleService.deleteShopStyleByids(vo);
			deleteShopStyle.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteShopStyle.put("success", false);
			// 失败原因
			deleteShopStyle.put("msg", e.getMessage());
		}
		
		
		// 将管理员删除操作存入表
		mOpera.setOperation("删除商家类型id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);

		return deleteShopStyle;
	}

}
