package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.po.ShopData;

import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerShopService;
import com.chihuobao.util.ExportUtils;
import com.chihuobao.vo.GoodsVo;
import com.chihuobao.vo.ShopDataVo;
import com.chihuobao.vo.ShopVo;


/**
 * 商家controller类
 * @author 谢韦烈
 *2017-12-04
 */

@Controller
@RequestMapping(value="/manager")
public class ManagerShopController {
	
	@Autowired
	private ManagerShopService shopService;
	
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();
	

	//跳转到商家显示页面
	@RequestMapping(value="/shop.action")
	public String shopList(){
		
		return "manager/manageShopList";
	}
	
	
	//查找所有商家
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
	
	//根据搜索条件查询所有商家
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

		// 查找商家总条数
		Integer total = shopService.selectTotalByContext(vo);

		// 有条件的查找商家
		List<ShopVo> goodsVo = shopService.searchGoodsByContextPage(vo);
		
		for(ShopVo shopvo : goodsVo){
			System.out.println(shopvo.getShopName());
		}
	
		searchShop.put("total", total);
		searchShop.put("rows", goodsVo);

		return searchShop;
	}
	
	//删除商家
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
	
	
	/*//导出execl
			@RequestMapping(value="/shopExport.action")
			public void export(String fields,String titles,String className ,HttpServletResponse response){
				
				System.out.println(fields+"-"+titles+"-"+className);
				//HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", "attachment;filename=export.xls");
				
				//创建Excel
				HSSFWorkbook wb = new HSSFWorkbook();
				HSSFSheet sheet = wb.createSheet("sheet0");
				
				try {
					
					ShopVo vo = new ShopVo();
					List<ShopVo> list = shopService.selectShopList(vo);
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
			
				
			}*/
			
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
	public @ResponseBody ShopData shopDataEdit(Integer id){
		
		ShopData shopData = shopService.shopDataEdit(id);
		System.out.println(shopData.getInPic()+"-"+shopData.getOutPic()+"-"+shopData.getOwnerId()
		+"-"+shopData.getOwnerIdDownPic()+"-"+shopData.getOwnerIdUpPic());
		
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
	
}
