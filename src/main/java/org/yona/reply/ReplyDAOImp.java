package org.yona.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yona.util.Criteria;

@Repository
public class ReplyDAOImp implements ReplyDAO{

	@Inject
	private SqlSession session;
	
	private static String namespace = "reply";

	
	/*
	 * Java
	*/
	@Override
	public List<ReplyVO> JavaRplall(int boardno)throws Exception{
		return session.selectList(namespace+".JavaRplall",boardno);
	}

	@Override
	public List<ReplyVO> JavaRpllist(int boardno,Criteria cri) throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("boardno", boardno);
		map.put("cri", cri);
		
		return session.selectList(namespace+".JavaRpllist", map);
	}
	
	@Override
	public int JavaRplcount(int boardno) throws Exception {	
		return session.selectOne(namespace+".JavaRplcount", boardno);
	} 

	@Override
	public void JavaRplrgst(ReplyVO rvo) throws Exception {
		session.insert(namespace+".JavaRplrgst",rvo);
	}

	@Override
	public void JavaRplmod(ReplyVO rvo) throws Exception {
		session.update(namespace+".JavaRplmod",rvo);
	}

	@Override
	public void JavaRpldel(int replyno) throws Exception {
		session.delete(namespace+".JavaRpldel",replyno);
	}

	@Override
	public int JavaRplbno(Integer replyno) throws Exception {
		return session.selectOne(namespace+".JavaRplbno", replyno);
	}
	
	
	
	
	/*
	 * Jsp
	*/
	@Override
	public List<ReplyVO> JspRplall(int boardno)throws Exception{
		return session.selectList(namespace+".JspRplall",boardno);
	}

	@Override
	public List<ReplyVO> JspRpllist(int boardno,Criteria cri) throws Exception {
		
		Map<String,Object> map = new HashMap<>();
		
		map.put("boardno", boardno);
		map.put("cri", cri);
		
		return session.selectList(namespace+".JspRpllist", map);
	}
	
	@Override
	public int JspRplcount(int boardno) throws Exception {	
		return session.selectOne(namespace+".JspRplcount", boardno);
	} 

	@Override
	public void JspRplrgst(ReplyVO rvo) throws Exception {
		session.insert(namespace+".JspRplrgst",rvo);
	}

	@Override
	public void JspRplmod(ReplyVO rvo) throws Exception {
		session.update(namespace+".JspRplmod",rvo);
	}

	@Override
	public void JspRpldel(int replyno) throws Exception {
		session.delete(namespace+".JspRpldel",replyno);
	}

	@Override
	public int JspRplbno(Integer replyno) throws Exception {
		return session.selectOne(namespace+".JspRplbno", replyno);
	}
	
}
