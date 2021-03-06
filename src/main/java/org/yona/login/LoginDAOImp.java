package org.yona.login;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.yona.util.UserDetailsImp;

@Repository
public class LoginDAOImp implements LoginDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace = "login";
	
	@Override
	public UserDetailsImp getUserByID(String username)throws UsernameNotFoundException {
		return session.selectOne(namespace+".selectUserByID",username);
	}
	
	@Override
	public void updateFailCnt(String username) throws Exception{
		session.update(namespace+".updateFailCnt",username);
	}
	
	@Override
	public int checkFailCnt(String username) throws Exception{
		return session.selectOne(namespace+".checkFailCnt",username);
	}
	
	@Override
	public void resetFailCnt(String username) throws Exception{
		session.update(namespace+".resetFailCnt",username);
	}
	
	@Override
	public void udpateEnabled(String username) throws Exception{
		session.selectOne(namespace+".updateEnabled",username);
	}

	@Override
	public void insertUser(LoginVO Lvo) throws Exception {
		session.insert(namespace+".signUp", Lvo);
	}
	
}
