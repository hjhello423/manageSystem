package com.manage.app.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

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
import com.manage.app.member.MemberLoginValidator;
import com.manage.app.member.repository.MemberValidator;
import com.manage.app.member.service.MemberService;
import com.manage.app.repository.Member;
import com.mysql.cj.Session;

//@SessionAttributes("member")
@Controller
@RequestMapping("/member")
public class MemberController {

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

	@RequestMapping(value = { "/myInfo", "/profile" }, method = RequestMethod.GET)
//	public String login(Member mem, HttpServletRequest req, BindingResult bindingResult) {
	public String memInfo(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		Member mem = (Member) session.getAttribute("member");
		mem = memberService.memberSearch(mem.getMemId(), mem.getMemPw());

		model.addAttribute("member", mem);

		logger.info(request.getRequestURI());
		if (request.getRequestURI().equals("/app/member/myInfo")) {
			return "member/memberInfo";
		} else if (request.getRequestURI().equals("/app/member/profile")) {
			return "member/profile";
		} else {
			return "redirect:/";
		}
	}

	@ResponseBody
	@RequestMapping(value = "/profile", method = RequestMethod.PUT)
	public String viewProfile(@RequestBody Member member, BindingResult bindingResult, HttpServletRequest request,
			Model model) {

		logger.info(member.toString());
		HttpSession session = request.getSession();
		boolean result = memberService.memberModify(member);

		logger.info("멤버 수정 결과 -" + result);

		return "member/profile";
	}

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

//	@InitBinder
//	protected void initBinder(WebDataBinder binder) {
//		binder.setValidator(new MemberLoginValidator()); // 로그인 validater 등록
//	}

}