package org.yona.login;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/member/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	private LoginService service;
	
	@RequestMapping(value="/signin")
	public String singinPOST() throws Exception {
		logger.info("=====signin=====");
		return "member/signin";
	}
	
	@RequestMapping(value="/denyaccess", method=RequestMethod.GET)
	public void denyaccess() throws Exception{
		logger.info("=====denyaccess=====");
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.GET)
	public void signupGET() throws Exception{
		logger.info("=====signup GET=====");
	}
	
	@RequestMapping(value="/signup", method=RequestMethod.POST)
	public String signupPOST(LoginVO vo,RedirectAttributes rttr) throws Exception{
		logger.info("=====signup POST=====");
		logger.info("Member = "+vo.toString());
		
		service.insertUser(vo);
		
		rttr.addFlashAttribute("msg", "register");
		
		return "redirect:/";
	}
	
}
