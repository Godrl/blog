package org.yona.reply;

import java.util.List;

import org.yona.util.Criteria;

public interface ReplyDAO {
	
	
	/*
	 * Java
	*/
	public List<ReplyVO> JavaRplall(int boardno)throws Exception;
	
	public void JavaRplrgst(ReplyVO rvo)throws Exception;
	
	public void JavaRplmod(ReplyVO rvo)throws Exception;
	
	public void JavaRpldel(int replyno)throws Exception;
	
	public List<ReplyVO> JavaRpllist(int boardno, Criteria cri)throws Exception;
	
	public int JavaRplcount(int boardno)throws Exception;
	
	public int JavaRplbno(Integer replyno)throws Exception;
	
	

	/*
	 * Jsp
	*/
    public List<ReplyVO> JspRplall(int boardno)throws Exception;
	
	public void JspRplrgst(ReplyVO rvo)throws Exception;
	
	public void JspRplmod(ReplyVO rvo)throws Exception;
	
	public void JspRpldel(int replyno)throws Exception;
	
	public List<ReplyVO> JspRpllist(int boardno, Criteria cri)throws Exception;
	
	public int JspRplcount(int boardno)throws Exception;
	
	public int JspRplbno(Integer replyno)throws Exception;
}
