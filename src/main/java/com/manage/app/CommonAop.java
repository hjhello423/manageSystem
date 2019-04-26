package com.manage.app;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class CommonAop {

	
	@Pointcut("execution(* com.manage.app..*.*(..))")
	private void methodLog() {}
	
	@Around("methodLog")
	public void log(ProceedingJoinPoint joinPoint) throws Throwable {
		String signatureString = joinPoint.getSignature().toShortString();
		System.out.println(signatureString + " 시작");
		long start = System.currentTimeMillis();
		System.out.println("aop-------start1");
		try {
			System.out.println("aop-------start2");
			Object result = joinPoint.proceed();
//			return result;
			
		} catch (Exception e) {
		} finally {
			System.out.println("aop-------end1");
			long finish = System.currentTimeMillis();
			System.out.println(signatureString + " 종료");
			System.out.println(signatureString + " 실행 시간 : " + (finish - start) + "ms");
		}
		
		System.out.println("aop-------end2");
	}
}
