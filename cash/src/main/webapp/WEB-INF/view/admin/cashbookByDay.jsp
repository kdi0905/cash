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
	width: 1100px; // 가로 폭 
	height : 100%; //세로폭 
	overflow: hidden; // 범위를 넘엇을시 넘는 영역 숨김 
	background-position : 0 0;//시작위치 
	background-repeat: no-repeat; // 배경화면 반복 
	background-attachment :fixed; // 배경화면 스크롤시 고정
	background-size : cover; // 배경화면 비율유지
	position :relative; //위치지정 
	overflow-y: auto;//스크롤
}

</style>
</head>
<body>
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1>cashbookListByDay </h1>
	<div>
		${param.currentYear}년 ${param.currentMonth}월 
	</div>
	<div style="text-align: center;">
		<a href="">이전</a>
		${param.currentDay}일
		<a href="">이후</a>
	</div>
	<div>
	<a href="/admin/addCashbook?currentYear=${param.currentYear}&currentMonth=${param.currentMonth}&currentDay=${param.currentDay}">추가</a>
	</div>
	<table class="table">
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
					<td><a href="">수정</a></td>
					<td><a href="">삭제</a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>
</body>
</html>