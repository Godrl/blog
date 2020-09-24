package org.yona.archives;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yona.util.SearchCriteria;

@Service
public class BoardServiceImp implements BoardService{

	@Inject
	private BoardDAO dao;

	/*
	 * Java
	*/
	
	@Transactional
	@Override
	public void rgstJava(BoardVO bvo) throws Exception {
		dao.rgstJava(bvo);
		
		String[] files = bvo.getFiles();
		if(files == null) return;
		
		for(String filename : files) dao.addAttach(filename, bvo.getboardCat());
	}

	@Override
	public List<BoardVO> javalist() throws Exception {
		return dao.javalist();
	}

	@Transactional
	@Override
	public BoardVO readJava(int boardno) throws Exception {
		dao.UdtjavaView(boardno);
		return dao.readJava(boardno);
	}

	@Override
	public void modJava(BoardVO bvo) throws Exception {
		dao.modJava(bvo);
	}

	@Override
	public void delJava(int boardno) throws Exception {
		dao.delJava(boardno);
	}

	@Override
	public List<BoardVO> javaPinfo(SearchCriteria search) throws Exception {
		return dao.javaPinfo(search);
	}

	@Override
	public int javaPcount(SearchCriteria search) throws Exception {
		return dao.javaPcount(search);
	}

	@Override
	public void UdtjavaRpln(Integer boardno, int amount) throws Exception {
		dao.UdtjavaRpln(boardno, amount);
	}

	@Override
	public void UdtjavaView(Integer boardno) throws Exception {
		dao.UdtjavaView(boardno);
	}

	
	/*
	 * Jsp
	*/
	
	@Transactional
	@Override
	public void rgstJsp(BoardVO bvo) throws Exception {
		dao.rgstJsp(bvo);
		
		String[] files = bvo.getFiles();
		if(files == null) return;
		
		for(String filename : files) dao.addAttach(filename, bvo.getboardCat());
	}

	@Override
	public List<BoardVO> jsplist() throws Exception {
		return dao.jsplist();
	}

	@Transactional
	@Override
	public BoardVO readJsp(int boardno) throws Exception {
		dao.UdtjspView(boardno);
		return dao.readJsp(boardno);
	}

	@Override
	public void modJsp(BoardVO bvo) throws Exception {
		dao.modJsp(bvo);
	}

	@Override
	public void delJsp(int boardno) throws Exception {
		dao.delJsp(boardno);
	}

	@Override
	public List<BoardVO> jspPinfo(SearchCriteria search) throws Exception {
		return dao.jspPinfo(search);
	}

	@Override
	public int jspPcount(SearchCriteria search) throws Exception {
		return dao.jspPcount(search);
	}

	@Override
	public void UdtjspRpln(Integer boardno, int amount) throws Exception {
		dao.UdtjspRpln(boardno, amount);
	}

	@Override
	public void UdtjspView(Integer boardno) throws Exception {
		dao.UdtjspView(boardno);
	}

	
}
