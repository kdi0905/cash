<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookByDay</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
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
			<div class="container-fluid"
				style="margin: auto; min-width: 1100px; max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3  align-items-center justify-content-between text-center" >
						<h5  class="m-0 font-weight-bold text-primary">일 별 가계부
						<a style="float:left;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">달력</a>
						<a style="float: right;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">추가</a>
						</h5>
					</div>

					<div class="card-body">
						<div style="margin: auto;">

							<div style="margin-top: 10px; text-align: center;">
								<h2 style="margin-top: 30px;">
									<div style="text-align: center; margin-bottom: 10px;">${currentYear}년 ${currentMonth}월</div>
									<div style="text-align: center;">
										<a class="text-dark" href="${pageContext.request.contextPath }/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">
										&nbsp;&nbsp;< &nbsp;&nbsp;</a> ${currentDay}일
										<a class="text-dark" href="${pageContext.request.contextPath }/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">
										&nbsp;&nbsp; > &nbsp;&nbsp;</a>
									</div>
								</h2>
							</div>
							<table class="table "
								style="margin-top: 30px; text-align: center;">
								<thead>
									<tr>
										<th>cashbookId</th>
										<th>cashbookKind</th>
										<th>categoryName</th>
										<th>cashbookPrice</th>
										<th>cashbookContent</th>
										<th>수정</th>
										<th>삭제</th>
									</tr>

								</thead>
								<tbody>
									<c:forEach var="c" items="${cashbookList}">
										<tr>

											<td>${c.cashbookId }</td>
											<td>${c.cashbookKind }</td>
											<td>${c.categoryName }</td>
											<c:if test="${c.cashbookKind=='지출' }">
												<td class="text-danger">- ${c.cashbookPrice }</td>
											</c:if>
											<c:if test="${c.cashbookKind=='수입' }">
												<td class=" text-success">${c.cashbookPrice }</td>
											</c:if>
											<td>${c.cashbookContent }</td>

											<td><a class="text-secondary"
												href="${pageContext.request.contextPath }/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
											<td><a class="text-danger"
												href="${pageContext.request.contextPath }/admin/deleteCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">삭제</a></td>
										</tr>
									</c:forEach>
								</tbody>

							</table>

						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>