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
	padding: 0;
	margin: 0;
	width: 100%; 
	height : 100%; 
	overflow: hidden; 
	background-position : 0 0;
	background-repeat: no-repeat; 
	background-attachment :fixed; 
	background-size : cover; 
	position :relative;  
	overflow-y: auto;
	
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
	
		<a class ="text-dark" href="/admin/cashbookByDay?target=pre&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}"> < </a>
		${currentDay}일
		<a class ="text-dark" href="/admin/cashbookByDay?target=next&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}"> > </a>
	
	</div>
	</h3>
	<div>
	<a class = "btn btn-secondary "href="/admin/addCashbook?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">추가</a>
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
					<td>${c.cashbookPrice }</td>
					<td>${c.cashbookContent }</td>
					<td><a class="text-secondary" href="/admin/updateCashbook?cashbookId=${c.cashbookId}&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">수정</a></td>
					<td><a class="text-danger" href="/admin/deleteCashbook?cashbookId=${c.cashbookId}&currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${currentDay}">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</div>
</body>
</html>