<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청 페이지</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/lookup.css">
</head>
<body>
	<header>
		<span class="spn">- 수강신청 폼 -</span>
	</header>
	<br>
	<sf:form method="post"
		action="${pageContext.request.contextPath}/doApply"
		modelAttribute="subject">
		<table class="table2">
			<tr>
				<th class="label">신청 교과목명</th>
				<td><sf:textarea class="control" path="subName" /><br> <sf:errors
						path="subName" class="error" /></td>
			</tr>
			<tr>
				<th class="label">신청 교과구분</th>
				<td><sf:textarea class="control" path="subType" /><br> <sf:errors
						path="subType" class="error" /></td>
			</tr>
			<tr>
				<th class="label">신청 교수명</th>
				<td><sf:textarea class="control" path="professor" /><br>
					<sf:errors path="professor" class="error" /></td>
			</tr>
			<tr>
				<th class="label">신청 학점</th>
				<td><sf:textarea class="control" path="credit" /><br> <sf:errors
						path="credit" class="error" /></td>
			</tr>
			<tr><td></td>
				<td align=right><input type="submit" 
					value="수강신청 등록" class="btn" /></td>
			</tr>
		</table>
	</sf:form>
</body>
</html>