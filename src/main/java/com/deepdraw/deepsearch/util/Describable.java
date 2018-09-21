package com.deepdraw.deepsearch.util;

/**
 * <p>名称：Describable.java</p>
 * <p>描述：可以被描述的抽象接口</p>
 * <pre>
 *    
 * </pre>
 * @author zyw
 * @date 2018年9月19日 下午3:22:11
 * @version 1.0.0
 */
public interface Describable
{ 
	/**
	 * 描述：  
	 * <pre>描述编码</pre>
	 * @return
	 */
	Integer getCode();
	
	/**
	 * 描述：
	 * <pre>描述信息</pre>
	 * @return
	 */
	String getMsg();
}
