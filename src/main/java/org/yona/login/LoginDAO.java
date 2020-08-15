package org.yona.login;

import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.yona.util.UserDetailsImp;

public interface LoginDAO {
	
	public UserDetailsImp getUserByID(String username)throws UsernameNotFoundException; 
	
	public void updateFailCnt(String username)throws Exception;
	
	public int checkFailCnt(String username)throws Exception; 
	
	public void resetFailCnt(String username)throws Exception;
	
	public void udpateEnabled(String username)throws Exception;
	
	public void insertUser(LoginVO Lvo) throws Exception;
	
}
