package com.chihuobao.controller.manager;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chihuobao.po.ManagerOpera;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.vo.ManagerOperaVo;

/**
 * 管理员操作controller类
 * 
 * @author Administrator
 *
 */
@Controller
@RequestMapping(value="/manager")
public class ManagerOperaController {

	@Autowired
	private ManageOperService mOperService;

	// 查找操作的记录
	@RequestMapping(value = "/selectopera.action")
	public @ResponseBody Map<String, Object> selectOpera(Integer page, Integer rows) {

		Map<String, Object> oper = new HashMap<String, Object>();

		ManagerOperaVo vo = new ManagerOperaVo();
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商家总条数
		Integer total = mOperService.getOperTotal();
		System.out.println(total);
		List<ManagerOpera> mOper = mOperService.selectOperAll(vo);


		oper.put("total", total);
		oper.put("rows", mOper);
		return oper;
	}

	//访问的开始方法
	@RequestMapping(value = "/oper.action")
	public String oper() {

		return "manager/manageOperaList";
	}

	@RequestMapping(value = "/deleteoper.action")
	public @ResponseBody Map<String, Object> deleteManageOper(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");

		List<Integer> idList = new ArrayList<Integer>();

		for (int i = 0; i < idStringList.length; i++) {

			idList.add(Integer.parseInt(idStringList[i]));
		}

		ManagerOperaVo vo = new ManagerOperaVo();
		vo.setIds(idList);

		Map<String, Object> deleteresult = new HashMap<String, Object>();
		try {
			mOperService.deleteOperasByids(vo);
			deleteresult.put("success", true);

		} catch (Exception e) {
			e.printStackTrace();
			deleteresult.put("success", false);
			// 失败原因
			deleteresult.put("msg", e.getMessage());
		}

		return deleteresult;
	}
	
	
	@RequestMapping(value = "/searchByOpera.action")
	public @ResponseBody Map<String, Object> searchByOpera(String operation, Integer operaRole, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> searchResult = new HashMap<String, Object>();
		String name = "";

		if (operation != "".trim() && operation != null) {
			name = new String(operation.getBytes("ISO-8859-1"), "UTF-8");

			System.out.println(name);
		}


		ManagerOperaVo vo = new ManagerOperaVo();
		ManagerOpera opera = new ManagerOpera();

		opera.setOperation(name);
		opera.setOperaRole(operaRole);

		vo.setmOpera(opera);
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商家总条数
		Integer total = mOperService.selectByOperaTotal(opera);

		// 有条件的查找商家
		List<ManagerOpera> operaList = mOperService.searchByOperaPage(vo);

		searchResult.put("total", total);
		searchResult.put("rows", operaList);

		return searchResult;
	}
	

}
