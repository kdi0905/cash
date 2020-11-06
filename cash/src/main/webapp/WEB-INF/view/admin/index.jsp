<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
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
	<div>
		<!-- 공지 -->
		<h1 style="text-align: center; margin-top: 30px;">공지사항<a href="/admin/noticeList"><span class="text-secondary"style="font-size: 20px;">more</span></a> </h1>
		<table class="table table-bordered" style="text-align: center">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var ="n" items="${noticeList}">
			<tr>
				<td>${n.noticeId }</td>
				<td>${n.noticeTitle }</td>
				<td>${n.noticeDate }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	<!-- 수입 /지출 -->
	<h1 style="font-size:30px;margin-top: 30px; text-align: center; ">★ 수입 / 지출 ★</h1>
	<div>
		<table class="table table-bordered" style="text-align: center">
			<thead>
				<tr>
					<th>날짜</th>
					<th>수입</th>
					<th>지출</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="io" items="${inOutList}">
					<tr>
						<td>${io["날짜"]}</td>
						<td class="text-success">${io["수입"]}</td>
						<td class="text-danger">- ${io["지출"]}</td>
						<td>${io["합계"]}</td>
					</tr>
				</c:forEach>
				
			</tbody>
		</table>
	</div>
</div>
</body>
</html>