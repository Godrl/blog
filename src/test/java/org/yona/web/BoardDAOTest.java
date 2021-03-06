package org.yona.web;

import java.util.List;

import javax.inject.Inject;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;
import org.yona.archives.BoardDAO;
import org.yona.archives.BoardVO;
import org.yona.util.PageUtil;
import org.yona.util.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class BoardDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);  
	
	@Inject
	private BoardDAO dao;
	
	@Ignore
	@Test
	public void testCreateboard()throws Exception{
		
		BoardVO bvo= new BoardVO();
		bvo.setTitle("testTitle00");
	    bvo.setContent("testcontent00");
	    bvo.setWriter("yona");
	    bvo.setboardCat("a_java");
		
		dao.rgstJava(bvo);
	}
	
	
	@Ignore
	@Test
	public void testReadboard()throws Exception{
		dao.readJava(844);
	}
	
	
	@Ignore
	@Test
	public void testUpdateboard()throws Exception{
		BoardVO bvo = new BoardVO();
		
		bvo.setBoardno(2);
		bvo.setTitle("수정된 제목");
		bvo.setContent("수정된 내용");
		
		dao.modJava(bvo);
	}
	
	
	@Ignore
	@Test
	public void testDeleteboard()throws Exception{
		dao.delJava(844);
	}
	
	@Ignore
	@Test
	public void testListcri()throws Exception{
		PageUtil pInfo = new PageUtil();
		
		List<BoardVO> list = dao.javalist();
		
		for(BoardVO bvo : list) {
			logger.info(bvo.getBoardno() + ":" + bvo.getTitle());
		}
	}
	
	@Ignore
	@Test
	public void testURI()throws Exception{
		
		UriComponents uriCompo = UriComponentsBuilder.newInstance()
								.path("/archives/java")
								.queryParam("boardno",12)
								.queryParam("perPageNum", 10)
								.build();
		
		logger.info(uriCompo.toString());
	}
	
	@Ignore
	@Test
	public void testURI01()throws Exception{
		
		UriComponents uriCompo = UriComponentsBuilder.newInstance()
								.path("/{module}/{page}")
								.queryParam("boardno", 12)
								.queryParam("perPageNum", 10)
								.build()
								.expand("archives","java")
								.encode();
		
		logger.info(uriCompo.toString());
	}
	
	@Test
	public void testCount()throws Exception{
		
		SearchCriteria search = new SearchCriteria();
		
		search.setPage(1);
		search.setKeyword("컴파일");
		search.setSearchType("t");
		
		logger.info("===========================");
		
		List<BoardVO> list = dao.javaPinfo(search);
		
		for(BoardVO bvo :list) {
			logger.info(bvo.getBoardno() +": "+bvo.getTitle());
		}
		
		logger.info("===========================");
		
		logger.info("count: "+dao.javaPcount(search));
	}
	
}
