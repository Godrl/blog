package org.yona.login;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yona.util.UserDetailsImp;

@Repository
public class LoginDAOImp implements LoginDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace = "login";
	
	public UserDetailsImp getUserByID(String username) {
		return session.selectOne(namespace+".selectUserByID",username);
	}
	
	public void updateFailCnt(String username) {
		session.update(namespace+".updateFailCnt",username);
	}
	
	public int checkFailCnt(String username) {
		return session.selectOne(namespace+".checkFailCnt",username);
	}
	
	public void resetFailCnt(String username) {
		session.update(namespace+".resetFailCnt",username);
	}
	
	public void udpateEnabled(String username) {
		session.selectOne(namespace+".updateEnabled",username);
	}

	@Override
	public void insertUser(LoginVO Lvo) throws Exception {
		session.insert(namespace+".signUp", Lvo);
	}
	
}
