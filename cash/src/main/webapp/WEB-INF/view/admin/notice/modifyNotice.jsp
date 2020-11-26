<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modifyNotice</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">
<link	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css"
	rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script	src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script	src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script	src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">
<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3  align-items-center justify-content-between  text-center">
						<h5  class="m-0 font-weight-bold text-primary">공지사항 수정
						<a style="float: left;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/noticeList/1">목록</a>
						</h5>
					</div>
					<div class="card-body">
						<div style="margin: auto;">
						<div class="col-lg-6 col-md-6" style="margin-left: 25%; ">
							<form id="updateNoticeForm" enctype="multipart/form-data" method="post" action="${pageContext.request.contextPath }/admin/modifyNotice">
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px; ">notice_id</span>
										<input id="noticeTitle" type="text" class="form-control" name="noticeId" value="${notice.noticeId}" readonly="readonly">
									</div>
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">notice_title</span>
										<input id="noticeTitle" type="text" class="form-control" name="noticeTitle" value="${notice.noticeTitle }">
										<span class="text-danger" style="margin-left: 10px; font-size: 10px"id="noticeTitleCheck"></span>
									</div>
									
									<div class="form-group">
										<span style="font-size: 20px; margin-right: 30px;">첨부파일</span>
										<c:forEach var="nf" items="${notice.noticefileList}">
											<c:if test="${nf.noticefileName!=null}">
												<div>
													<span class="form-control" style="width: 70%;"readonly="readonly">${nf.originalfileName}
													 	<a class="text-danger" style="float: right" href="${pageContext.request.contextPath}/admin/deletefile/${notice.noticeId}/${nf.noticefileId}">X</a>
													</span>
												</div>
											</c:if>
										</c:forEach>
										<span><button class="btn btn-link green-text" type="button" id="addBtn">파일 추가</button></span>
										<span><button class="btn btn-link text-danger" type="button" id="delBtn">파일 삭제</button></span>
										<div id="fileinput">
											
										</div>
										<div id="fileCheck" class="text-danger" >
										</div>
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
									<button id="btn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="float: right;"type="button">수정</button>
									</form>
									</div>
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
	let html=`<div style="margin-bottom: 10px; height:40px; " class="form-control"  >
			 	 <input  type="file" class="noticefile"  name="noticefile"  required>
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
				$("#updateNoticeForm").submit();
			}
		}
		
	});
</script>
</html>