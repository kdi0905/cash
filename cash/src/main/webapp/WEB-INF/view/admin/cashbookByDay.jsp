<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookByDay</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{	
	margin: auto;
	width: 1300px; 
	height : 100%; 
	
}

</style>
</head>
<body>
	<div style="margin-left: 10%; margin-right:10%;">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>

	<h3 style="margin-top: 30px;">
	<div style="text-align: center;">
		${currentYear}년 ${currentMonth}월 
	</div>
	<div style="text-align: center;">
		<a class ="text-dark" href="/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}"> < </a>
		${currentDay}일
		<a class ="text-dark" href="/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}"> > </a>
	</div>
	</h3>
	<div>
	<a class = "btn btn-secondary "href="/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">추가</a>
	</div>
	<table class="table " style="margin-top: 30px; text-align: center;">
		<thead>
			<tr>
				<th>cashbookId</th>
				<th>cashbookKind</th>
				<th>categoryName</th>
				<th>cashbookPrice</th>
				<th>cashbookContent</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>

		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList}">
				<tr>
					
					<td>${c.cashbookId }</td>
					<td>${c.cashbookKind }</td>
					<td>${c.categoryName }</td>
					<c:if test="${c.cashbookKind=='지출' }">
					<td class="text-danger">- ${c.cashbookPrice }</td>
					</c:if>
					<c:if test="${c.cashbookKind=='수입' }">
					<td class =" text-success">${c.cashbookPrice }</td>
					</c:if>
					<td>${c.cashbookContent }</td>
					
					<td><a class="text-secondary" href="/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
					<td><a class="text-danger" href="/admin/deleteCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</div>
</body>
</html>