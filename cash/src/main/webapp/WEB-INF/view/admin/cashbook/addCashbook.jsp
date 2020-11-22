<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
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
						alt="Line" class="tm-header-line">&nbsp;addCashbook &nbsp;&nbsp;<img
						src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">가계부 추가</h2>
				<a href="#addCashbook" class="tm-more-button tm-more-button-welcome">addCashbook</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 가계부 추가 게시판입니다.
				</p>
			</div>
			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="#addCashbook">
			<section class="tm-section">
				<div class="row">
						<div class="col-lg-12 tm-section-header-container">
							<h2 class="tm-section-header gold-text tm-handwriting-font">
								지출/수입 추가</h2>
	
							<div class="tm-hr-container">
								<hr class="tm-hr">
							</div>
						</div>
				</div>
				<div class="tm-daily-menu-container " style="margin-left: 25%">
					<div class="container ">
						<form id="addCashbookForm" method="post" class="tm-contact-form" action="${pageContext.request.contextPath }/admin/addCashbook/${currentYear }/${currentMonth}/${currentDay}">
							<div class="col-lg-6 col-md-6">
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
								<button id="btn" class="tm-more-button "type="button">추가</button>
							</div>
						</form>
					</div>
				</div>
			</section>	
		</div>
	</div>
<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
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