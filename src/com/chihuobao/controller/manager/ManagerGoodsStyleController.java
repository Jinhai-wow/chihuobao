package com.chihuobao.controller.manager;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.GoodsStyle;

import com.chihuobao.service.manager.ManagerGoodsStyleService;

@Controller
@RequestMapping(value="/manager")
public class ManagerGoodsStyleController {

	@Autowired
	private ManagerGoodsStyleService gStyleService;
	
	@RequestMapping(value="/xiala.action")
	public @ResponseBody 
	Map<String, Object> selectGoodsStyle(){
		
		Map<String, Object> goodsStyleResult = new HashMap<String, Object>();
		
		
		try {

			List<GoodsStyle> goodsStyle = gStyleService.selectGoodsStyle();
			for(GoodsStyle gs : goodsStyle){
				System.out.print(gs.getStyleName());
			}
			
			
			goodsStyleResult.put("goodsStyle", goodsStyle);
			goodsStyleResult.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			goodsStyleResult.put("success", "666");
		}
		return goodsStyleResult;
		
	}
	


	
}
