package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.OrderAnalyse;
import com.chihuobao.po.ShopAnalyse;
import com.chihuobao.po.User;
import com.chihuobao.service.manager.ManagerDataAnalyseServie;
import com.chihuobao.util.ExportUtils;
import com.chihuobao.vo.UserVo;

/**
 * 数据分析控制controller类
 * @author 谢韦烈
 * 2017-12-6
 */

@Controller
@RequestMapping(value="/manager")
public class DataAnalyseController {

	@Autowired
	private ManagerDataAnalyseServie dAnalyseService;
	
	//四张表联合查询当天的订单中购买最多的商品和商家，并存入数据库（定时）
	@RequestMapping(value="/orderDataAnalyse.action")
	public void orderDataAnalyse(String date){
		
		
		//System.out.println(d.toLocaleString());
		OrderAnalyse orderAnalyse= dAnalyseService.selectOrderAnalyseResult(date);
		dAnalyseService.saveOrderAnalyseResult(orderAnalyse);
		
		//记录每天销售商品最多的商家
		ShopAnalyse shopAnalyse = dAnalyseService.selectShopAnalyseResult(date);
		dAnalyseService.saveShopAnalyseResult(shopAnalyse);
	}
	
	//查找当天最热销的商品
	@RequestMapping(value="/bestGoods.action")
	public String selectBestGoods(){
		
		return "manager/manageBestGoodsList";
	}
	
	//查找当天最热销的商品列表
	@RequestMapping(value="/selectBestGoodsList.action")
	public @ResponseBody
	Map<String, Object> selectBestGoodsList(Integer page, Integer rows){
		
		Map<String, Object> bestGoodsResult = new HashMap<String, Object>();
		
		OrderAnalyse vo = new OrderAnalyse();
		
		vo.setRows(rows);
		
		vo.setPage((page - 1) * rows);
		
		// 查找条数
		Integer total = dAnalyseService.selectBestGoodsTotal();
		List<OrderAnalyse> analyseVo = dAnalyseService.selectBestGoodsList(vo);
		
		for(OrderAnalyse oa : analyseVo){
			
			System.out.println(oa.getGoodsName()+"-"+oa.getGoodsMoney()+"-"+oa.getShopStyleName());;
		}
		
		
		bestGoodsResult.put("total", total);
		bestGoodsResult.put("rows", analyseVo);
		
		return bestGoodsResult;
	}
	
	
	//导出execl
	@RequestMapping(value="/bestGoodsExport.action")
	public void export(String fields,String titles,String className ,HttpServletResponse response){
				
		//System.out.println(fields+"-"+titles+"-"+className);
		//HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=export.xls");
				
		//创建Excel
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet0");
				
		try {
					
			OrderAnalyse vo = new OrderAnalyse();
			List<OrderAnalyse> list = dAnalyseService.selectBestGoodsList(vo);
			//titles = new String(titles.getBytes("ISO-8859-1"),"UTF-8");
			ExportUtils.outputHeaders(titles.split(","), sheet);
			ExportUtils.outputColumns(fields.split(","), list, sheet, 1);
			//获取输出流，写入excel 并关闭
			ServletOutputStream out = response.getOutputStream();
				wb.write(out);
				out.flush();
				out.close();
					
			} catch (Exception e) {
				e.printStackTrace();
		}
			
	}
			
			
	//进到热销商品图形显示		
	@RequestMapping(value="/goodsCharts.action")
	public String goodsCharts(){
			
		return "manager/managerGoodsECharts";
	}
		
	//异步获取数据到图表显示	
	 @RequestMapping(value="/goodsChartsList.action")
	 public @ResponseBody
	 List<OrderAnalyse> goodsChart(){
		
			// 查找条数
			List<OrderAnalyse> analyseVo = dAnalyseService.goodsChart();

			return analyseVo;
		}
	
	 
	//进入当天销售最多的商家页面
		@RequestMapping(value="/bestShop.action")
		public String bestShop(){
			
			return "manager/manageBestShopList";
		}
		//查找当天销售最多的商家
		@RequestMapping(value="/selectBestShopList.action")
		public @ResponseBody
		Map<String, Object> selectBestShopList(Integer page, Integer rows){
			
			Map<String, Object> bestShopResult = new HashMap<String, Object>();
			
			ShopAnalyse vo = new ShopAnalyse();
			
			vo.setRows(rows);
			
			vo.setPage((page - 1) * rows);
			
			// 查找条数
			Integer total = dAnalyseService.selectBestShopTotal();
			List<ShopAnalyse> analyseVo = dAnalyseService.selectBestShopList(vo);
		
			
			bestShopResult.put("total", total);
			bestShopResult.put("rows", analyseVo);
			
			return bestShopResult;
		}
		
