<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
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
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">&nbsp;통계&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">월 총 금액</h2>
				<a href="#stats" class="tm-more-button tm-more-button-welcome">stats</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 월 총 금액 페이지 입니다.
				</p>
			</div>
			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="stats">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							월 총 금액</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div class="container">
						<div class="row">
							<div class="from-group " style="margin: auto;">
								<button id="chartBtn" class="tm-more-button tm-more-button-welcome" type="button">Chart</button>
								<input class="form-control text-center" type="text" id="year" placeholder="년도 입력하세요.">
							</div>
						</div>
						<!-- 0)출력 -->
						<div id="canvas"  style="margin-left: auto; margin-right:auto; margin-top: 20px; width: 80%; height: 400px;">
							 <!-- <canvas id="myChart"></canvas> -->
						</div>
						<a href="${pageContext.request.contextPath }/admin/chart/chartStart.jsp" class="tm-more-button margin-top-30">목록</a>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
</body>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<!--차트 -->
<script>
	$('#chartBtn').click(function() {
		$('#canvas').html("");
		if ($('#year').val() != "") {
			$('#canvas').append('<canvas id="myChart">')
			$.ajax({
				url : '${pageContext.request.contextPath}/admin/MonthOfInAndOutByYear/'+ $('#year').val(),
				type : 'get',
				success : function(data) {
						
						var ctx = document.getElementById('myChart').getContext('2d');//캔퍼스태그를 가져와서 그린다. //2d,3d도화지를 가져온다.
						//var chart = new Chart(ctx,{type:'차트 종류', data:{차트안에 사용될 모은데이터}, options:{ }});//ctx 안에 차트1개 만들기
						var chart = new Chart(ctx,{
								type : 'bar',
								data : {
									labels : [
											'1월',
											'2월',
											'3월',
											'4월',
											'5월',
											'6월',
											'7월',
											'8월',
											'9월',
											'10월',
											'11월',
											'12월' ],
									datasets : [ {
										label : data[0].YEAR,//제목
										fill:true,
										
										backgroundColor : [
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(140, 200, 235, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(0, 159, 64, 0.2)' 
												], //배경색
										borderColor : [
											'rgba(153, 102, 255, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(140, 200, 235, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(0, 159, 64, 1)'
												 ],//선 색
										//data 속성의 배열값은 ajax호출후 결과값으로 채워야 한다.
										data : [
												data[0].january - data[1].january,
												data[0].february - data[1].february,
												data[0].march - data[1].march,
												data[0].april - data[1].april,
												data[0].may - data[1].may,
												data[0].june - data[1].june,
												data[0].july - data[1].july,
												data[0].august - data[1].august,
												data[0].september - data[1].september,
												data[0].october - data[1].october,
												data[0].november - data[1].november,
												data[0].december - data[1].december ],
										borderWidth : 1
									} ]

								},//차트안에 사용되는 모든 데어터
								options : {}
							});
						
					} 
			});
			$('#canvas').append('</canvas>')
		}
	});
</script>
</html>