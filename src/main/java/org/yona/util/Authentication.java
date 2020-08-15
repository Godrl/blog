package org.yona.util;

import java.util.Collection;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.yona.login.LoginServiceImp;

public class Authentication implements AuthenticationProvider{

	private static final Logger logger = LoggerFactory.getLogger(Authentication.class);
	
	@Inject
	private LoginServiceImp service;
	
	@Inject
	private BCryptPasswordEncoder pwEncoder;
	
	@SuppressWarnings("unchecked")
	@Override
	public org.springframework.security.core.Authentication authenticate(org.springframework.security.core.Authentication authentication) throws AuthenticationException {
		
		String userid = (String)authentication.getPrincipal();
		String userpw = (String)authentication.getCredentials();
		
		UserDetailsImp user = (UserDetailsImp)service.loadUserByUsername(userid);
		
//		스프링시큐리티 버전업데이트로 비밀번호앞에 식별자 {noop}이 추가되어 비밀번호를 비교할 때 noop을 빼고 비교한다.
		String encodepw = user.getPassword().substring(6);
		logger.info("userpw = "+userpw + " encodeuserpw = "+encodepw);
		
		if(!pwEncoder.matches(userpw, encodepw)) {
			logger.info("=====비밀번호가 불일치=====");
			throw new BadCredentialsException(userid);
		}
		
		Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>)user.getAuthorities();
		
		if(!user.isEnabled()) {
			logger.info("=====계정 활성화 여부=====");
			throw new BadCredentialsException(userid);
		}
		
		return new UsernamePasswordAuthenticationToken(user,user,authorities);
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}


}
