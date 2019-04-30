package com.manage.app.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.manage.app.product.service.ProductService;
import com.manage.app.repository.Member;
import com.manage.app.repository.Product;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductService productService;

	@RequestMapping(value = "/product/", method = RequestMethod.POST)
	public String add(Product product, Model model) {

		// 335페이지 WebDataBinder 이용하여 날짜 변경
		return "";
	}

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String viewRegist(Product product, HttpServletRequest request, Model model) {
		// 335페이지 WebDataBinder 이용하여 날짜 변경
		HttpSession session = request.getSession();
		return "product/productRegister";
	}

	@ResponseBody
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String productRegister(@RequestBody Product product, HttpServletRequest request, Model model) {
		logger.info("제품 등록 컨트롤러 in");

		Product prod = new Product();
		Member mem = (Member) request.getSession().getAttribute("member");
		
		productService.productRegister(prod, mem);
		
		logger.info("제품 등록 컨트롤러 out");
		
		// 335페이지 WebDataBinder 이용하여 날짜 변경
		HttpSession session = request.getSession();
		return "product/productRegister";
	}

}
