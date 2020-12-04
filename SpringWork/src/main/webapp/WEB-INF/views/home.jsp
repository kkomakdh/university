<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 첫 화면</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/lookup.css">

</head>
<body>
<br>
<header class="head">
	<span class="span">Welcome to Hansung University Subject Lookup Site!!</span>
</header>
<div class = "div2">
	<p>
		<a href="${pageContext.request.contextPath}/LookupMenu" class="menu"> Show Your
			Subject </a>
	</p>
	<p>
		<a href="${pageContext.request.contextPath}/login" class="menu"> Login </a>
	</p>
	<c:if test="${pageContext.request.userPrincipal.name != null}">
		<a href="javascript:document.getElementById('logout').submit()" class="menu">Logout</a>
	</c:if>

	<form id="logout" action="<c:url value="/logout" />" method="post">
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
	</form>
</div>
</body>
</html>