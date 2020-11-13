<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.menubg {
	background-color: #D5D5D5;
	height: 60px;
}
</style>

	<nav class="navbar navbar-expand-sm menubg">
		<ul  class="navbar-nav">
		<li class="nav-item">
			<a class=" text-secondary nav-link" href="${pageContext.request.contextPath }/admin/index" style="font-size: 30px; float: left;">CASHBOOK</a>
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;"  href="${pageContext.request.contextPath }/admin/index">홈</a>	
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;"  href="${pageContext.request.contextPath }/admin/noticeList/1">공지사항</a>
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;"  href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">가계부</a>
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;"  href="${pageContext.request.contextPath }/admin/cashbookList/1">가계부리스트</a>
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;" href="${pageContext.request.contextPath }/admin/chartStrart.jsp">통계</a>
		</li>
		<li class="nav-item">
			<a class=" text-secondary nav-link" style="margin-top: 10px;" href="${pageContext.request.contextPath }/admin/addMember">사용자추가</a>
		</li>
		
		
		
		
		<li class="nav-item ">
			<a style="float: right; margin-top: 10px;" class=" text-info nav-link" href="/admin/logout">로그아웃</a>				
		</li>
		</ul>
	</nav>

