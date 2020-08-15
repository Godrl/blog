package org.yona.login;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.yona.util.UserDetailsImp;
 
public class LoginServiceImp implements UserDetailsService,LoginService{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImp.class);
	
	@Inject
	private LoginDAO dao;
	
	@Inject
	private PasswordEncoder pwEncoder;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserDetailsImp user = dao.getUserByID(username);
		if(user==null) {
			logger.info("=====로그인 정보가 없음=====");
			throw new UsernameNotFoundException(username); 
		}
		return user;
	}

	@Override
	public void countFail(String username) throws Exception {
		dao.updateFailCnt(username);
	}

	@Override
	public int checkFailCnt(String username) throws Exception{
		return dao.checkFailCnt(username);
	}

	@Override
	public void resetFailCnt(String username) throws Exception{
		dao.resetFailCnt(username);
	}
	
	@Override
	public void disabledUsername(String username) throws Exception{
		dao.udpateEnabled(username);
	}

	@Override
	public void insertUser(LoginVO Lvo) throws Exception {
		logger.info("=====사용자 등록=====");
		String encodePw = pwEncoder.encode(Lvo.getPassword());
		Lvo.setPassword(encodePw);
		
		dao.insertUser(Lvo);
		logger.info("password = "+encodePw);
		
	}

}
