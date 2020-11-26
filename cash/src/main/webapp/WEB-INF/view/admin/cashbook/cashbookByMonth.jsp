<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>cashbookByMonth</title>

<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"	rel="stylesheet">
<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css"	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script	src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
<style>
.sunday {
	color: #FF0000;
}

.sumout {
	color: #FF0000;
}

.sumin {
	color: #47C83E;
}

th {
	width: ${100/7}%;
}
td {
	height: 90px;
	vertical-align: top;
}
</style>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="container-fluid"
				style="margin: auto; min-width: 1100px; max-width: 1100px;">
				<div class="card shadow mb-4">
					<div
						class="card-header py-3 align-items-center justify-content-between text-center">
						<h5 class="m-0 font-weight-bold text-primary">달력</h5>
					</div>

					<div class="card-body">
						<div style="margin: auto;">
						
							<table class="table table-bordered text-center"
								style="margin-top: 30px; width: 150px; font-size: 20px; float: left;">
								<tr>
									<td style="height: 30px" class="tdbg">이번달 수입</td>
								</tr>
								<tr>
									<td class="sumin">${sumIn}</td>
								</tr>
							</table>
							<table class="table table-bordered text-center"
								style="margin-top: 30px; width: 150px; font-size: 20px; float: right; ">
								<tr>
									<td style="height: 30px; " class="tdbg">이번달 지출</td>
								</tr>
								<tr>
									<td class="sumout">- ${sumOut}</td>
								</tr>
							</table>
							<div style="margin-top: 50px; text-align: center;">
								<h2>
									<div style="margin-bottom: 10px;">${currentYear}년</div>
									<a class="text-secondary"
										href="${pageContext.request.contextPath }/admin/cashbookByMonth/pre/${currentYear}/${currentMonth-1}">&nbsp;&nbsp;
										< &nbsp;&nbsp;</a> ${currentMonth} 월 <a class="text-secondary"
										href="${pageContext.request.contextPath }/admin/cashbookByMonth/next/${currentYear}/${currentMonth+1}">&nbsp;&nbsp;
										> &nbsp;&nbsp;</a>
								</h2>
							</div>
							<table class="table table-bordered text-center"
								style="margin: auto;">
								<thead>
									<tr>
										<th class="sunday text-center">일</th>
										<th class="text-center">월</th>
										<th class="text-center">화</th>
										<th class="text-center">수</th>
										<th class="text-center">목</th>
										<th class="text-center">금</th>
										<th class="text-center">토</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:forEach var="i" begin="1"
											end="${lastDay+(firstDayOfWeek-1)}" step="1">
											<c:if test="${i-(firstDayOfWeek-1) < 1}">
												<td>&nbsp;</td>
											</c:if>
											<c:if test="${i-(firstDayOfWeek-1) > 0}">
												<c:if test="${i%7 == 1}">
													<td>
														<div>
															<a class="sunday"
																href="${pageContext.request.contextPath }/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
																${i-(firstDayOfWeek-1)} </a>
														</div> <c:forEach var="c" items="${cashList}">
															<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
																<c:if test="${c.cashbookKind =='수입'}">
																	<div class="sumin">${c.cashbookPrice}</div>
																</c:if>
																<c:if test="${c.cashbookKind =='지출'}">
																	<div class="sumout">-${c.cashbookPrice}</div>
																</c:if>
															</c:if>
														</c:forEach>

													</td>
												</c:if>
												<c:if test="${i%7 !=1 }">
													<td>
														<!-- <a class="text-dark" href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}"> -->
														<a class="text-dark"
														href="${pageContext.request.contextPath }/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
															${i-(firstDayOfWeek-1)} </a> <!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->

														<c:forEach var="c" items="${cashList}">
															<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
																<c:if test="${c.cashbookKind =='수입'}">
																	<div class="sumin">${c.cashbookPrice}</div>
																</c:if>
																<c:if test="${c.cashbookKind =='지출'}">
																	<div class="sumout">-${c.cashbookPrice}</div>
																</c:if>
															</c:if>
														</c:forEach>
													</td>
												</c:if>
											</c:if>
											<c:if test="${i%7 == 0}">
												</tr>
												<tr>
											</c:if>
										</c:forEach>
										<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
											<c:forEach begin="1"
												end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
												<td>&nbsp;</td>
											</c:forEach>
										</c:if>
									</tr>
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