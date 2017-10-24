package com.bootdo.common.exception;

import com.bootdo.common.utils.R;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * 异常处理器
 * 
 */
@ControllerAdvice
public class BDExceptionHandler {
	private Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * 自定义异常
	 */
	@ExceptionHandler(BDException.class)
	public R handleBDException(BDException e) {
		R r = new R();
		r.put("code", e.getCode());
		r.put("msg", e.getMessage());

		return r;
	}

	@ExceptionHandler(DuplicateKeyException.class)
	public R handleDuplicateKeyException(DuplicateKeyException e) {
		logger.error(e.getMessage(), e);
		return R.error("数据库中已存在该记录");
	}

	@ExceptionHandler(org.springframework.web.servlet.NoHandlerFoundException.class)
	public R noHandlerFoundException(org.springframework.web.servlet.NoHandlerFoundException e) {
		logger.error(e.getMessage(), e);
		return R.error("没找找到页面");
	}

	@ExceptionHandler(AuthorizationException.class)
	public String handleAuthorizationException(AuthorizationException e) {
		logger.error(e.getMessage(), e);
		return "error/403";
	}

	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		logger.error(e.getMessage(), e);
		return "error/500";
	}
}
