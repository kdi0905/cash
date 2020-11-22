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
				<h2 class="gold-text tm-welcome-header-2">월 카테고리 지출</h2>
				<a href="#stats" class="tm-more-button tm-more-button-welcome">stats</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 년도별 월 카테고리 지출페이지 입니다.
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
							월 카테고리 지출</h2>
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
								<input class="form-control text-center " type="text" id="year" placeholder="년도 입력하세요.">
							</div>
						</div>
						<!-- 0)출력 -->
						<div id="canvas" style="margin-left: auto; margin-right:auto; margin-top: 20px; width: 80%; height: 400px;">
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
$('#chartBtn').click(function(){
	$('#canvas').html("");
	if ($('#year').val() != "") {
		$('#canvas').append('<canvas id="myChart">')
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/MonthOfCategoryOutByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				
				var ctx = document.getElementById('myChart').getContext('2d');//캔퍼스태그를 가져와서 그린다. //2d,3d도화지를 가져온다.
					
				console.log(data);
				let pieChart = new Chart(ctx,{
					type:'line',
					data:{
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
							label : data[0].category_name,
							borderColor: "#3e95cd",
							fill: false,
							pointStyle : 'star',
							steppedLine:true,
							data : [
									data[0].january,
									data[0].february,
									data[0].march,
									data[0].april,
									data[0].may,
									data[0].june,
									data[0].july,
									data[0].august,
									data[0].september,
									data[0].october,
									data[0].november,
									data[0].december ],
							borderWidth : 2
						},{
							label : data[1].category_name,
							borderColor: "#8e5ea2",
							fill: false,
							pointStyle : "star",
							steppedLine:true,
							data : [
									data[1].january,
									data[1].february,
									data[1].march,
									data[1].april,
									data[1].may,
									data[1].june,
									data[1].july,
									data[1].august,
									data[1].september,
									data[1].october,
									data[1].november,
									data[1].december ],
							borderWidth : 2
							},{
								label : data[2].category_name,
								borderColor: "#e8c3b9",
								fill: false,
								pointStyle : 'star',
								steppedLine:true,
								data : [
										data[2].january,
										data[2].february,
										data[2].march,
										data[2].april,
										data[2].may,
										data[2].june,
										data[2].july,
										data[2].august,
										data[2].september,
										data[2].october,
										data[2].november,
										data[2].december ],
								borderWidth :2
							},{
								label : data[3].category_name,
								borderColor: "#c45850",
								fill: false,
								pointStyle : 'star',
								steppedLine:true,
								data : [
										data[3].january,
										data[3].february,
										data[3].march,
										data[3].april,
										data[3].may,
										data[3].june,
										data[3].july,
										data[3].august,
										data[3].september,
										data[3].october,
										data[3].november,
										data[3].december ],
								borderWidth :2
								} ]
						
							},
					options:{}
			
				});
			}
		});
		$('#canvas').append('</canvas>')
	}
});
</script>
</html>