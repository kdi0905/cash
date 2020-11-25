<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbook List</title>
<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/templatemo-script.js"></script>
<!-- Templatemo Script -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/templatemo-style.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" type="image/x-icon" />
<style>
thead {
	background-color: #c79c60;
}

tbody {
	background-color: white;
}
</style>


</head>
<body id="landing">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- Preloader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Preloader -->
	<section class="tm-welcome-section">
		<div class="container tm-position-relative">
			<div class="tm-lights-container">
				<img src="${pageContext.request.contextPath }/img/light.png"
					alt="Light" class="light light-1"> <img
					src="${pageContext.request.contextPath }/img/light.png" alt="Light"
					class="light light-2"> <img
					src="${pageContext.request.contextPath }/img/light.png" alt="Light"
					class="light light-3">
			</div>
			<div class=" tm-welcome-content">
				<h2 class="white-text tm-handwriting-font tm-welcome-header">
					<img src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">&nbsp;cashbook List&nbsp;&nbsp;<img
						src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">가계부 리스트</h2>
				<a href="#cashbookList" class="tm-more-button tm-more-button-welcome">cashbook List</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 가계부 리스트 게시판입니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png"
				alt="Table Set" class="tm-table-set img-responsive">

		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="#cashbookList">
		<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							가계부 리스트</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div style="margin-top: 20px;" >
						<div class="row" style="margin-bottom: 30px;">
							<a style="margin-left: 5%;" class="tm-more-button" href="${pageContext.request.contextPath }/admin/cashbookListExcel">Excel파일 다운</a>
						</div>
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
					</div>
				</div>
			</section>
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
			<a href="#" class="tm-more-button margin-top-30" style="margin-bottom: 30px;">Read More</a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>

</body>
</html>