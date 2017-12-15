package com.chihuobao.exception;
/**
 * 自定义的异常类
 * @author 陈志杰
 *
 */
public class CustomException extends Exception{

	public String message;
	
	public CustomException(String message){
		super(message);
		this.message=message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
