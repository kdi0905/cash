<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice.jsp</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
		margin: auto;
	width: 1100px; 
	height : 100%; 
	background-color: #fafbfc;
}
thead{
	background-color:  #D5D5D5;
}
tbody{
	background-color: white;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1 style="margin-top: 40px; text-align: center;">공지사항 수정</h1>
	<form method="post" action="/admin/modifyNotice/${notice.noticeId}">
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td>notice_id</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><input type="text" name="noticeTitle" value="${notice.noticeTitle}"></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><textarea style="width: 300px;" name="noticeContent">${notice.noticeContent}</textarea></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
		<button class="btn btn-secondary" style="float: right;" type="submit">수정</button>
	</form>
</body>
</html>