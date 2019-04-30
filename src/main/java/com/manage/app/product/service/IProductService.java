package com.manage.app.product.service;

import com.manage.app.repository.Member;
import com.manage.app.repository.Product;

public interface IProductService {
	void productRegister(Product product, Member member);

	Product productSearch(String serial);

	void productemove();

	boolean productModify(Product product);

}
