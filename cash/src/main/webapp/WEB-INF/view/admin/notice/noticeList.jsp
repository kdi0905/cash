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
		margin: auto;
	width: 1300px; 
	height : 100%; 
}

</style>
</head>
<body>
	<div style="margin-left: 10%; margin-right:10%;">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 style="text-align: center; margin-top: 30px;">공지사항 </h1>
		<div ><a class="btn btn-secondary" style="margin-bottom: 20px;float: right ;" href="/admin/addNotice">추가</a></div>
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
				<td><a class="text-dark"href="/admin/noticeOne/${n.noticeId}">${n.noticeTitle }</a></td>
				<td>${n.noticeDate }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<!-- 페이징 -->
		<table class="table" style="width:60%; margin: 0 auto; margin-top: 20px" >
			<tr>
			<c:if test="${currentPage > 1 }">
			<td><a class ="btn btn-outline-light text-dark"" href="/admin/noticeList/1"> << </a></td>
			<td><a class ="btn btn-outline-light text-dark"" href="/admin/noticeList/${currentPage-1 }"> < </a></td>
			</c:if>
			<c:if test="${currentPage == 1}">
			<td class="text-secondary"> << </td>
			<td class="text-secondary"> < </td>
			</c:if>
			<c:forEach var="i" begin="${showfirst}" end="${showLast}">
				<c:if test="${i+1 <=lastPage }">
					<c:if test="${i+1 == currentPage }">
						<td class="text-secondary">${i+1}</td>
					</c:if>
					<c:if test="${i+1 !=currentPage}">
						<td><a class ="btn btn-outline-light text-dark"" href="/admin/noticeList/${i+1}">${i+1}</a></td>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${currentPage < lastPage }">
			<td><a class ="btn btn-outline-light text-dark"" href="/admin/noticeList/${currentPage+1 }"> > </a></td>
			<td><a class ="btn btn-outline-light text-dark"" href="/admin/noticeList/${lastPage}"> >> </a></td>
			</c:if>
			<c:if test="${currentPage == lastPage}">
			<td class="text-secondary" style=""> > </td>
			<td class="text-secondary"> >> </td>
			</c:if>
			</tr>
		</table>
	
</div>
</body>
</html>