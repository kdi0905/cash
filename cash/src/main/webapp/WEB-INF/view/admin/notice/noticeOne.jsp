<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeOne</title>

<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="${pageContext.request.contextPath }/vendor/chart.js/Chart.min.js"></script>
<style >
textarea {width:300px;overflow:visible;}

textarea.autosize { min-height: 50px; }

</style>
</head>
<body id="page-top">
<div id="wrapper">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
			<div class="card shadow mb-4">
				<div class="card-header py-3  align-items-center justify-content-between text-center">
					<h5 class="m-0 font-weight-bold text-primary text-center ">공지사항 상세보기
						<a style="float: left;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" href="${pageContext.request.contextPath }/admin/noticeList/1">목록</a>
						<c:if test="${member.memberId==sessionId}">
						<a style="float: right;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"  href="${pageContext.request.contextPath }/admin/removeNotice/${notice.noticeId}">삭제</a>
						<a style="float: right; margin-right: 20px;"class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"  href="${pageContext.request.contextPath }/admin/modifyNotice/${notice.noticeId}">수정</a>
						</c:if>					
					</h5>
				</div>
				<div class="card-body">
					<div style="margin: auto;">
					
						<div class="col-lg-6 col-md-6" style="margin-left: 25%; ">
							<div class="form-group">
							
								<span style="font-size: 20px; margin-right: 30px;">공지 번호 </span>
								 <input type="text" class="form-control" value="${notice.noticeId}" readonly="readonly"> 
							</div>
								<div class="form-group">
							
								<span style="font-size: 20px; margin-right: 30px;">작성자 </span>
								 <input type="text" class="form-control" value="${member.memberName}" readonly="readonly"> 
							</div>
							<div class="form-group">
								<span style="font-size: 20px; margin-right: 30px;">공지 제목</span>
								 <input  type="text" class="form-control" value="${notice.noticeTitle }" readonly="readonly"> 
							</div>
							<div class="form-group">
								<span style="font-size: 20px; margin-right: 30px;">첨부파일</span>
								<c:forEach var="nf" items="${notice.noticefileList}">
									<c:if test="${nf.noticefileName!=null }">
										<div>
										<a class="form-control" style="margin-bottom: 5px;" href="${pageContext.request.contextPath }/noticeupload/${nf.noticefileName}" readonly="readonly" download="${nf.originalfileName}">${nf.originalfileName}</a>
										</div>
									</c:if>
								</c:forEach>
							</div>
							<div class="form-group">
								<span style="font-size: 20px; margin-right: 30px;">공지 내용</span>
								<textarea class="form-control" rows="6" readonly="readonly">${notice.noticeContent }</textarea>
							</div>
							<div class="form-group">
								<span style="font-size: 20px; margin-right: 30px;">공지 날짜</span>
								 <input  type="text" class="form-control" value="${notice.noticeDate}"	readonly="readonly"> 
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
			<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3  align-items-center justify-content-between">
						<h5 class="m-0 font-weight-bold text-primary text-center">댓글 </h5>
					</div>
					<div class="card-body">
						<div style="margin: auto;">
							<div class="col-lg-6 col-md-6" style="margin-left: 25%; ">
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
											<textarea onkeyup="xSize(this)"  style="resize: none;margin-bottom: 20px;word-break:break-all; min-height: 5px;" class="form-control autosize" id="comment${cm.commentId}"readonly="readonly" >${cm.commentContent}</textarea>
											
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6" style="margin-left: 25%; ">
							<div class="form-group">
								<hr class="tm-hr">
								<form id="addComment" method="get" action="${pageContext.request.contextPath}/admin/insertComment">
								<span style="font-size: 20px; margin-right: 30px;">댓글</span>
								<input type="hidden" name="noticeId" value="${notice.noticeId}">
								<textarea id="comment" class="form-control" rows="3" name="commentContent" ></textarea>
								<button class="text-secondary btn" style="float: right"  id="btn" type="button" >등록</button>
								</form>
							</div>
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
$("#btn").click(function(){
	if($("#commentContent").val()!=""){
		$("#addComment").submit();
	}
});

function xSize(e)
{
    e.style.height = '1px';
    e.style.height = (e.scrollHeight + 12) + 'px';
}
function xSize(e)
{
    var t;

    e.onfocus = function()
    {
        t = setInterval(
            function()
            {
                e.style.height = '1px';
                e.style.height = (e.scrollHeight + 12) + 'px';
            }, 100);
    }

    e.onblur = function()
    {
        clearInterval(t);
    }
}

xSize(document.getElementById('ta'));

</script>
</html>