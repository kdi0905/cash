<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
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
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1 style="margin-top: 40px; text-align: center;">공지사항 추가</h1>
	<form method="post" action="/admin/addNotice">
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td>notice_title</td>
				<td><input type="text" placeholder="공지 제목을 입력하세요" name="noticeTitle"></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><textarea style="width: 300px;" placeholder="공지 내용을 입력하세요" name="noticeContent"></textarea></td>
			</tr>
		</table>
		<button class="btn btn-secondary" style="float: right;" type="submit">추가</button>
	</form>
	
	</div>

</body>
</html>