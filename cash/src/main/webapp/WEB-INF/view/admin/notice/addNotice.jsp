<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addNotice</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script
	src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
	src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script
	src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3  align-items-center justify-content-between  text-center">
						<h5 class="m-0 font-weight-bold text-primary">공지사항 추가
						<a style="float: left;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/noticeList/1">목록</a>
						</h5>
					</div>
					<div class="card-body">
						<div style="margin: auto;">
							<form id="addNoticeForm" method="post"
								enctype="multipart/form-data" class="tm-contact-form"
								action="${pageContext.request.contextPath }/admin/addNotice">
								<div class="col-lg-6 col-md-6" style="margin-left: 25%;">

									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지사항
											제목 </span> <input id="noticeTitle" type="text" class="form-control"
											placeholder="공지 제목을 입력하세요" name="noticeTitle"> <span
											class="text-danger"
											style="margin-left: 10px; font-size: 15px"
											id="noticeTitleCheck"></span>
									</div>

									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">첨부파일</span>
										<span><button class="btn btn-link green-text"
												type="button" id="addBtn">파일 추가</button></span> <span><button
												class="btn btn-link text-danger" type="button" id="delBtn">파일
												삭제</button></span>
										<div id="fileinput" style="min-height: 50px;"></div>
										<div id="fileCheck" class="text-danger"></div>
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">공지사항
											내용 </span>

										<textarea id="noticeContent" class="form-control" rows="6"
											placeholder="공지 내용을 입력하세요" name="noticeContent"></textarea>
										<span class="text-danger"
											style="margin-left: 10px; font-size: 15px;"
											id="noticeContentCheck"></span>
									</div>
									<button id="btn" style="float: right;"
										class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
										type="button">추가</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
				<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
		</div>
	</div>
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