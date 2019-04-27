package com.manage.app;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.manage.app.member.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root(Locale locale, HttpServletRequest request) {
		
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		HttpSession session = request.getSession();
		Member member = (Member)session.getAttribute("member");
		
		if (member == null) {
			logger.info("로그인 정보 X - 로그인 페이지 이동");
			return "login";
		}
		
		logger.info("로그인 정보 O - 메인 페이지 이동 , ID:" + member.getMemId());
		return "home";
	}
	
}
