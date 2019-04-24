package com.manage.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import com.manage.app.member.Member;
import com.manage.app.member.service.MemberService;

@Controller
// @RequestMapping(value = "test")
public class Test {

    @Autowired
    MemberService ms;
    
    // http://localhost:8090/app/getTest1?id=1&pwd=111
    @RequestMapping(value = "/getTest1", method = RequestMethod.GET)
    public String getTest1(Model model, HttpServletRequest req) {
        
        String id = req.getParameter("id");
        System.out.println("id : " + id);
        System.out.println("---login---");

        model.addAttribute("idNum", id);

        return "test";
    }

    // http://localhost:8090/app/getTest2?id=1&pwd=111
    @RequestMapping(value = "/getTest2", method = RequestMethod.GET)
    public String getTest2(Model model, @RequestParam("id") String id, 
        @RequestParam(value = "id", required = true, defaultValue = "123") String pwd) {

        System.out.println("id : " + id);
        System.out.println("pwd : " + pwd);
        System.out.println("---login---");

        return "test";
    }

    // http://localhost:8090/app/getTest3?id=1&pwd=111&memMail=aa@bb
    @RequestMapping(value = "/getTest3", method = RequestMethod.GET)
    public String getTest3(Member mem) {

        System.out.println("memId : " + mem.getMemId());
        System.out.println("memPw : " + mem.getMemPw());
        System.out.println("memMail : " + mem.getMemMail());
        System.out.println("---login---");

        return "test";
    }
}
