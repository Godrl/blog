package org.yona.util;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.yona.login.LoginServiceImp;

public class AuthenticationSuccess implements AuthenticationSuccessHandler{

	private static final Logger logger = LoggerFactory.getLogger(AuthenticationSuccess.class);
	
	private RequestCache requestCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	private String userid;
	private String defaultUrl;
	
	@Inject
	private LoginServiceImp service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,Authentication authentication) throws IOException, ServletException {
		
		String username = request.getParameter(userid);
		
		try {
			service.resetFailCnt(username);
		} catch (Exception e) {
			logger.info("=====FailCount Reset Error=====");
		}
		
		clearAuthenticationAttributes(request);
		redirectUrl(request,response,authentication);
	}
	
	protected void redirectUrl(HttpServletRequest request, HttpServletResponse response,Authentication authentication) throws IOException, ServletException{
		
		SavedRequest saveReq = requestCache.getRequest(request, response);
		
		if(saveReq != null) {	
			logger.info("=====인증권한에 필요한 페이지에 접속했을 때====="); 
			String targetUrl = saveReq.getRedirectUrl();
			redirectStrategy.sendRedirect(request, response, targetUrl);
		} else {
			logger.info("=====직접 로그인페이지에 접속했을 때=====");	
			redirectStrategy.sendRedirect(request, response, defaultUrl);
		}
	}
	
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session==null) return;
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getDefaultUrl() {
		return defaultUrl;
	}

	public void setDefaultUrl(String defaulUrl) {
		this.defaultUrl = defaulUrl;
	}
	
}
