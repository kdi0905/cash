<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
	padding: 0;
	margin: 0;
	width: 100%; 
	height : 100%; 
	overflow: hidden;
	background-position : 
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
	
	<h1 style="margin-top: 40px; text-align: center;">공지사항 상세보기</h1>
		<div style="float: left">
			<a class ="btn btn-secondary" style="margin-bottom: 20px" href="/admin/noticeList" >목록</a>
		</div>
		<div style="float: right">
			<a class ="btn btn-secondary" style="margin-bottom: 20px" href="/admin/modifyNotice?noticeId=${notice.noticeId}">수정</a>
			<a class ="btn btn-secondary" style="margin-bottom: 20px" href="/admin/removeNotice?noticeId=${notice.noticeId}">삭제</a>	
		</div>
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td>notice_id</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td>${notice.noticeTitle }</td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td>${notice.noticeContent }</td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
	
	</div>
</body>
</html>