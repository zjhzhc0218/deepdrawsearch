package com.deepdraw.deepsearch.exception;


import com.deepdraw.deepsearch.util.CodeMsg;

/**
 * 全局业务异常
 * @author  zyw
 */
public class GlobalException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	private CodeMsg cm;
	
	public GlobalException(CodeMsg cm) {
		super(cm.toString());
		this.cm = cm;
	}

	public CodeMsg getCm() {
		return cm;
	}

}
