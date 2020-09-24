package org.yona.archives;

import java.util.List;

import org.yona.util.SearchCriteria;

public interface BoardDAO {

	/*
	 * Java
	*/
	public void rgstJava(BoardVO bvo)throws Exception;
	
	public List<BoardVO> javalist()throws Exception;
	
	public BoardVO readJava(int boardno)throws Exception;
	 
	public void modJava(BoardVO bvo)throws Exception;
	 
	public void delJava(int boardno)throws Exception;
	 
	public List<BoardVO> javaPinfo(SearchCriteria search)throws Exception;
	
	public int javaPcount(SearchCriteria search)throws Exception;
	
	public void UdtjavaRpln(Integer boardno, int amount)throws Exception;
	 
	public void UdtjavaView(Integer boardno)throws Exception;
	
	
	/*
	 * Jsp	
	*/	
	public void rgstJsp(BoardVO bvo)throws Exception;
	
	public List<BoardVO> jsplist()throws Exception;
	
	public BoardVO readJsp(int boardno)throws Exception;
	 
	public void modJsp(BoardVO bvo)throws Exception;
	 
	public void delJsp(int boardno)throws Exception;
	 
	public List<BoardVO> jspPinfo(SearchCriteria search)throws Exception;
	
	public int jspPcount(SearchCriteria search)throws Exception;
	
	public void UdtjspRpln(Integer boardno, int amount)throws Exception;
	 
	public void UdtjspView(Integer boardno)throws Exception;
	
	
	/*
	 * File Upload
	*/	 
	public void addAttach(String filename, String boardCat);
}
