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

	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/view/inc/menu.jsp"></jsp:include>
	
	<h1 style="margin-top: 40px; text-align: center;">공지사항 수정</h1>
	<form id="updateNoticeForm" method="post" action="${pageContext.request.contextPath }/admin/modifyNotice/${notice.noticeId}">
		<table class="table table-bordered" style="text-align: center;">
			<tr>
				<td>notice_id</td>
				<td>${notice.noticeId}</td>
			</tr>
			<tr>
				<td>notice_title</td>
				<td><input id="noticeTitle" type="text" name="noticeTitle" value="${notice.noticeTitle}">
				<span class="text-danger" style="margin-left:10px; font-size: 10px"  id="noticeTitleCheck"></span></td>
			</tr>
			<tr>
				<td>notice_content</td>
				<td><textarea id="noticeContent" style="width: 300px;" name="noticeContent">${notice.noticeContent}</textarea>
				<span class="text-danger" style="margin-left:10px; font-size: 10px"  id="noticeContentCheck"></span></td>
			</tr>
			<tr>
				<td>notice_date</td>
				<td>${notice.noticeDate}</td>
			</tr>
		</table>
		<button id="btn" class="btn btn-secondary" style="float: right;" type="button">수정</button>
	</form>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("#btn").click(function(){
		
		if($("#noticeTitle").val()==""){
			$("#noticeTitleCheck").html("공지 제목을 입력해주세요.");
		}else{
			$("#noticeTitleCheck").html("");
		}
		
		if($("#noticeContent").val()==""){
			$("#noticeContentCheck").html("공지 내용을 입력하세요");
		}else{
			$("#noticeContentCheck").html("");
		}
		
		
		if($("#noticeTitle").val()!=""&&$("#noticeContent").val()!=""){
			$("#updateNoticeForm").submit();
		}
		});
</script>
</html>