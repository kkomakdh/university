<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조회 메뉴 페이지</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/lookup.css">

</head>
<body>
<br>
	<header>
		<span class="span"> 학점 조회 페이지 </span>
	</header>

	<div class="div2">
		<p class = "menu">
			학기별 이수 학점 조회하기 <a href="${pageContext.request.contextPath}/Lookup"
				class="menu"> CLICK </a>
		</p>
		<p class = "menu">
			수강신청 하기 <a href="${pageContext.request.contextPath}/Apply"
				class="menu"> CLICK </a>
		</p>
		<p class = "menu">
			수강신청 내역 확인하기 <a href="${pageContext.request.contextPath}/ApplyLookup"
				class="menu"> CLICK </a>
		</p>
	</div>
</body>
</html>