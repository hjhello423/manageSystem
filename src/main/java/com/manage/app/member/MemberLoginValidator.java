package com.manage.app.member;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class MemberLoginValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// Member 객체인지 판단하고 true 리턴
		return Member.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Member mem = (Member)target;
		
		// id와 pw가 공백이거나 empty 이면 에러 등록
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memId", "required");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "memPw", "required");
		
	}
}
