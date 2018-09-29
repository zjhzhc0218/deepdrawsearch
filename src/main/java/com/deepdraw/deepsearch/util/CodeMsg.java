package com.deepdraw.deepsearch.util;

public class CodeMsg {
	
	private int code;
	private String msg;
	
	//通用的错误码
	public static CodeMsg SUCCESS = new CodeMsg(0, "success");
	public static CodeMsg SERVER_ERROR = new CodeMsg(500100, "服务端异常");
	public static CodeMsg BIND_ERROR = new CodeMsg(500101, "参数校验异常：%s");
	//登录模块 5002XX
	public static CodeMsg SESSION_ERROR = new CodeMsg(500210, "Session不存在或者已经失效");
	public static CodeMsg SIGN_CODE_ERROR = new CodeMsg(500211, "邀请码输入错误，请重新通过微信二维码获取");
	public static CodeMsg USER_NULL_ERROR = new CodeMsg(500212, "查询失败，没有该用户");
	public static CodeMsg USER_ADD_ERROR = new CodeMsg(500213, "很遗憾注册失败，手机用户已经被注册了");
	public static CodeMsg USER_BAN_ERROR = new CodeMsg(500214, "抱歉，该用户已经被禁止登录了，请联系客服");
	public static CodeMsg USER_PASSWORD_ERROR = new CodeMsg(500215, "查询失败，密码错误");
	public static CodeMsg USER_CHANGE_NULL_ERROR = new CodeMsg(500216, "修改失败，请从新校验对应的账号是否已经注册");
	public static CodeMsg USER_CHANGE_DELETE_ERROR = new CodeMsg(500217, "您的密码修改失败，可能信息被删除了");
	public static CodeMsg USER_CHANGE_PASSWORD_ERROR = new CodeMsg(500218, "修改失败，请从新校验对应的原密码是否正确");
	public static CodeMsg USER_CHANGE_BAN_ERROR = new CodeMsg(500219, "用户登录状态修改失败");
	public static CodeMsg USER_RESET_PASSWORD_ERROR = new CodeMsg(500220, "用户重置密码失败");



	//商品模块 5003XX
	
	//订单模块 5004XX
	
	//秒杀模块 5005XX
	
	private CodeMsg( ) {
	}
			
	private CodeMsg( int code,String msg ) {
		this.code = code;
		this.msg = msg;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	public CodeMsg fillArgs(Object... args) {
		int code = this.code;
		String message = String.format(this.msg, args);
		return new CodeMsg(code, message);
	}

	@Override
	public String toString() {
		return "CodeMsg [code=" + code + ", msg=" + msg + "]";
	}
	
	
}
