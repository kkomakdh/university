<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수강신청 조회 페이지</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/lookup.css">

</head>
<body>
<header>
		<span class="spn">- 수강신청 내역 확인 -</span>
	</header>
	<table class="table1">
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>교과목명</th>
				<th>교과구분</th>
				<th>담당교수</th>
				<th>학점</th>
			</tr>
		</thead>
		<tbody class="tbody">
			<c:forEach var="subjects" items="${subjects}">
				<tr>
					<td><c:out value="${subjects.year}"></c:out></td>
					<td><c:out value="${subjects.semester}"></c:out></td>
					<td><c:out value="${subjects.subName}"></c:out></td>
					<td><c:out value="${subjects.subType}"></c:out></td>
					<td><c:out value="${subjects.professor}"></c:out></td>
					<td><c:out value="${subjects.credit}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="${pageContext.request.contextPath}/deleteApply"> 수강신청 내역
			삭제하기 </a>
	</p>
	<p>
		<a href="${pageContext.request.contextPath}/LookupMenu"> 돌아가기 </a>
	</p>
</body>
</html>