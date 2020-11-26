<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="${pageContext.request.contextPath }/admin/index">
	<span >CASHBOOK </span>
	</a>

<hr class="sidebar-divider my-0">

	<li class="nav-item active " >
	    <a class="nav-link " href="${pageContext.request.contextPath }/admin/index">
	<span style="font-size: 25px;">Index</span></a>
	</li>

<hr class="sidebar-divider">

	<li class="nav-item">
	    <a class="nav-link collapsed" href="${pageContext.request.contextPath }/admin/noticeList/1"" data-toggle="collapse" data-target="#collapseTwo"
	        aria-expanded="true" aria-controls="collapseTwo">
	          <i class="fas fa-fw fa-chart-area"></i>
	        <span>통계</span>
	    </a>
	    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	        <div class="bg-white py-2 collapse-inner rounded">
	            <h3 class="collapse-header">통계차트</h3>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/totalOfMonthInByYear.jsp">년도별 월 수입</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/totalOfMonthOutByYear.jsp">년도별 월 지출</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/totalOutAndInByYear.jsp">년도별 수입/지출</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/categoryInByYear.jsp">년도별 카테고리 수입</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/categoryOutByYear.jsp">년도별 카테고리 지출</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/monthOfCategoryInByYear.jsp">월 카테고리 수입</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/monthOfCategoryOutByYear.jsp">월 카테고리 지출</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/beetweenCategoryInByDate.jsp">날짜 별 카테고리 수입</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/beetweenCategoryOutByDate.jsp">날짜 별 카테고리 지출</a>
	            <a class="collapse-item" href="${pageContext.request.contextPath }/admin/chart/monthOfInAndOutByYear.jsp">월 총 금액</a>
	        </div>
	    </div>
	</li>

<hr class="sidebar-divider">

	<li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/noticeList/1">
      <i class="fas fa-fw fa-folder"></i>
        <span>공지사항</span></a>
	</li>

	<li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">
               <i class="fas fa-fw fa-folder"></i>
                <span>가계부</span></a>
        </li>

	<li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/cashbookList/1">
       <i class="fas fa-fw fa-folder"></i>
        <span>가계부리스트</span></a>
	</li>

 	<li class="nav-item">
    <a class="nav-link" href="${pageContext.request.contextPath }/admin/logout">
           <i class="fas fa-fw fa-cog"></i>
            <span>로그아웃</span></a>
    </li>
   
</ul>
 
	
	


