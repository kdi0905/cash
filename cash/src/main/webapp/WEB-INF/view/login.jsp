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
	width: 100%; // 가로 폭 
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
<div class="container">

		<!-- 공지 -->
		<table class="table table-bordered">
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
	
	<h1>로그인</h1>
	<form method="post" action="/login">
		<div>
			ID: <input type ="text" name="id">
		</div>
		<div>
			PW: <input type ="password" name="pw">
		</div>
		<div>
			<button type="submit">로그인</button>
		</div>
	</form>
	</div>
</body>
</html>