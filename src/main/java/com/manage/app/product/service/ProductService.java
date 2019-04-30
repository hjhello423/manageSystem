package com.manage.app.product.service;

import java.awt.SystemColor;
import java.security.CryptoPrimitive;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Formatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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

		String hash = product.getSha256(product.getMac());
		String serial = product.getModelLine() + product.getModel() + product.getNation() + "_";
		serial += hash.substring(0, 10);

		String license = product.getSha256(String.valueOf(System.currentTimeMillis())).substring(0, 15);

		product.setSerial(serial);
		product.setLicense(license);
		product.setRegDate(new Date());
		product.setMem(mem);

		Product produc = productRepository.saveAndFlush(product);

		if (produc == null) {
			logger.warn("제품 등록 실패");
		}
	}

	public HashMap<String, List<Product>> myProduct(Member member) {
		String id = member.getMemId();
		Iterable<Product> memberList =  productRepository.findByMem(member);
		
		logger.info("================");
		logger.info(memberList.toString());
		
		HashMap<String, List<Product>>  map = new HashMap<String, List<Product>>();
		List<Product>  list = new ArrayList<Product>();
		
		Iterator<Product> itr = memberList.iterator();
		while (itr.hasNext()) {
			list.add(itr.next());
		}
		
		logger.info("================");
		logger.info(list.toString());
		
		map.put("data", list);
		
		logger.info("================");
		logger.info(map.toString());
		
		
		
		logger.info("================");
		logger.info("서비스 out");
		
		return map;
		
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
