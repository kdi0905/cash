<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>
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
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-1">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-2">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-3">
			</div>
			<div class=" tm-welcome-content">
				<h2 class="white-text tm-handwriting-font tm-welcome-header">
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">&nbsp;Notice&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">공 지 사 항 수정</h2>
				<a href="#notice" class="tm-more-button tm-more-button-welcome">modifyNotice</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 공지사항 수정 게시판입니다. <br> 공지사항을 수정 할 수 있습니다.
				</p>
			</div>
			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="notice">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							공지사항 수정</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div class="col-lg-4 col-md-4">
						<div class="container">
							<div class="row">
								<div class="col-lg-6 col-md-6" style="margin-left: 20%; margin-top: 20px">
								<form id="updateNoticeForm" method="post" action="${pageContext.request.contextPath }/admin/modifyNotice/${notice.noticeId}">
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px; ">notice_id</span>
										<input id="noticeTitle" type="text" class="form-control" name="noticeTitle" value="${notice.noticeId}" readonly="readonly">
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">notice_title</span>
										<input id="noticeTitle" type="text" class="form-control" name="noticeTitle" value="${notice.noticeTitle }">
										<span class="text-danger" style="margin-left: 10px; font-size: 10px"id="noticeTitleCheck"></span>
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">notice_content</span>
										<textarea id="noticeContent" class="form-control" rows="6" name="noticeContent">${notice.noticeContent }</textarea>
										<span class="text-danger" style="margin-left: 10px; font-size: 10px" id="noticeContentCheck"></span>
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">notice_date</span>
										<input id="noticeTitle" type="text" class="form-control"name="noticeDate" value="${notice.noticeDate}" readonly="readonly">
									</div>
									<button id="btn" class="tm-more-button margin-top-30" style="float: right;"type="button">수정</button>
									</form>
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
	$("#btn").click(function() {

		if ($("#noticeTitle").val() == "") {
			$("#noticeTitleCheck").html("공지 제목을 입력해주세요.");
		} else {
			$("#noticeTitleCheck").html("");
		}

		if ($("#noticeContent").val() == "") {
			$("#noticeContentCheck").html("공지 내용을 입력하세요");
		} else {
			$("#noticeContentCheck").html("");
		}

		if ($("#noticeTitle").val() != "" && $("#noticeContent").val() != "") {
			$("#updateNoticeForm").submit();
		}
	});
</script>
</html>