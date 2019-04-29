package com.manage.app;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manage.app.domain.MemberRepository;
import com.manage.app.member.Member;
import com.manage.app.member.MemberValidator;
import com.manage.app.member.service.MemberService;
import com.mysql.cj.protocol.Message;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Autowired
	MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	DataSource dataSource;

	@Autowired
	MemberRepository memberRepository;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String root(Locale locale, HttpServletRequest request) {

//		logger.info("Welcome home! The client locale is {}.", locale);

		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");

		if (member == null) {
			logger.info("로그인 정보 X - 로그인 페이지 이동");
			return "login";
		}
////////////////////////////////////////////////////////

		logger.info(dataSource.toString());

		com.manage.app.domain.Member m = memberRepository.findOne("33");
		logger.info(m.getMemId() + " : " + m.getMemMail());

//		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
//		List<Member> memList = jdbcTemplate.query(
//				"select * from member", 
//				new Object[] {},
//				new RowMapper<Member>() {
//					@Override
//					public Member mapRow(ResultSet rs, int rowNum) throws SQLException {
//						Member m = new Member();
//						m.setMemId(rs.getString("id"));
//						m.setMemPw(rs.getString("pwd"));
//						m.setMemMail(rs.getString("mail"));
//						m.setMemName(rs.getString("name"));
//						return m;
//					}
//				});
//			System.out.println(memList.get(3).getMemId());

//////////////////////////////////////////////////////		
		logger.info("로그인 정보 O - 메인 페이지 이동 , ID:" + member.getMemId());
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid Member member, BindingResult bindingResult, HttpServletRequest request) {

		HttpSession session = request.getSession();
//		System.out.println(messageSource.getClass());
//		System.out.println(messageSource.getMessage("hello",null,Locale.KOREA));

		if (bindingResult.hasErrors()) { // validate
			logger.info("로그인 실패 - valid");
			return "redirect:/";
		}

		Member mem = memberService.memberSearch(member.getMemId(), member.getMemPw());
		if (mem == null) {
			logger.info("로그인 실패 - 정보 없음");
			return "redirect:/";
		}

		logger.info("로그인 완료 - 셔센 등록");
		session.setAttribute("member", mem);
		session.setMaxInactiveInterval(60 * 5); // 5분 유지
		return "redirect:/";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		logger.info("로그 아웃 처리");
		request.getSession().invalidate();
		return "redirect:/";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String memRegister() {
		return "member/memberRegister";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String memRegisterApi(@Valid Member member, BindingResult bindingResult, HttpServletRequest request,
			Model model) {

		if (bindingResult.hasErrors()) {
			logger.info("가입 실패 - valid");
			return "member/memberRegister";
		}

		memberService.memberRegister(member);
		model.addAttribute("message", "회원가입이 완료 되었습니다.");

		return "redirect:/";
	}

}
