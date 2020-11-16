<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<div class="tm-top-header">

			<div class="row">
				<div class="tm-top-header-inner">
					<div class="tm-logo-container">

						<h1 class="tm-site-name tm-handwriting-font">
							<a class="tm-site-name tm-handwriting-font"
								href="${pageContext.request.contextPath }/admin/index">CASHBOOK</a>
						</h1>
					</div>
					<div class="mobile-menu-icon">
						<i class="fa fa-bars"></i>
					</div>
					<nav class="tm-nav">
						<ul>
							<li><a href="${pageContext.request.contextPath }/admin/index">홈</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/noticeList/1">공지사항</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">가계부</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/cashbookList/1">가계부리스트</a></li>
							<li><a href="${pageContext.request.contextPath }/admin/chart/chartStart.jsp">통계</a> </li>
							<li><a href="${pageContext.request.contextPath }/admin/logout" >로그아웃</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>

	
	
	


