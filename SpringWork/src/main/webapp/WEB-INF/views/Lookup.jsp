<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학기별 학점 조회 페이지</title>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/lookup.css">

</head>
<body>
	<header>
		<span class="spn">- 학기별 이수 학점 -</span>
	</header>
	<table class="table1">
		<thead>
			<tr>
				<th>년도</th>
				<th>학기</th>
				<th>취득학점</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody class="tbody">
			<c:forEach var="subjects" items="${subjects}">
				<tr>
					<td><c:out value="${subjects.year}"></c:out></td>
					<td><c:out value="${subjects.semester}"></c:out></td>
					<td><c:out value="${subjects.credit}"></c:out></td>
					<td>
						<form action="DetailLookup" method="get">
							<input type="hidden" name="subNum" value="${subjects.subNum}" />
							<input type="submit" value="상세정보" />
						</form>
					</td>
				</tr>
			</c:forEach>
			<tr style="background: #a795d2; color: white">
				<td>총계</td>
				<td></td>
				<c:set var="sum" value="0" />
				<c:forEach var="subjects" items="${subjects}">
					<c:set var="sum" value="${sum+subjects.credit}" />
				</c:forEach>
				<td><c:out value="${sum}" /></td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<p>
		<a href="${pageContext.request.contextPath}/LookupMenu"> 돌아가기 </a>
	</p>
</body>
</html>
