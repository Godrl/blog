package org.yona.archives;

import javax.inject.Inject;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yona.util.PageUtil;
import org.yona.util.SearchCriteria;

@Controller
@RequestMapping("/archives/*")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	private BoardService service;
	
	//게시글 등록 화면
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(BoardVO bvo, Model model)throws Exception{
		logger.info("====================register GET====================");
	}
	
	//게시글 등록 처리
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(BoardVO bvo, RedirectAttributes rttr)throws Exception{
		logger.info("====================register POST====================");
		
		if(bvo.getboardCat().equals("a_java")) {
			service.rgstJava(bvo);
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			service.rgstJsp(bvo);
		}
		
		rttr.addFlashAttribute("msg", "register");
		
		String board = "";
		if(bvo.getboardCat().equals("a_java")) {
			board = "redirect:/archives/java";
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			board = "redirect:/archives/jsp";
		}
		
		return board;
		
	}
	
	//게시글 상세보기
	@RequestMapping(value = "/readboard", method = RequestMethod.GET)
	public void readboard(@RequestParam("boardno") int boardno, @ModelAttribute("search") SearchCriteria search,Model model,BoardVO bvo)throws Exception{
		logger.info("====================readboard====================");
		
		if(bvo.getboardCat().equals("a_java")) {
			model.addAttribute(service.readJava(boardno));
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			model.addAttribute(service.readJsp(boardno));
		}
	}
	
	
	
	//게시글 수정 화면
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(@RequestParam("boardno") int boardno,@ModelAttribute("search") SearchCriteria search,Model model,BoardVO bvo)throws Exception {
		logger.info("====================modify GET===================="); 
		
		if(bvo.getboardCat().equals("a_java")) {
			model.addAttribute(service.readJava(boardno));
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			model.addAttribute(service.readJsp(boardno));
		}
	}
	
	
	//게시글 수정 처리 
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(BoardVO bvo, SearchCriteria search, RedirectAttributes rttr)throws Exception{
		logger.info("====================modify POST====================");

		if(bvo.getTitle().length() > 2) {
			if(bvo.getboardCat().equals("a_java")) {
				service.modJava(bvo);
			}
			else if(bvo.getboardCat().equals("a_jsp")){
				service.modJsp(bvo);
			}
			
			rttr.addAttribute("page", search.getPage());
			rttr.addAttribute("perPageNum", search.getPerPageNum());
			rttr.addAttribute("searchType", search.getSearchType());
			rttr.addAttribute("keyword", search.getKeyword());
			rttr.addFlashAttribute("msg", "modify");
			
		} else {
			rttr.addFlashAttribute("msg", "fail");
		}
		
		String board = "";
		if(bvo.getboardCat().equals("a_java")) {
			board = "redirect:/archives/java";
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			board = "redirect:/archives/jsp";
		}
		
		return board;
		
	}
	
	
	//게시글 삭제처리
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(@RequestParam("boardno") int boardno, RedirectAttributes rttr,SearchCriteria search,BoardVO bvo)throws Exception{
		logger.info("====================delete====================");
		
		if(bvo.getboardCat().equals("a_java")) {
			service.delJava(boardno);
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			service.delJsp(boardno);
		}
		
		rttr.addAttribute("page", search.getPage());
		rttr.addAttribute("perPageNum", search.getPerPageNum());
		rttr.addAttribute("searchType", search.getSearchType());
		rttr.addAttribute("keyword", search.getKeyword());
		rttr.addFlashAttribute("msg", "remove");
		
		String board = "";
		if(bvo.getboardCat().equals("a_java")) {
			board = "redirect:/archives/java";
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			board = "redirect:/archives/jsp";
		}
		
		return board;
	}
	
	
	//java카테고리 게시글 리스트 
	@RequestMapping(value = "/java", method = RequestMethod.GET)
	public void java(@ModelAttribute("search") SearchCriteria search, Model model)throws Exception{
		logger.info("====================java====================");
		logger.info("search = "+search.toString());
		
		model.addAttribute("list", service.javaPinfo(search));
		
		PageUtil pageutil = new PageUtil();
		pageutil.setCri(search);
		pageutil.setBDtotal(service.javaPcount(search));
	
		model.addAttribute("pageutil", pageutil);
		
	}
	
	
	//jsp카테고리 게시글 리스트	
	@RequestMapping(value = "/jsp", method = RequestMethod.GET)
	public void jsp(@ModelAttribute("search") SearchCriteria search, Model model)throws Exception{
		logger.info("====================jsp====================");
		logger.info("search = "+search.toString());
		
		model.addAttribute("list", service.jspPinfo(search));
		
		PageUtil pageutil = new PageUtil();
		pageutil.setCri(search);
		pageutil.setBDtotal(service.jspPcount(search));
		
		model.addAttribute("pageutil", pageutil);
		
	}
	
}
