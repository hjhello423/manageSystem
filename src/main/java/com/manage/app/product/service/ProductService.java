package com.manage.app.product.service;

import java.awt.SystemColor;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Formatter;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.manage.app.repository.Member;
import com.manage.app.repository.Product;
import com.manage.app.repository.ProductRepository;

@Service
public class ProductService implements IProductService {

	private static final Logger logger = LoggerFactory.getLogger(ProductService.class);

	@Autowired
	private ProductRepository productRepository;

	@Override
	public void productRegister(Product product, Member mem) {
		logger.info("요청 정보 : " + product.toString());

		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		try {
			Date date = formatter.parse("20201010");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		product.setSerial("serial"+ System.currentTimeMillis());
		product.setLicense("license" + new Random().nextInt(10));
		product.setRegDate(new Date());
		product.setEndDate(new Date());
		product.setRegister(mem);
		
		Product produc = productRepository.saveAndFlush(product);

		if (produc == null) {
			logger.warn("제품 등록 실패");
		}

	}

	@Override
	public Product productSearch(String memId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void productemove() {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean productModify(Product member) {
		// TODO Auto-generated method stub
		return false;
	}

}
