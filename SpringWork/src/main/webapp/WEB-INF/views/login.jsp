<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/login.css">

</head>
<body>

	<div class="container">
		<form class="form-signin" method="post"
			action="<c:url value = "login"/>">
			<h2 class="form-signin-heading">Please sign in</h2>
			<c:if test="${not empty errorMsg}">
				<div style="color: #ff0000">
					<h4>${errorMsg }</h4>
				</div>
			</c:if>

			<c:if test="${not empty logoutMsg}">
				<div style="color: #0000ff">
					<h4>${logoutMsg }</h4>
				</div>
			</c:if>
				<p>
					<label for="username" class="sr-only">Username</label> <br>
					<input type="text" id="username" name="username" class="form-control"
						placeholder="Username" required autofocus>
				</p>
				<p>
					<label for="password" class="sr-only">Password</label> <br>
					<input type="password" id="password" name="password" class="form-control"
						placeholder="Password" required>
				</p>
				<input type="hidden" name="${ _csrf.parameterName }"
					value="${_csrf.token }" />
				<button class="button" type="submit">Sign in</button>
		</form>
	</div>
</body>
</html>