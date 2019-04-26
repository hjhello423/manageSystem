package com.manage.app.product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.manage.app.product.Product;

@Controller
public class ProductController {
	
	@RequestMapping(value = "/product", method = RequestMethod.POST)
	public String add(Product product, Model model) {
		
		// 335페이지 WebDataBinder 이용하여 날짜 변경
		
		return "";
	}

}
