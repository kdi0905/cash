<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
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

<body id="page-top">
	<div id="wrapper">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div id="content-wrapper" class="d-flex flex-column">
			<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
				<div class="card shadow mb-4">
					<div class="card-header py-3  align-items-center justify-content-between  text-center">
						<h5 class="m-0 font-weight-bold text-primary">가계부추가
						<a style="float: left;" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"
								href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">달력</a>
						</h5>
					</div>
					<div class="card-body">
						<div style="margin: auto;">
							<form id="addCashbookForm" method="post" class="tm-contact-form" action="${pageContext.request.contextPath }/admin/addCashbook/${currentYear }/${currentMonth}/${currentDay}">
							<div class="col-lg-6 col-md-6 "style="margin-left: 25%;">
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">cashbook_date</span>
									<input id="cashbookDate" type="text" class="form-control" name="cashbookDate" value ="${currentYear}-${currentMonth}-${currentDay}" readonly="readonly"> 
								</div>
								
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">cashbook_kind</span>
									<select class="form-control" id="cashbookKind" name="cashbookKind">
										<option value="no">==선택==</option>
										<option value="수입">수입</option>
										<option value="지출">지출</option>
									</select>
									<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookKindCheck"></span>
								</div>
								
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">category_name</span>
									<select class="form-control" id="categoryName" name="categoryName">
										<option value="no">==선택==</option>
									<c:forEach var="c" items="${categoryList}">
										<option value="${c.categoryName}">${c.categoryName}</option>
									</c:forEach>
									</select>
									<span class="text-danger" style="margin-left:10px; font-size: 10px"id="categoryNameCheck"></span>
								</div>
								
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">cashbook_price</span>
									<input class="form-control" type="text" id ="cashbookPrice" name="cashbookPrice" placeholder="가격을 입력하세요">
									<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookPriceCheck"></span>
								</div>
								
								<div class="form-group">
									<span style="font-size: 20px; margin-right: 30px;">cashbook_content</span>
									<textarea id="cashbookContent"name="cashbookContent" class="form-control" placeholder="내용을 입력하세요" ></textarea>
									<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookContentCheck"></span>
								</div>
								<button style="float: right;" id="btn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"type="button">추가</button>
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
	$("#btn").click(function(){
		
		if($("#cashbookKind").val()=="no"){
			$("#cashbookKindCheck").html("수입/지출을 선택해주세요.");
		}else{
			$("#cashbookKindCheck").html("");
		}
		
		if($("#categoryName").val()=="no"){
			$("#categoryNameCheck").html("카테고리를 선택해주세요.");
		}else{
			$("#categoryNameCheck").html("");
		}
		
		if($("#cashbookPrice").val()==""){
			$("#cashbookPriceCheck").html("가격을 입력해주세요");
		}else{
			$("#cashbookPriceCheck").html("");
		}
		
		if($("#cashbookContent").val()==""){
			$("#cashbookContentCheck").html("내용을 입력해주세요");
		}else{
			$("#cashbookContentCheck").html("");
		}
		
		if($(".cashbookKind").val()!="no"&&$(".categoryNameCheck").val()!="no"&&$("#cashbookPrice").val()!=""&&$("#cashbookContent").val()!=""){
			$("#addCashbookForm").submit();
		}
	});
</script>
</html>