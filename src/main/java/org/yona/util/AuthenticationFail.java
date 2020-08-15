package org.yona.util;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.yona.login.LoginService;

public class AuthenticationFail implements AuthenticationFailureHandler{

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationFail.class);
	
	private String userid;//	HttpServletRequest 에서 로그인 아이디가 저장되어 있는 파라미터 이름. 아이디값이 들어오는 input 태그 name
	private String userpw;//	HttpServletRequest 에서 로그인 비밀번호가 저장되어 있는 파라미터 이름. 비밀번호값이 들어오는 input 태그 name
	private String errmsg;//	로그인 페이지에서 jstl을 이용하여 에러메시지를 가져올 때 사용할 변수 이름
	private String defaultUrl;//  실패시 보여줄 화면 url 
	
	@Inject
	private LoginService service;

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		
		logger.info("=====로그인 실패=====");
		
		String username = request.getParameter(userid);
		String password = request.getParameter(userpw);
		String errormsg = null;
		
		if(exception instanceof BadCredentialsException) {
			logger.info("=====로그인 정보 불일치=====");
			try {
				AuthenticationFailCnt(username);
			} catch (Exception e) {
				e.printStackTrace();
			}
			errormsg = MessageUtils.getMessage("error.BadCredentials");
		}else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = MessageUtils.getMessage("error.AuthFail");
		}else if(exception instanceof DisabledException) {
			errormsg = MessageUtils.getMessage("error.Disable"); 
		}else if(exception instanceof CredentialsExpiredException) {
			errormsg = MessageUtils.getMessage("error.CredentialsExpired");
		}
		
		request.setAttribute(userid, username);
		request.setAttribute(userpw, password);
		request.setAttribute(errmsg, errormsg);
	
		request.getRequestDispatcher(defaultUrl).forward(request, response);
	}
	
	protected void AuthenticationFailCnt(String username) throws Exception {
		service.countFail(username);
		int count = service.checkFailCnt(username);
		if(count == 3) {
			service.disabledUsername(username);
		}
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpw() {
		return userpw;
	}

	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	
	public String getErrmsg() {
		return errmsg;
	}

	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}

	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaultUrl) {
		this.defaultUrl = defaultUrl;
	}

	

	
}