		//进入销售商品最多的商家图表显示页面
		@RequestMapping(value="/shopCharts.action")
		public String shopCharts(){
			
			return "manager/managerShopECharts";
		}
		//异步获取销售最多商品的商家数据显示在图上
		@RequestMapping(value="/shopChartsList.action")
		public @ResponseBody
		 List<ShopAnalyse> shopChartsList(){
			
				
				List<ShopAnalyse> analyseVo = dAnalyseService.selectBestShop();

				return analyseVo;
			}
		
		//导出每天销售最多商品的商家execl
		@RequestMapping(value="/shopGoodsExport.action")
		public void shopGoodsExport(String fields,String titles,String className ,HttpServletResponse response){
			
			//System.out.println(fields+"-"+titles+"-"+className);
			//HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=export.xls");
			
			//创建Excel
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("sheet0");
			
			try {
				
				ShopAnalyse vo = new ShopAnalyse();
				List<ShopAnalyse> list = dAnalyseService.selectBestShopList(vo);
				//titles = new String(titles.getBytes("ISO-8859-1"),"UTF-8");
				ExportUtils.outputHeaders(titles.split(","), sheet);
				ExportUtils.outputColumns(fields.split(","), list, sheet, 1);
				//获取输出流，写入excel 并关闭
				ServletOutputStream out = response.getOutputStream();
				wb.write(out);
				out.flush();
				out.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		}
		
		
		//通过时间查找某天销售最多的商品
		@RequestMapping(value="/selectBestGoodsByTime.action")
		public @ResponseBody Map<String, Object> selectBestGoodsByTime(String payTime,Integer page,
				Integer rows) throws UnsupportedEncodingException {

			Map<String, Object> result = new HashMap<String, Object>();
			String time = "";

			if (payTime != "".trim() && payTime != null) {
				time = payTime;
			}

			OrderAnalyse vo = new OrderAnalyse();
			
			// 查找条数
			Integer total = dAnalyseService.selectBestGoodsTotalByTime(payTime);
			List<OrderAnalyse> analyseVo = dAnalyseService.selectBestGoodsListByTime(payTime);
			
			result.put("total", total);
			result.put("rows", analyseVo);

			return result;
		}
		
		
		//通过时间查找某天销售量最多的商家
	@RequestMapping(value = "/selectBestShopByTime.action")
	public @ResponseBody Map<String, Object> selectBestShopByTime(String payTime, Integer page, Integer rows)
			throws UnsupportedEncodingException {

		Map<String, Object> result = new HashMap<String, Object>();
		

		ShopAnalyse vo = new ShopAnalyse();

		// 查找条数
		Integer total = dAnalyseService.selectBestShopTotalByTime(payTime);
		List<OrderAnalyse> analyseVo = dAnalyseService.selectBestShopListByTime(payTime);

		result.put("total", total);
		result.put("rows", analyseVo);

		return result;
	}
	
	
	//异步查找在某个时间范围内的每天被卖出最多的商品，图表显示
	@RequestMapping(value="/goodsChartsListBydate.action")
	public @ResponseBody
	 List<OrderAnalyse> goodsChartsListBydate(String fromdate,String todate){

		System.out.println(fromdate+"--"+todate);
		OrderAnalyse vo = new OrderAnalyse();
		vo.setFromdate(fromdate);
		vo.setTodate(todate);

		List<OrderAnalyse> analyseVo = dAnalyseService.goodsChartsListBydate(vo);
		
		return analyseVo;
	}
	
	
	//异步查找在某个时间范围内的每天卖出最多商品的商店，图表显示
		@RequestMapping(value="/shopChartsListBydate.action")
		public @ResponseBody
		 List<ShopAnalyse> shopChartsListBydate(String fromdate,String todate){

			//System.out.println(fromdate+"--"+todate);
			ShopAnalyse vo = new ShopAnalyse();
			vo.setFromdate(fromdate);
			vo.setTodate(todate);

			List<ShopAnalyse> analyseVo = dAnalyseService.shopChartsListBydate(vo);
			
			return analyseVo;
		}

}
