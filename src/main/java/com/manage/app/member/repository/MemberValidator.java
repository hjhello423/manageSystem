package com.manage.app.member.repository;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class MemberValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member member = (Member)target;

//		if (member.getMemId() == null) {
//			errors.rejectValue("memId", "required");
//		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memId", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memPw", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memMail", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memName", "required");


	}
}
