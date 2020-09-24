package org.yona.archives;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.yona.util.SearchCriteria;

@Repository
public class BoardDAOImp implements BoardDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace = "board";
	
	/*
	 * Java
	*/
	@Override
	public void rgstJava(BoardVO bvo) throws Exception {
		session.insert(namespace+".rgstJava",bvo);
	}

	@Override
	public List<BoardVO> javalist() throws Exception {
		return session.selectList(namespace+".javalist");
	}
	
	@Override
	public BoardVO readJava(int boardno) throws Exception {
		return session.selectOne(namespace+".readJava",boardno);
	}

	@Override
	public void modJava(BoardVO bvo) throws Exception {
		session.update(namespace+".modJava",bvo);
	}

	@Override
	public void delJava(int boardno) throws Exception {
		session.delete(namespace+".delJava",boardno);
	}

	@Override
	public List<BoardVO> javaPinfo(SearchCriteria search) throws Exception {
		return session.selectList(namespace+".javaPinfo", search);
	}

	@Override
	public int javaPcount(SearchCriteria search) throws Exception {
		return session.selectOne(namespace+".javaPcount", search);
	}
	
	@Override
	public void UdtjavaRpln(Integer boardno, int amount) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardno", boardno);
		map.put("amount", amount);
		
		session.update(namespace+".UdtjavaRpln", map);
	}

	@Override
	public void UdtjavaView(Integer boardno) throws Exception {
		session.update(namespace+".UdtjavaView", boardno);
	}
	
	
	/*
	 * Jsp
	*/
	@Override
	public void rgstJsp(BoardVO bvo) throws Exception {
		session.insert(namespace+".rgstJsp",bvo);
	}

	@Override
	public List<BoardVO> jsplist() throws Exception {
		return session.selectList(namespace+".jsplist");
	}
	
	@Override
	public BoardVO readJsp(int boardno) throws Exception {
		return session.selectOne(namespace+".readJsp",boardno);
	}

	@Override
	public void modJsp(BoardVO bvo) throws Exception {
		session.update(namespace+".modJsp",bvo);
	}

	@Override
	public void delJsp(int boardno) throws Exception {
		session.delete(namespace+".delJsp",boardno);
	}

	@Override
	public List<BoardVO> jspPinfo(SearchCriteria search) throws Exception {
		return session.selectList(namespace+".jspPinfo", search);
	}

	@Override
	public int jspPcount(SearchCriteria search) throws Exception {
		return session.selectOne(namespace+".jspPcount", search);
	}
	
	@Override
	public void UdtjspRpln(Integer boardno, int amount) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("boardno", boardno);
		map.put("amount", amount);
		
		session.update(namespace+".UdtjspRpln", map);
	}

	@Override
	public void UdtjspView(Integer boardno) throws Exception {
		session.update(namespace+".UdtjspView", boardno);
	}

	
	/*
	 * File Upload
	*/
	@Override
	public void addAttach(String filename, String boardCat) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("filename", filename);
		map.put("boardCat", boardCat);
		
		session.insert(namespace+".addAttach",map);
	}
	
	
	
	
}
