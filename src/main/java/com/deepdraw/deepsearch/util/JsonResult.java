package com.deepdraw.deepsearch.util;

import java.io.Serializable;
import java.util.List;
import java.util.Map;



/**
 * @ClassName: JsonResult
 * @Description: 用户后台向前台返回的Json对象
 * @author: zyw
 * @date: 2018年9月19日 下午3:22:11
 * @version: v1.0
 */
public class JsonResult implements Serializable
{

	private static final long serialVersionUID = 1L;

	private String message; // 接口调用结果描述信息

	private Integer statusCode; // 接口调用结果描述编码;默认0表示成功

	private Map<String,Object> data; // 接口返回的数据

	private List list; // 接口返回的数据

	private Object object; // 接口返回的数据


	public JsonResult(Describable describable)
	{
		this.message = describable.getMsg();
		this.statusCode = describable.getCode();
	}

	public JsonResult(Describable describable,Map<String,Object> data)
	{
		this.message = describable.getMsg();
		this.statusCode = describable.getCode();
		this.data = data;
	}

	public JsonResult(Describable describable,List list)
	{
		this.message = describable.getMsg();
		this.statusCode = describable.getCode();
		this.list = list;
	}

	public JsonResult(Describable describable,Object object)
	{
		this.message = describable.getMsg();
		this.statusCode = describable.getCode();
		this.object = object;
	}

	public JsonResult(Integer statusCode,String message)
	{
		this.message = message;
		this.statusCode = statusCode;
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(Integer statusCode) {
		this.statusCode = statusCode;
	}


	public Map<String,Object> getData() {
		return data;
	}

	public void setData(Map<String,Object> data) {
		this.data = data;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}
	
	public String toString(){
		
		return "{statusCode:"+statusCode+",message:'"+message+"'}";
		
	}

}
