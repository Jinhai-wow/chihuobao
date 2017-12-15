package com.chihuobao.exception;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;


/**
 * 全局异常处理器
 * @author 陈志杰
 *
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		//handler就是处理器适配器要执行的Handler对象（只有method）
		
		//解析出异常类型
		//如果该异常类型是系统自定义异常，直接取出浴场信息，在错误页面展示
		CustomException customException=null;
		if(ex instanceof CustomException){
			customException=(CustomException) ex;
		}else{
			//否则，构造一个未知错误异常
			customException=new CustomException("未知错误");
		}
		//错误信息
		String message =customException.getMessage();
		
		ModelAndView modelAndView =new ModelAndView();
		modelAndView.addObject("exmessage",message);
		modelAndView.setViewName("user/error");
		return modelAndView;
	}

}
