<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList</title>
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
	<h1 style="text-align: center">공지사항 </h1>
		<div ><a class="btn btn-secondary" style="margin-bottom: 20px" style="float: right;" href="/admin/addNotice">추가</a></div>
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
				<td><a class="text-dark"href="/admin/noticeOne?noticeId=${n.noticeId}">${n.noticeTitle }</a></td>
				<td>${n.noticeDate }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<!-- 페이징 -->
		<table class="table" style="width: 300px; margin: 0 auto;" >
			<tr>
			<c:if test="${currentPage > 1 }">
			<td><a href="/admin/noticeList?currentPage=1"> << </a></td>
			<td><a href="/admin/noticeList?currentPage=${currentPage-1 }"> < </a></td>
			</c:if>
			<c:if test="${currentPage == 1}">
			<td> << </td>
			<td> < </td>
			</c:if>
			
			<c:if test="${currentPage < lastPage }">
			<td><a href="/admin/noticeList?currentPage=${currentPage+1 }"> > </a></td>
			<td><a href="/admin/noticeList?currentPage=${lastPage}"> >> </a></td>
			</c:if>
			<c:if test="${currentPage == lastPage}">
			<td> > </td>
			<td> >> </td>
			</c:if>
			</tr>
		</table>
	
</div>
</body>
</html>