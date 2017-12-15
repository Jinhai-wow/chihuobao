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
import com.chihuobao.service.manager.ManagerGoodsService;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.vo.GoodsAndGoodsStyleVo;
import com.chihuobao.vo.GoodsVo;


/**
 * 对商品进行操作的controller类
 * 谢韦烈 2017-12-1
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/manager")
public class ManagerGoodsController {

	@Autowired
	private ManagerGoodsService gService;  //商品操作的业务服务接口对象
	
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();


	
	@RequestMapping(value="/Goods.action")
	public String goodsList(){
		
		return "manager/manageGoodsList";
	}
	
	
	
	//查找所有商品列表
	@RequestMapping(value="selectgoodslist.action")
	public @ResponseBody 
	Map<String, Object> selectGoodsList(Integer page, Integer rows){
		
		Map<String, Object> goodsResult = new HashMap<String, Object>();
		
		GoodsAndGoodsStyleVo vo = new GoodsAndGoodsStyleVo();
		
		vo.setRows(rows);
		
		vo.setPage((page - 1) * rows);
		
		// 查找商品总条数
		Integer total = gService.selectGoodsTotal();
		List<GoodsVo> goodsVo = gService.selectGoodsDetailList(vo);
	
		goodsResult.put("total", total);
		goodsResult.put("rows", goodsVo);

		return goodsResult;
	}
	
	
	@RequestMapping(value="/goodsDetail.action")
	public String goodsDetail(Integer id, Model model) {

		
		
		GoodsVo vo = gService.selectGoodsDetailById(id);
		
		System.out.println();
		
		model.addAttribute("goodsDetail", vo);

		return "manager/goodsDetail";
	}
	
	
	//根据条件查找所有商品
	@RequestMapping(value = "/searchGoodsByContext.action")
	public @ResponseBody 
	Map<String, Object> searchGoodsByContext(String goodName, Integer goodStyleId, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> searchGoods = new HashMap<String, Object>();
		String name = "";

		if (goodName != "".trim() && goodName != null) {
			name = new String(goodName.getBytes("ISO-8859-1"), "UTF-8");

			System.out.println(name);
		}

		GoodsVo vo = new GoodsVo();

		vo.setGoodName(name);
		vo.setGoodStyleId(goodStyleId);

		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商家总条数
		Integer total = gService.selectTotalByContext(vo);

		// 有条件的查找商家
		List<GoodsVo> goodsVo = gService.searchGoodsByContextPage(vo);
	
		searchGoods.put("total", total);
		searchGoods.put("rows", goodsVo);

		return searchGoods;
	}
	
	
	//删除商品
	@RequestMapping(value = "/deleteGoods.action")
	public @ResponseBody Map<String, Object> deleteGoods(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		GoodsVo vo = new GoodsVo();
		vo.setIds(idList);

		Map<String, Object> deleteGoods = new HashMap<String, Object>();
		try {
			gService.deleteGoodsByids(vo);
			deleteGoods.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteGoods.put("success", false);
			// 失败原因
			deleteGoods.put("msg", e.getMessage());
		}

		// 将管理员删除操作存入表
		mOpera.setOperation("删除商品id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);
		
		
		return deleteGoods;
	}
}
