package com.manage.app.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.manage.app.MemberDB;
import com.manage.app.member.Member;
import com.manage.app.member.MemberLoginValidator;
import com.manage.app.member.service.MemberService;


@Controller
//@SessionAttributes("member")
public class MemberController {

//	MemberService service = new MemberService();
//	@Resource(name="memService")
	@Autowired
	MemberService memberService;
	
	@Autowired
	private ReloadableResourceBundleMessageSource messageSource;
	
	
//	@ModelAttribute("member")
//	public Member memModel() {
//		return new Member();
//	}
	
	@ModelAttribute("serverTime")
	public String getServerTime() {
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
		
		String formattedDate = dateFormat.format(date);
		
		return formattedDate;
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid Member mem, Errors errors, HttpServletRequest req, Model model) {
		
		HttpSession session = req.getSession();

//		System.out.println(messageSource.getClass());
//		System.out.println(messageSource.getMessage("hello",null,Locale.KOREA));
//		
//		System.out.println("로그인 진행");
//		System.out.println(mem.getMemId());
//		System.out.println(req.getParameter("memPw"));
		
		if (errors.hasErrors()) {
			System.out.println("로그인 - @valid");
			model.addAttribute("loginFail", messageSource.getMessage("loginFail",null,Locale.KOREA));
			return "redirect:/";
		}
		
		Member member = memberService.memberSearch(mem.getMemId(), mem.getMemPw());
		session.setAttribute("member", member);

		if (member == null) {
			return "redirect:/";
			
		}
		return "home";
	}
	
	@RequestMapping(value="/memInfo", method=RequestMethod.GET)
//	public String login(Member mem, HttpServletRequest req, BindingResult bindingResult) {
	public String memInfo(@ModelAttribute("member") Member mem, HttpServletRequest request, Model model) {
		
		System.out.println(mem.getMemId());
		System.out.println(mem.getMemPw());
		
		
		// id, pw 값 validate 
//		new MemberLoginValidator().validate(mem, bindingResult);
//		if (bindingResult.hasErrors()) {
//			System.out.println("로그인 정보 없음 - validator");
//			return "redirect:/";
//			
//		}
		
		return "member/memberInfo";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		
		return "redirect:/";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(new MemberLoginValidator()); // 로그인 validater 등록
	}
	
}