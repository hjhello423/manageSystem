package com.manage.app.member.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.manage.app.member.Member;
import com.manage.app.member.service.MemberService;


@Controller
public class MemberController {

//	MemberService service = new MemberService();
//	@Resource(name="memService")
	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member mem, HttpServletRequest req) {
		
		String id = mem.getMemId();
		String pw = mem.getMemPw();
		
		if (id.isEmpty()|| pw.isEmpty()) {
			System.out.println("로그인 정보 없음");
			return "redirect:/";
		}
		
		System.out.println("로그인 진행");
		System.out.println(mem.getMemId());
		System.out.println(req.getParameter("memPw"));
		System.out.println(req.getParameter("memPw"));
				
		return "home";
	}
	
	@RequestMapping(value="/memJoin", method=RequestMethod.POST)
	public String memJoin(Model model, HttpServletRequest request) {
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		String memMail = request.getParameter("memMail");
		String memPhone1 = request.getParameter("memPhone1");
		String memPhone2 = request.getParameter("memPhone2");
		String memPhone3 = request.getParameter("memPhone3");
		
		service.memberRegister(memId, memPw, memMail, memPhone1, memPhone2, memPhone3);
		
		model.addAttribute("memId", memId);
		model.addAttribute("memPw", memPw);
		model.addAttribute("memMail", memMail);
		model.addAttribute("memPhone", memPhone1 + " - " + memPhone2 + " - " + memPhone3);
		
		return "memJoinOk";
	}
	
	@RequestMapping(value="/memLogin", method=RequestMethod.POST)
	public String memLogin(Model model, HttpServletRequest request) {
		
		String memId = request.getParameter("memId");
		String memPw = request.getParameter("memPw");
		
		Member member = service.memberSearch(memId, memPw);
		
		try {
			model.addAttribute("memId", member.getMemId());
			model.addAttribute("memPw", member.getMemPw());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "memLoginOk";
	}
	
}