package org.yona.reply;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.yona.util.Criteria;
import org.yona.util.PageUtil;

@RestController
@RequestMapping("/replies")
public class ReplyController {
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService rservice;
	
	// 댓글 등록
	@RequestMapping(value = "", method = RequestMethod.POST)
	public ResponseEntity<String> register(@RequestBody ReplyVO rvo){
		logger.info("=====Reply register POST=====");
		
		ResponseEntity<String> entity = null;
		
		if(rvo.getBoardCat().equals("a_java")) {
			try {
				rservice.JavaRplrgst(rvo);
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
				
			} catch (Exception e) {
				logger.error("javaReply register error = "+e);
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		else if(rvo.getBoardCat().equals("a_jsp")){
			try {
				rservice.JspRplrgst(rvo);
				entity = new ResponseEntity<String>("success",HttpStatus.OK);
				
			} catch (Exception e) {
				logger.error("jspReply register error = "+e);
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	
	//댓글 수정
	@RequestMapping(value = "/{replyno}", method = {RequestMethod.PUT,RequestMethod.PATCH})
	public ResponseEntity<String> modify(@PathVariable("replyno") int replyno, @RequestBody ReplyVO rvo){
		logger.info("=====modify PUT,PATCH=====");
		
		ResponseEntity<String> entity = null;
		
		if(rvo.getBoardCat().equals("a_java")) {
			try {
				rvo.setReplyno(replyno);
				rservice.JavaRplmod(rvo);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} catch (Exception e) {
				logger.error("javaReply modify error = "+e);
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
			
		}
		else if(rvo.getBoardCat().equals("a_jsp")){
			try {
				rvo.setReplyno(replyno);
				rservice.JspRplmod(rvo);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} catch (Exception e) {
				logger.error("jspReply modify error = "+e);
				entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	
	//댓글 삭제
	@RequestMapping(value = "/{replyno}/{boardCat}", method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(@PathVariable("replyno") int replyno,ReplyVO rvo){
		logger.info("=====delete DELETE=====");
		
		ResponseEntity<String> entity = null;
		
		if(rvo.getBoardCat().equals("a_java")) {
			try {
				rservice.JavaRpldel(replyno);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} catch (Exception e) {
				logger.error("javaReply delete error = "+e);
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		}
		else if(rvo.getBoardCat().equals("a_jsp")) {
			try {
				rservice.JspRpldel(replyno);
				entity = new ResponseEntity<String>("success", HttpStatus.OK);
			} catch (Exception e) {
				logger.error("jspReply delete error = "+e);
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	
	//전체댓글 조회
	@RequestMapping(value = "/all/{boardno}", method = RequestMethod.GET)
	public ResponseEntity<List<ReplyVO>> allList(@PathVariable("boardno") int boardno,ReplyVO rvo){
		logger.info("=====allList GET=====");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		
		if(rvo.getBoardCat().equals("a_java")) {
			try {
				entity = new ResponseEntity<>(rservice.JavaRplall(boardno),HttpStatus.OK);
			} catch (Exception e) {
				logger.error("javaReply allCheck error = "+e);
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		else if(rvo.getBoardCat().equals("a_jsp")) {
			try {
				entity = new ResponseEntity<>(rservice.JspRplall(boardno),HttpStatus.OK);
			} catch (Exception e) {
				logger.error("jspReply allCheck error = "+e);
				entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
	
	
	//페이지 당 댓글조회
	@RequestMapping(value = "/{boardno}/{page}/{boardCat}", method = RequestMethod.GET)
	public ResponseEntity<Map<String,Object>> replylist(@PathVariable("boardno") int boardno, @PathVariable("page") int page,ReplyVO rvo){
		logger.info("=====replyList GET=====");
		
		ResponseEntity<Map<String,Object>> entity = null;
		
		if(rvo.getBoardCat().equals("a_java")) {
			try {
				Criteria cri = new Criteria();
				cri.setPage(page);
				
				PageUtil pageutil = new PageUtil();
				pageutil.setCri(cri);
				
				Map<String,Object> map = new HashMap<String,Object>();
				List<ReplyVO> list = rservice.JavaRpllist(boardno, cri);
				map.put("list", list);
				
				int replyCount = rservice.JavaRplcount(boardno);
				pageutil.setRpltotal(replyCount);

				map.put("pageutil", pageutil);
				
				entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				logger.error("javaReply check error = "+e);
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
		}
		else if(rvo.getBoardCat().equals("a_jsp")) {
			try {
				Criteria cri = new Criteria();
				cri.setPage(page);
				
				PageUtil pageutil = new PageUtil();
				pageutil.setCri(cri);
				
				Map<String,Object> map = new HashMap<String,Object>();
				List<ReplyVO> list = rservice.JspRpllist(boardno, cri);
				
				map.put("list", list);
				
				int replyCount = rservice.JspRplcount(boardno);
				pageutil.setRpltotal(replyCount);
				
				map.put("pageutil", pageutil);
				
				entity = new ResponseEntity<Map<String,Object>>(map, HttpStatus.OK);
			} catch (Exception e) {
				logger.error("jspReply check error = "+e);
				entity = new ResponseEntity<Map<String,Object>>(HttpStatus.BAD_REQUEST);
			}
		}
		
		return entity;
	}
}
