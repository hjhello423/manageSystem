<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<h1>메인 페이지</h1>

<h3>로그인 하기</h3>


<form action="/app/login" method="post">
	ID : <input type="text" name="memId">
	<br>
	PW : <input type="password" name="memPw">
	<br>
	<input type="submit" value"로그"> 로그인
</form>

</body>
</html>