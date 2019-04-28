package com.manage.app.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.MessageSourceAware;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.http.HttpMethod;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonArrayFormatVisitor;
import com.manage.app.MemberDB;
import com.manage.app.member.Member;
import com.manage.app.member.MemberLoginValidator;
import com.manage.app.member.MemberValidator;
import com.manage.app.member.service.MemberService;


@Controller
//@SessionAttributes("member")
@RequestMapping("/member")
public class MemberController {

//	MemberService service = new MemberService();
//	@Resource(name="memService")
	@Autowired
	MemberService memberService;
	
	@Autowired
	private ReloadableResourceBundleMessageSource messageSource;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
//	@ModelAttribute("member")
//	public Member memModel() {
//		return new Member();
//	}
	
//	@ModelAttribute("serverTime")
//	public String getServerTime() {
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		return formattedDate;
//	}
	
	@RequestMapping("/test")
	public String test() {
		return "home";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/api/register", method = RequestMethod.POST)
//	public String memRegisterApi(@RequestBody HashMap<String, String> registerMemberForm, 
//			BindingResult bindingResult,  HttpServletRequest request) {
//		
//		Member mem1 = new Member(registerMemberForm);
//		
//		logger.info("==========");
//		logger.info(mem1.getMemId());
//		logger.info(mem1.getMemPw());
//		logger.info(mem1.getMemMail());
//		logger.info(mem1.getMemName());
//		logger.info("==========");
//		
//		new MemberValidator().validate(new Member(registerMemberForm), bindingResult);
//		if (bindingResult.hasErrors()) {
//			logger.info("가입 실패 - valid");
//			return "실패";
//		}
//		
//		Member mem = new Member(registerMemberForm.get("memId"), registerMemberForm.get("memPw"),
//				registerMemberForm.get("memName"), registerMemberForm.get("memMail"));
//		
//		memberService.memberRegister(mem);
//			
//		return "로그인";
//	}
	
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
	
	
//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(new MemberLoginValidator()); // 로그인 validater 등록
//	}
	
}