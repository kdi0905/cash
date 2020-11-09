<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
.menubg {
	background-color: #EAEAEA;
	height: 60px;
}
</style>
	<div class="menubg text-center"  >
	
		<a class="btn text-secondary" href="/admin/index" style="font-size: 30px; float: left;">CASHBOOK</a>
	
		<a class="btn text-secondary" style="margin-top: 10px;"  href="/admin/index">홈</a>	
		<a class="btn text-secondary" style="margin-top: 10px;"  href="/admin/noticeList/1">공지사항</a>
		<a class="btn text-secondary" style="margin-top: 10px;"  href="/admin/cashbookByMonth/now/-1/-1">가계부</a>
		<a class="btn text-secondary" style="margin-top: 10px;"  href="http://localhost:8080/cashStats.html">통계</a>
		<a style="float: right; margin-top: 10px;" class="btn text-info" href="/admin/logout">로그아웃</a>			
	</div>

