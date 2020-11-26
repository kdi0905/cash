<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbook List</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script	src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3 align-items-center justify-content-between text-center">
						<h5 class="m-0 font-weight-bold text-primary">가계부 리스트
							<a style="float: right;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/cashbookListExcel">
							<i class="fas fa-download fa-sm text-white-50"></i> Excel파일 다운</a>
						</h5>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div style="margin: auto;">
						<table class="table table-bordered table-hover"
							style="text-align: center; margin:auto; width: 70%; font-size: 13px;">
							<thead>
								<tr>
									<th class="text-center">cashbook_id</th>
									<th class="text-center">cashbook_kind</th>
									<th class="text-center">category_name</th>
									<th class="text-center">cashbook_price</th>
									<th class="text-center">cashbook_content</th>
									<th class="text-center">cashbook_date</th>
									<th class="text-center">create_date</th>
									<th class="text-center">update_date</th>		
								</tr>
							</thead>
							<tbody>
								<c:forEach var="c" items="${cashbookList }">
									<tr >
										<td >${c.cashbookId}</td>
										<td>${c.cashbookKind}</td>
										<td>${c.categoryName}</td>
										<td>${c.cashbookPrice}</td>
										<td>${c.cashbookContent}</td>
										<td>${c.cashbookDate}</td>
										<td style="font-size: 12px;">${c.createDate}</td>
										<td style="font-size: 12px;">${c.updateDate}</td>
									</tr>	
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
				</div>
				<!-- 페이징 -->
				<ul class="pagination justify-content-center" style=" margin-bottom: 40px;">
	
					<c:if test="${currentPage == 1}">
						<li class="page-item disabled"><span class="page-link ">
								<< </span></li>
						<li class="page-item disabled"><span class="page-link ">
								< </span></li>
					</c:if>
					<c:if test="${currentPage > 1 }">
						<li class="page-item"><a class="page-link text-secondary"
							href="${pageContext.request.contextPath }/admin/cashbookList/1">
								<< </a></li>
						<li class="page-item"><a class="page-link text-secondary"
							href="${pageContext.request.contextPath }/admin/cashbookList/${currentPage-1} }">
								< </a></li>
					</c:if>
	
					<c:forEach var="i" begin="${firstShow}" end="${lastShow}">
						<c:if test="${i <=lastPage }">
							<c:if test="${i == currentPage }">
								<li class="page-item active"><a
									class="page-link bg-secondary"
									href="${pageContext.request.contextPath }/admin/cashbookList/${i}">${i}</a></li>
							</c:if>
							<c:if test="${i !=currentPage}">
								<li class="page-item "><a class="page-link text-secondary"
									href="${pageContext.request.contextPath }/admin/cashbookList/${i}">${i}</a></li>
							</c:if>
						</c:if>
					</c:forEach>
					<c:if test="${currentPage < lastPage }">
						<li class="page-item"><a class="page-link text-secondary"
							href="${pageContext.request.contextPath }/admin/cashbookList/${currentPage+1 }">
								> </a></li>
						<li class="page-item"><a class="page-link text-secondary"
							href="${pageContext.request.contextPath }/admin/cashbookList/${lastPage}">
								>> </a></li>
					</c:if>
					<c:if test="${currentPage == lastPage}">
						<li class="page-item disabled"><span
							class="page-link  text-secondary"> > </span></li>
						<li class="page-item disabled"><span
							class="page-link  text-secondary"> >> </span></li>
					</c:if>
				</ul>
			</div>
			<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>