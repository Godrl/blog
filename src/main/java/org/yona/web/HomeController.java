package org.yona.web;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.yona.archives.BoardService;
import org.yona.archives.BoardVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Inject
	private BoardService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	/*@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	*/
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		logger.info("=====index GET=====");
		
		return "index";
	}
	
	@RequestMapping(value = "/archives", method = RequestMethod.GET)
	public void archives() {
		logger.info("=====archives GET=====");
		
	}

	@RequestMapping(value = "/archives", method = RequestMethod.POST)
	public String archivesPOST(BoardVO bvo, RedirectAttributes rttr)throws Exception{
		logger.info("=====archives POST=====");
		logger.info("bvo = "+bvo.toString());
		
		if(bvo.getboardCat().equals("a_java")) {
			logger.info("=====rgst Java=====");
			service.rgstJava(bvo);
		}
		else if(bvo.getboardCat().equals("a_jsp")){
			logger.info("=====rgst Jsp=====");
			service.rgstJsp(bvo);
		}
		
		rttr.addAttribute(bvo.getboardCat());
		
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
		
}
