<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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

		<!-- 공지 -->
		<table class="table table-bordered" style="margin-top: 40px; text-align: center;">
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
		<div style="text-align: center;">
		<h1>로그인</h1>
		<form method="post" action="/login">
			<div style="margin-bottom: 20px;">
				<span style="font-size: 20px; margin-right: 30px;">ID :</span> <input type ="text" name="id">
			</div>
			<div style="margin-bottom: 20px;">
				<span style="font-size: 20px; margin-right: 20px;">PW :</span> <input type ="password" name="pw">
			</div>
			<div>
				<button class="btn btn-secondary" type="submit">로그인</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>