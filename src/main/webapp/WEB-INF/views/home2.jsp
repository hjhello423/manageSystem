<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world
</h1>

'${member.memId}'님이 로그인 중입니다.

<P>  The time on the server is ${serverTime}. </P>

<a href="/app/memInfo">회원 정보</a> 
<br>
<a href="/app/resources/html/login.html">제품 등록</a>
<br>
<a href="/app/logout">로그아웃</a>
</body>
</html>
