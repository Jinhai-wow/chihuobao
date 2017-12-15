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

import com.chihuobao.po.Address;
import com.chihuobao.po.ManagerOpera;

import com.chihuobao.po.User;
import com.chihuobao.service.manager.ManageOperService;
import com.chihuobao.service.manager.ManagerUserService;
import com.chihuobao.util.ExportUtils;

import com.chihuobao.vo.UserVo;

@Controller
@RequestMapping(value="/manager")
public class ManagerUserController {

	@Autowired
	private ManagerUserService mUserService;
	
	@Autowired
	private ManageOperService mOperService;

	ManagerOpera mOpera = new ManagerOpera();
	
	
	
	@RequestMapping(value="user.action")
	public String goManagerUserList(){
		
		return "manager/managerUserList";
	}
	
	/**
	 * 搜索所有用户
	 * @param 页数
	 * @param 行数
	 * @return
	 */
	@RequestMapping(value="/selectUserlist.action")
	public @ResponseBody 
	Map<String, Object> selectUserlist(Integer page, Integer rows) {

		UserVo vo = new UserVo();
		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		System.out.println(page + "--" + rows);
		Map<String, Object> userListresult = new HashMap<String, Object>();

		// 查找商家总条数
		Integer total = mUserService.SelectUserTotal();
		List<User> userList = mUserService.selectUserList(vo);

		userListresult.put("total", total);
		userListresult.put("rows", userList);

		return userListresult;
	}
	
	
	//进入编辑页面
		@RequestMapping(value = "/userEdit.action")
		public @ResponseBody User userEdit(Integer id) {

			User user = mUserService.selectUserByid(id);

			return user;
		}
	
	
	//更新修改的用户信息
	@RequestMapping(value="/updateUser.action")
	public @ResponseBody 
	Map<String, Object> updateUser(User user) {

		Map<String, Object> result = new HashMap<String, Object>();

		try {
			mUserService.updateUser(user);
			result.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("success", e.getMessage());
		}
		
		// 将管理员更新操作存入表
		mOpera.setOperation("更新用户id为"+user.getId()+"的操作");
		mOperService.saveManageOper(mOpera);

		return result;
	}
	
	
	//冻结用户
	@RequestMapping(value="/freezeUser.action")
	public @ResponseBody 
	Map<String, Object> freezeUser(Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {

			mUserService.freezeUserById(id);
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
	
	
	//解除用户冻结状态
	@RequestMapping(value="/releaseUser.action")
	public @ResponseBody Map<String, Object> releaseUser(Integer id) {
		Map<String, Object> result = new HashMap<String, Object>();

		try {

			mUserService.releaseUserById(id);
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
	
	
	//删除用户信息
	@RequestMapping(value="/deleteUser.action")
	public @ResponseBody Map<String, Object> deleteStorers(String ids) {

		// 将接收到的id字符串转换位Integer类型
		String[] idStringList = ids.split(",");
		List<Integer> idList = new ArrayList<Integer>();
		for (int i = 0; i < idStringList.length; i++) {
			idList.add(Integer.parseInt(idStringList[i]));
		}

		UserVo vo = new UserVo();
		vo.setIds(idList);

		Map<String, Object> result = new HashMap<String, Object>();
		try {
			mUserService.deleteStorersByids(vo);
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
	
	
	//搜索用户
	@RequestMapping(value="/searchUserByContext.action")
	public @ResponseBody Map<String, Object> searchUserByContext(String username, Integer userstatus, Integer page,
			Integer rows) throws UnsupportedEncodingException {

		Map<String, Object> result = new HashMap<String, Object>();
		String userName = "";

		if (username != "".trim() && username != null) {
			//userName = new String(username.getBytes("ISO-8859-1"), "UTF-8");
			userName = username;
			System.out.println(userName);
		}

		UserVo vo = new UserVo();
		User user = new User();
	
		user.setUsername(userName);
		user.setUserstatus(userstatus);
		vo.setUser(user);

		vo.setRows(rows);
		vo.setPage((page - 1) * rows);

		// 查找商家总条数
		Integer total = mUserService.selectTotalByContext(vo);

		// 有条件的查找用户
		List<User> userList = mUserService.searchByContextPage(vo);

		result.put("total", total);
		result.put("rows", userList);

		return result;
	}


	//查看该用户下的收货地址
	@RequestMapping(value="/userAdderDetail.action")
	public String storerDetail(Integer id, Model model) {

		List<Address> addressList = mUserService.selectUserAddressDetailByUserId(id);
		for(Address adder : addressList){
			System.out.println(adder.getAddress());
		}
		
		
		model.addAttribute("addressList", addressList);
		return "manager/userAddressDetail";
	}
	
	
	//导出execl
		@RequestMapping(value="/userExport.action")
		public void export(String fields,String titles,String className ,HttpServletResponse response){
			
			System.out.println(fields+"-"+titles+"-"+className);
			//HttpServletResponse response = ServletActionContext.getResponse();
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition", "attachment;filename=export.xls");
			
			//创建Excel
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet("sheet0");
			
			try {
				
				UserVo vo = new UserVo();
				List<User> list = mUserService.selectUserList(vo);
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
}
