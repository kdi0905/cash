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
	width: 1100px; 
	height : 100%; 
	background-color: #fafbfc;
}
thead{
	background-color:  #D5D5D5;
}
.tablebg{
	background-color: white;
}

</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<h1 style="text-align: center; margin-top: 30px;">공지사항 </h1>
		<div ><a class="btn btn-secondary" style="margin-bottom: 20px;float: right ;" href="${pageContext.request.contextPath }/admin/addNotice">추가</a></div>
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
				<td class="tablebg">${n.noticeId }</td>
				<td class="tablebg"><a class="text-dark"href="${pageContext.request.contextPath }/admin/noticeOne/${n.noticeId}">${n.noticeTitle }</a></td>
				<td class="tablebg">${n.noticeDate }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<!-- 페이징 -->
		<ul class="pagination justify-content-center">
		
			<c:if test="${currentPage == 1}">
				<li class="page-item disabled"><span class="page-link "> << </span> </li>
				<li class="page-item disabled"><span class="page-link "> < </span> </li>
			</c:if>
			<c:if test="${currentPage > 1 }">
				<li class="page-item"><a class="page-link text-secondary"  href="${pageContext.request.contextPath }/admin/noticeList/1"> << </a></li>
				<li class="page-item"><a class="page-link text-secondary"  href="${pageContext.request.contextPath }/admin/noticeList/${currentPage-1 }"> < </a></li>
			</c:if>
			
			<c:forEach var="i" begin="${showFirst}" end="${showLast}">
				<c:if test="${i <=lastPage }">
					<c:if test="${i == currentPage }">
						<li class="page-item active"><a class="page-link bg-secondary"  href="${pageContext.request.contextPath }/admin/noticeList/${i}">${i}</a></li>
					</c:if>
					<c:if test="${i !=currentPage}">
					<li class="page-item "><a class="page-link text-secondary"  href="${pageContext.request.contextPath }/admin/noticeList/${i}">${i}</a></li>
					</c:if>
				</c:if>
			</c:forEach>
			<c:if test="${currentPage < lastPage }">
				<li class="page-item"><a class="page-link text-secondary" href="${pageContext.request.contextPath }/admin/noticeList/${currentPage+1 }"> > </a></li>
				<li class="page-item"><a class="page-link text-secondary" href="${pageContext.request.contextPath }/admin/noticeList/${lastPage}"> >> </a></li>
			</c:if>
			<c:if test="${currentPage == lastPage}">
				<li class="page-item disabled"><span class="page-link  text-secondary"> > </span></li>
				<li class="page-item disabled"><span class="page-link  text-secondary"> >> </span></li>
			</c:if>
			
		</ul>
	

</body>
</html>