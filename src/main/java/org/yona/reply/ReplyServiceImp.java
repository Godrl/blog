package org.yona.reply;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.yona.archives.BoardDAO;
import org.yona.util.Criteria;


@Service
public class ReplyServiceImp implements ReplyService{

	@Inject
	private ReplyDAO replyDao;
	
	@Inject
	private BoardDAO boardDao;


	/*
	 * Java
	 */	
	@Override
	public List<ReplyVO> JavaRplall(int boardno)throws Exception{
		return replyDao.JavaRplall(boardno);
	}

	@Override
	public List<ReplyVO> JavaRpllist(int boardno, Criteria cri) throws Exception {
		return replyDao.JavaRpllist(boardno, cri);
	}
	
	@Override
	public int JavaRplcount(int boardno) throws Exception{
		return replyDao.JavaRplcount(boardno);
	}
	
	@Transactional
	@Override
	public void JavaRplrgst(ReplyVO rvo) throws Exception {
		replyDao.JavaRplrgst(rvo);
		boardDao.UdtjavaRpln(rvo.getBoardno(), 1);
	}

	@Override
	public void JavaRplmod(ReplyVO rvo) throws Exception {
		replyDao.JavaRplmod(rvo);
	}

	@Transactional
	@Override
	public void JavaRpldel(int replyno) throws Exception {
		replyDao.JavaRpldel(replyno);
		boardDao.UdtjavaRpln(replyDao.JspRplbno(replyno), -1);
	}

	@Override
	public int JavaRplbno(int replyno) throws Exception {
		return replyDao.JavaRplbno(replyno);
	}
	
	
	
	
	/*
	 * Jsp
	 */	
	@Override
	public List<ReplyVO> JspRplall(int boardno)throws Exception{
		return replyDao.JspRplall(boardno);
	}

	@Override
	public List<ReplyVO> JspRpllist(int boardno, Criteria cri) throws Exception {
		return replyDao.JspRpllist(boardno, cri);
	}
	
	@Override
	public int JspRplcount(int boardno) throws Exception{
		return replyDao.JspRplcount(boardno);
	}
	
	@Transactional
	@Override
	public void JspRplrgst(ReplyVO rvo) throws Exception {
		replyDao.JspRplrgst(rvo);
		boardDao.UdtjspRpln(rvo.getBoardno(), 1);
	}

	@Override
	public void JspRplmod(ReplyVO rvo) throws Exception {
		replyDao.JspRplmod(rvo);
	}

	@Transactional
	@Override
	public void JspRpldel(int replyno) throws Exception {
		
		int boardno = replyDao.JspRplbno(replyno);
		
		replyDao.JspRpldel(replyno);
		boardDao.UdtjspRpln(boardno, -1);
	}

	@Override
	public int JspRplbno(int replyno) throws Exception {
		return replyDao.JspRplbno(replyno);
	}
}
