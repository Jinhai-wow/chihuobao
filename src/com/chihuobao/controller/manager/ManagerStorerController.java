package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.po.Shop;
import com.chihuobao.po.StorerAccount;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerStorerService;
import com.chihuobao.util.ExportUtils;
import com.chihuobao.vo.StorerAccountVo;




/**
 * 管理员对商家的管理控制controller类 
 * @author 谢韦烈 
 * 2017-11-24
 */
@Controller
@RequestMapping(value="/manager")
public class ManagerStorerController {

	
	@Autowired
	private ManagerStorerService storerService;
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();

	/**
	 * 删除商家功能根据商家id
	 * @return
	 */
	@RequestMapping(value = "/deletestorer.action")
	public @ResponseBody Map<String, Object> deleteStorers(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		StorerAccountVo vo = new StorerAccountVo();
		vo.setIds(idList);

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			storerService.deleteStorersByids(vo);
			result.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", false);
			// 失败原因
			result.put("msg", e.getMessage());
		}

		// 将管理员删除操作存入表
		mOpera.setOperation("删除商家id为"+ids.toString()+"的操作");
		mOperService.saveManageOper(mOpera);

		return result;
	}

	
	//进入商家编辑页面
	@RequestMapping(value = "/itemEdit.action")
	public @ResponseBody StorerAccount selectStorerByid(Integer id) {

		StorerAccount storer = storerService.selectStorerByid(id);

		return storer;
	}

	/**
	 * 更新商家信息 谢韦烈 2017-11-27
	 * 
	 * @param storeAccount
	 * @return
	 */
	@RequestMapping(value = "/updatestorer.action")
	public @ResponseBody 
	Map<String, Object> updateStorer(StorerAccount storeAccount) {

		Map<String, Object> result = new HashMap<String, Object>();

		try {
			storerService.updateStorer(storeAccount);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		// 将管理员更新操作存入表
		mOpera.setOperation("更新商家id为"+storeAccount.getId()+"的操作");
		mOperService.saveManageOper(mOpera);

		return result;
	}

	/**
	 * 查看所有商家列表 
	 */
	@RequestMapping(value = "/selectstorerlist.action")
	public @ResponseBody 
	Map<String, Object> selectStorerList(Integer page, Integer rows) {

		StorerAccountVo vo = new StorerAccountVo();
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		System.out.println(page + "--" + rows);
		Map<String, Object> result = new HashMap<String, Object>();

		// 查找商家总条数
		Integer total = storerService.queryTotal();
		List<StorerAccount> storeAccont = storerService.queryStorerAll(vo);

		result.put("total", total);
		result.put("rows", storeAccont);

		result.put("className", ManagerStorerController.class.getName());
		result.put("methodName", "getList");
		
		return result;
	}
	
	@RequestMapping(value="/getList.action")
	public @ResponseBody List<StorerAccount> getList(Integer page, Integer rows){
		StorerAccountVo vo = new StorerAccountVo();
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);
		List<StorerAccount> storeList= storerService.queryStorerAll(vo);
		
		return storeList;
	}
	
	//导出execl
	@RequestMapping(value="/storerExport.action")
	public void export(String fields,String titles,String className ,HttpServletResponse response){
		
		System.out.println(fields+"-"+titles+"-"+className);
		//HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment;filename=export.xls");
		
		//创建Excel
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet0");
		
		try {
			
			List<StorerAccount> list = storerService.SelectStorerList();
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
	
	//进入商家主页面
	@RequestMapping(value = "/text.action")
	public String text() {

		return "manager/managerStorerList";
	}
	
	

	/**
	 * 冻结用户账号 
	 */
	@RequestMapping(value = "/freezeshoper.action")
	public @ResponseBody 
	Map<String, Object> freezeShoper(Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {

			storerService.freezeStorerById(id);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}

		// 将管理员冻结操作存入表
		mOpera.setOperation("冻结商家id为"+id+"的操作");
		mOperService.saveManageOper(mOpera);
		return result;
	}

	/**
	 * 解除用户冻结状态 
	 */
	@RequestMapping(value = "/releaseshoper.action")
	public @ResponseBody Map<String, Object> releaseShoper(Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {

			storerService.releaseStorerById(id);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}

		// 将管理员解除冻结操作存入表
		mOpera.setOperation("解除冻结商家id为"+id+"的操作");
		mOperService.saveManageOper(mOpera);
		return result;
	}

	//查看商家详细
	@RequestMapping(value = "/storerdetail.action")
	public String storerDetail(Integer id, Model model) {

		StorerAccountVo sAccountVo = storerService.selectStorerDetailByid(id);
		StorerAccount storerAccount = sAccountVo.getStorerAccount();
		Shop shop = sAccountVo.getShop();
		model.addAttribute("storerAccount", storerAccount);
		model.addAttribute("shop", shop);
		return "manager/storerDetail";
	}
	
	
	

	/**
	 * 根据搜索条件查找
	 */
	@RequestMapping(value = "/searchByContext.action")
	public @ResponseBody Map<String, Object> searchByContext(String storerName, Integer accountState, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> result = new HashMap<String, Object>();
		String name = "";
		
		name = storerName;
		StorerAccountVo vo = new StorerAccountVo();
		StorerAccount storer = new StorerAccount();
		
		storer.setStorerName(name);
		storer.setAccountState(accountState);

		vo.setStorerAccount(storer);
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商家总条数
		Integer total = storerService.queryByContextTotal(storer);

		// 有条件的查找商家
		List<StorerAccount> storeAccont = storerService.searchByContextPage(vo);

		result.put("total", total);
		result.put("rows", storeAccont);

		return result;
	}

}
