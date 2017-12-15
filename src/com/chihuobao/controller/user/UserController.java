package com.chihuobao.controller.user;


import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;

import com.chihuobao.util.ImageCut;
import com.chihuobao.util.ImageCutPropertyBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chihuobao.exception.CustomException;
import com.chihuobao.po.Address;
import com.chihuobao.po.User;
import com.chihuobao.service.user.UserService;
import com.chihuobao.vo.UserVo;


/**
 * 用户handler
 * @author 陈志杰
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//密码登陆
	@RequestMapping("/loginByPassword")
	public String loginByPassword(UserVo userVo,HttpSession session) throws Exception{
		//调用service根据商品id查询商品信息
		UserVo user=userService.findUserByPassword(userVo);
		//返回modelAndView
//		ModelAndView modelAndView=new ModelAndView();
		//相当于request的setAttribut,在jsp页面中通过itemsList取数据
//		modelAndView.addObject("user", user);
		//指定视图
//		modelAndView.setViewName("public/index");
		session.setAttribute("user", user);
		return "user/index"; 
	}
	
	
	//进入登录注册页面
	@RequestMapping("/loginPage")
	public ModelAndView loginPage() throws Exception{
	
		ModelAndView modelAndView=new ModelAndView();

		modelAndView.setViewName("user/user_login_register");
		
		return modelAndView; 
	}
	
	//进入主页
	@RequestMapping("/index")
	public ModelAndView index() throws Exception{
		
		ModelAndView modelAndView=new ModelAndView();

		modelAndView.setViewName("user/index");
			
		return modelAndView; 
	}
	
	//进入个人中心
	@RequestMapping("/personalCenter")
	public ModelAndView personalCenter() throws Exception{
	
		ModelAndView modelAndView=new ModelAndView();

		modelAndView.setViewName("user/personal_center");
		
		return modelAndView; 
	}
	
	//退出登录
	@RequestMapping("/logout")
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "user/index";
	}
	
	//用户登录或注册
	@RequestMapping("/loginRegisterByMessage")
	public String loginRegisterByMessage(UserVo userVo,HttpSession session) throws Exception{
		UserVo user=userService.loginRegisterByMessage(userVo);
		session.setAttribute("user", user);
		return "user/index";
	}
	
	//用户获取手机验证码
	@RequestMapping("/createCaptcha")
	public void createCaptcha(String phone) throws Exception{
		userService.createCaptcha(phone);
		System.out.println();
	}
	
	//个人中心-个人资料，根据id查询用户信息
	@RequestMapping("/personalData")
	public @ResponseBody UserVo personalData(Integer id) throws Exception{
		UserVo user=userService.findUserById(id);
		return user;
	}
	
	//修改用户名
	@RequestMapping("/updateUsername")
	public @ResponseBody String updateUsername(@RequestBody User user,HttpSession session) throws Exception{
		String username=userService.updateUsername(user);
		UserVo userVo=(UserVo)session.getAttribute("user");
		userVo.getUser().setUsername(username);
		session.setAttribute("user", userVo);
		return username;
	}
	
	//进入上传图片的页面
	@RequestMapping("/intoUploadPage")
	public String intoUploadPage() throws Exception{
		
		return "user/imgUpload";
	}
	
	//上传图片
	@RequestMapping("/imgUpload")
	public @ResponseBody String imgUpload(MultipartFile userImg,Model model,HttpSession session) throws Exception{
		//上传图片
		String newImgName=null;
		if(userImg!=null){
			UserVo userVo=(UserVo) session.getAttribute("user");
			String userimgpath=userVo.getUser().getPhoto();   //获得当前用户的图片名
			//图片的物理路径
			//String imgPath="E:\\Myeclipsewp\\CHB\\WebRoot\\upload\\";
			String imgPath=session.getServletContext().getRealPath("/")+"upload\\";
			//拿到图片原始名称
			String imgOriginalName=userImg.getOriginalFilename();
			//新的图片名称
			if(userimgpath!=null){    
				new File(imgPath+userimgpath).delete();
			}
			newImgName=UUID.randomUUID()+imgOriginalName.substring(imgOriginalName.lastIndexOf("."));
			File newFile=new File(imgPath+newImgName);
			//将内存中的数据写入磁盘
			userImg.transferTo(newFile);
			
			BufferedImage src = ImageIO.read(new File(imgPath+newImgName)); // 读入图片文件
			int imgSrcWidth=src.getWidth();    //得到源图片的宽度
			int imgSrcHeight=src.getHeight();  //得到源图片的高度
			//重新指定图片大小
			int imgWidth=340;
			int imgHeight=340;
			/*if(imgSrcWidth>=imgSrcHeight){
				imgWidth=imgSrcWidth > 400 ? 400 : imgSrcWidth;
				imgHeight=(int) (imgWidth*(float)imgSrcHeight/(float)imgSrcWidth);
			}else{
				imgHeight=imgSrcHeight > 400 ? 400 : imgSrcHeight;
				imgWidth=(int) (imgHeight*(float)imgSrcWidth/(float)imgSrcHeight);
			}*/
			//按照新的图片大小重新生成图片
			ImageCut.scale((imgPath+newImgName), (imgPath+newImgName), imgWidth,
					imgHeight);
			File f = new File(imgPath+newImgName);
			if (f.exists()) {
				System.out.println("创建" + imgWidth + "*" + imgHeight
						+ "图片成功");
			}
		}
		return newImgName ;
	}
	
	//图片裁剪
	@RequestMapping("/imgCut")
	public String imgCut(ImageCutPropertyBean icpb,HttpSession session) throws Exception{
		//图片的物理路径
		String imgPath=session.getServletContext().getRealPath("/")+"upload\\";
		String webAppPath=imgPath+icpb.getOldImgPath();
		ImageCut.abscut(webAppPath, webAppPath,icpb);
		//保存图片的名字，存入数据库
		UserVo userVo=(UserVo) session.getAttribute("user");
		User user=new User();
		user.setId(userVo.getUser().getId());
		user.setPhoto(icpb.getOldImgPath());
		if(icpb.getOldImgPath()==null){
			throw new  CustomException("图片名为空！");
		}
		userService.headPortrait(user);             //把图片名存入数据库
		userVo.getUser().setPhoto(icpb.getOldImgPath());
		session.setAttribute("user", userVo);
		return "user/personal_center";
	}
	
	//修改密码
	@RequestMapping("/modifyPassword")
	public @ResponseBody String modifyPassword(@RequestBody User user) throws Exception{
		userService.modifyPassword(user);
		return "success";
	}
	
	//查找出用户添加的所有地址
	@RequestMapping("/findUserAddress")
	public @ResponseBody List<Address> findUserAddress(Integer id) throws Exception{
		List<Address> addressList=userService.findUserAddress(id);
		return addressList;
	}
	
}
