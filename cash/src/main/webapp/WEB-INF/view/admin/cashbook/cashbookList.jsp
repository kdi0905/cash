<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
		margin: auto;
	width: 1100px; 
	height : 100%; 
	background-color: #fafbfc;
}
table{
	text-align: center;
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
	<h1>cashbookList</h1>
	<a href="/admin/cashbookListExcel">전체 cashbookList를 Excel파일로 다운</a>
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>cashbook_id</th>
				<th>cashbook_kind</th>
				<th>category_name</th>
				<th>cashbook_price</th>
				<th>cashbook_content</th>
				<th>cashbook_date</th>
				<th>create_date</th>
				<th>update_date</th>				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${cashbookList }">
				<tr>
					<td>${c.cashbookId}</td>
					<td>${c.cashbookKind}</td>
					<td>${c.categoryName}</td>
					<td>${c.cashbookPrice}</td>
					<td>${c.cashbookContent}</td>
					<td>${c.cashbookDate}</td>
					<td>${c.createDate}</td>
					<td>${c.updateDate}</td>
				</tr>	
			</c:forEach>
		</tbody>
	</table>
	
	<ul class="pagination justify-content-center">
	
	<c:if test="${currentPage==1}">
		<li class="page-item disabled"><span class="page-link "> << </span> </li>
		<li class="page-item disabled"><span class="page-link "> < </span> </li>
	</c:if>
	<c:if test="${currentPage>1}">
		<li class="page-item">	<a class="page-link text-secondary" href="/admin/cashbookList/1"> << </a> </li>
		<li class="page-item">	<a class="page-link text-secondary" href="/admin/cashbookList/${currentPage-1}"> < </a> </li>
	</c:if>
	<c:forEach var="s" begin="${firstShow}" end="${lastShow}">
		<c:if test="${s<=lastPage}">
			<c:if test ="${s==currentPage }">
			<li class="page-item active  "><a class="page-link bg-secondary" href="/admin/cashbookList/${s}">${s}</a></li>
			</c:if>
			<c:if test ="${s!=currentPage }">
			<li class="page-item "><a class="page-link text-secondary" href="/admin/cashbookList/${s}">${s}</a></li>
			</c:if>
		</c:if>
	</c:forEach>
	<c:if test="${currentPage<lastPage}">
		<li class="page-item"><a class="page-link text-secondary" href="/admin/cashbookList/${currentPage+1}"> > </a></li>
		<li class="page-item"><a class="page-link text-secondary" href="/admin/cashbookList/${lastPage}"> >> </a></li>
	</c:if>
	<c:if test="${currentPage==lastPage}">
		<li class="page-item disabled"><span class="page-link  text-secondary"> > </span></li>
		<li class="page-item disabled"><span class="page-link  text-secondary"> >> </span></li>
	</c:if>
	</ul>
</body>
</html>