<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>
<!-- JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/templatemo-script.js"></script>
<!-- Templatemo Script -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Damion'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/templatemo-style.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/favicon.ico"
	type="image/x-icon" />
<style>
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
						alt="Line" class="tm-header-line">&nbsp;Notice&nbsp;&nbsp;<img
						src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">공 지 사 항 추 가</h2>
				<a href="#add" class="tm-more-button tm-more-button-welcome">addNotice</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 공지사항을 추가 할 수 있습니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png"
				alt="Table Set" class="tm-table-set img-responsive">

		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="add">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							공지사항 추가</h2>

						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container " style="margin-left: 25%">

					<div class="container ">

						<form id="addNoticeForm" method="post" enctype="multipart/form-data" class="tm-contact-form"
							action="${pageContext.request.contextPath }/admin/addNotice">
							
							<div class="col-lg-6 col-md-6">
							
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">공지사항 제목 </span>
									<input id="noticeTitle" type="text" class="form-control"
										placeholder="공지 제목을 입력하세요" name="noticeTitle"> <span
										class="text-danger" style="margin-left: 10px; font-size: 15px"
										id="noticeTitleCheck"></span>
								</div>
							
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">첨부파일</span>
									<span><button class="btn btn-link green-text" type="button" id="addBtn">파일 추가</button></span>
									<span><button class="btn btn-link text-danger" type="button" id="delBtn" >파일 삭제</button></span>
									<div id="fileinput">
										
									</div>
									<div id="fileCheck" class="text-danger" >
									</div>
								</div>
								<div class="form-group" >
									<span style="font-size: 20px; margin-right: 30px;">공지사항 내용 </span>

									<textarea id="noticeContent" class="form-control" rows="6"
										placeholder="공지 내용을 입력하세요" name="noticeContent"></textarea>
									<span class="text-danger"
										style="margin-left: 10px; font-size: 15px;"
										id="noticeContentCheck"></span>
								</div>
								<button id="btn" class="tm-more-button "type="button">추가</button>
							</div>
						</form>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>

	<input type="file" >
</body>

<script>
	$('#addBtn').click(function(){
		let html=`<div style="margin-bottom: 10px; "  >
				 	 <input type="file"style="height:40px;" class="form-control noticefile"  name="noticefile" required>
				  </div>
				  `;
		$('#fileinput').append(html);
	});
	$('#delBtn').click(function(){
		$('#fileinput').children().last().remove();
	});
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
		
		let ck = true;
		$('.noticefile').each(function(index, item){
			console.log($(item).val());
			if($(item).val() == '') {
				ck = false;
			}
		})
		if(ck == false) { // if(ck)
			$('#fileCheck').html('선택하지 않은 파일이 있습니다');
		} else {
			if ($("#noticeTitle").val() != "" && $("#noticeContent").val() != "") {
				$("#addNoticeForm").submit();
			}
		}
	
	});
	
</script>
</html>