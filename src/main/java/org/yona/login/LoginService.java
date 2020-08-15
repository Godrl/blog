package org.yona.login;

public interface LoginService {

	public void countFail(String username)throws Exception;
	
	public int checkFailCnt(String username)throws Exception;
	
	public void disabledUsername(String username)throws Exception;
	
	public void resetFailCnt(String username)throws Exception;
	
	public void insertUser(LoginVO Lvo) throws Exception;
}
