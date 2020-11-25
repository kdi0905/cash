<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>
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
						alt="Line" class="tm-header-line">&nbsp;Notice&nbsp;&nbsp;<img
						src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">
					공 지 사 항 <br>상 세 보 기
				</h2>
				<a href="#notice" class="tm-more-button tm-more-button-welcome">noticeOne</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 공지사항 상세보기입니다. <br> 하나의 공지사항을 상세히 볼 수 있습니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png"
				alt="Table Set" class="tm-table-set img-responsive">

		</div>
	</section>

	<div class="tm-main-section light-gray-bg">
		<div class="container" id="notice">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h3 class="tm-section-header gold-text tm-handwriting-font">
							공지사항 상세보기</h3>

						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div class="col-lg-4 col-md-4">
						<div class="container">
							<div class="row">
								<a class="tm-more-button tm-more-button-welcome"
									style="margin-bottom: 20px;"
									href="${pageContext.request.contextPath }/admin/noticeList/1">목록</a>


								<a class="tm-more-button tm-more-button-welcome"
									style="margin-bottom: 20px"
									href="${pageContext.request.contextPath }/admin/modifyNotice/${notice.noticeId}">수정</a>
								<a class="tm-more-button tm-more-button-welcome"
									style="margin-bottom: 20px"
									href="${pageContext.request.contextPath }/admin/removeNotice/${notice.noticeId}">삭제</a>
								
								<div class="col-lg-6 col-md-6" style="margin-left: 20%;">
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지 번호 </span>
										 <input id="noticeTitle" type="text" class="form-control"
										  name="noticeTitle" value="${notice.noticeId}"
											readonly="readonly"> 
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지 제목</span>
										 <input id="noticeTitle" type="text" class="form-control"
											name="noticeTitle" value="${notice.noticeTitle }"
											readonly="readonly"> 
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">첨부파일</span>
										<c:forEach var="nf" items="${notice.noticefileList}">
											<c:if test="${nf.noticefileName!=null }">
												<div>
												<a class="form-control" style="margin-bottom: 5px;" href="${pageContext.request.contextPath }/noticeupload/${nf.noticefileName}" readonly="readonly" download>${nf.originalfileName}</a>
												</div>
											</c:if>
										</c:forEach>
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지 내용</span>
										<textarea id="noticeContent" class="form-control" rows="6"
											 name="noticeContent" readonly="readonly">${notice.noticeContent }</textarea>
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지 날짜</span>
										 <input id="noticeTitle" type="text" class="form-control"
											name="noticeDate" value="${notice.noticeDate}"
											readonly="readonly"> 
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h3 class="tm-section-header gold-text tm-handwriting-font" style="width: 100px;">댓글</h3>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div class="col-lg-4 col-md-4">
						<div class="container">
							<div class="row">
							
								<div class="col-lg-6 col-md-6" style="margin-left: 20%;">
									<div class="form-group">
										<div id="comment">
											<c:forEach var="cm" items="${commentList}">
												<span style="font-size: 15px;">${cm.memberName}</span>
												<span>
													<c:if test="${cm.second<60}">
														<span class="text-secondary" style="font-size: 12px;" >${cm.second}초 전</span>
													</c:if>
													<c:if test="${cm.minute>0 and cm.minute<60}">
														<span class="text-secondary" style="font-size: 12px;">${cm.minute}분 전</span>
													</c:if>
													<c:if test="${cm.hour>0 and cm.hour<24}">
														<span class="text-secondary" style="font-size: 12px;">${cm.hour}시간 전</span>
													</c:if>
													<c:if test="${cm.day>0 and cm.day<7}">
														<span class="text-secondary" style="font-size: 12px;">${cm.day}일 전</span>
													</c:if>
													<c:if test="${cm.week>0 and cm.week<4}">
														<span class="text-secondary" style="font-size: 12px;">${cm.week}주 전</span>
													</c:if>
													<c:if test="${cm.month>0 and cm.month<12}">
														<span class="text-secondary" style="font-size: 12px;">${cm.month}개월 전</span>
													</c:if>
													<c:if test="${cm.year>0}">
														<span class="text-secondary" style="font-size: 12px;">${cm.year}년 전</span>
													</c:if>
												</span>
												<c:if test="${cm.memberId==sessionId}">
													<span style="float: right;">
														<a class="btn text-danger" href="${pageContext.request.contextPath }/admin/deleteComment/${cm.noticeId}/${cm.commentId}">삭제</a>
													</span>
												</c:if>
												<input style="margin-bottom: 20px;" class="form-control" id="comment${cm.commentId}"readonly="readonly" value="${cm.commentContent}">
											</c:forEach>
										</div>
									</div>
									<div class="form-group">
										<hr class="tm-hr">
										<form id="addComment" method="get" action="${pageContext.request.contextPath}/admin/insertComment">
										<span style="font-size: 20px; margin-right: 30px;">댓글</span>
										<input type="hidden" name="noticeId" value="${notice.noticeId}">
										<input type="hidden" name="memberId" value="${notice.memberId}">
										<textarea id="comment" class="form-control" rows="3" name="commentContent" ></textarea>
										<button class="text-secondary btn" style="float: right"  id="btn" type="button" >등록</button>
										</form>
									</div>
								</div>
							</div>
							<a href="#" class="tm-more-button margin-top-30">Read More</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
</body>
<script>
$("#btn").click(function(){
	if($("#commentContent").val()!=""){
		$("#addComment").submit();
	}
});



</script>
</html>