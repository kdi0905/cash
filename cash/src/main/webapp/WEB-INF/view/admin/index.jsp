<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>index</title>

<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>

</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">

			<div class="container-fluid" style=" margin: auto; min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					
					<div class="card-header py-3  align-items-center justify-content-between text-center">
						<h5 class="m-0 font-weight-bold text-primary ">수입/지출</h5>
					</div>
					<div class="d-sm-flex align-items-center justify-content-between mb-4">
					</div>

					<div class="row">
						<!-- Earnings (Monthly) Card Example -->
						<c:forEach var="io" items="${inOutList}">
							<div class="col-xl-3 col-md-6 mb-4"
								style="margin: auto; ">
								<div class="card border-left-success shadow h-100 py-2"
									style="width: 250px;">
									<div class="card-body">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-xs font-weight-bold text-primary text-uppercase mb-1 text-center"
													style="font-size: 20px;">${io["날짜"]}</div>
												<div class="h5 mb-0 font-weight-bold text-success">수입
													: ${io["수입"]}</div>
												<div class="h5 mb-0 font-weight-bold text-danger">지출 :
													- ${io["지출"]}</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">합계
													: ${io["합계"]}</div>
											</div>
											<div class="col-auto">
												<i class="fas fa-calendar fa-2x text-gray-300"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
						<div
							class="card-header py-3 align-items-center justify-content-between text-center">
							<h5 class="m-0 font-weight-bold text-primary ">공지사항</h5>
						</div>
						<!-- Card Body -->
						<div class="card-body">
							<div style="margin: auto;">
								<table class="table table-bordered "
									style="margin-top: 20px; text-align: center;">
									<thead>
										<tr>
											<th class="text-center ">공지 번호</th>
											<th class="text-center">공지 제목</th>
											<th class="text-center">작성자</th>
											<th class="text-center">공지 날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="n" items="${noticeList}">
											<tr>
												<td>${n.noticeId }</td>
												<td>${n.noticeTitle }</td>
												<td>${n.memberName}</td>
												<td>${n.noticeDate }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>