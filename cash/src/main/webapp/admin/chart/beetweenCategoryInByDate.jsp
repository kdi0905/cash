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
<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" type="image/x-icon" />quest.contextPath }/img/favicon.ico"
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
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-1">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-2">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-3">
			</div>
			<div class=" tm-welcome-content">
				<h2 class="white-text tm-handwriting-font tm-welcome-header">
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">&nbsp;통계&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">날짜별 카테고리 수입</h2>
				<a href="#stats" class="tm-more-button tm-more-button-welcome">stats</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 날짜별 카테고리 수입 페이지 입니다.
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
						<h3 class="tm-section-header gold-text tm-handwriting-font">
							날짜별 카테고리 수입</h3>
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
								<table>
									<tr>
										<td><input class="form-control  " type="date" id="startDate" ></td>
										<td><span class="gold-text " style="font-size: 20px;">~</span></td>
										<td>	<input class="form-control  " type="date" id="endDate" ></td>
									</tr>
								</table>
							</div>
							
						</div>
						<!-- 0)출력 -->
						<div id="canvas" style="margin-left: auto; margin-right:auto; margin-top: 20px; width: 80%; height: 400px;">
							<!--   <canvas id="myChart"></canvas>-->
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
	if ($('#startDate').val() != ""&&$('#endDate').val() != "") {
		$('#canvas').append('<canvas id="myChart">')
		$.ajax({
			url: '${pageContext.request.contextPath}/admin/beetweenCategoryInByDate/'+$('#startDate').val()+'/'+$('#endDate').val(),
			type:'get',
			success:function(data){
				
				var ctx = document.getElementById('myChart').getContext('2d');//캔퍼스태그를 가져와서 그린다. //2d,3d도화지를 가져온다.
					
				console.log(data);
				let chart = new Chart(ctx,{
					type:'polarArea',
					data:{
						labels:['급여','용돈'],//항목
						datasets:[{
							label:data.year, //제목
							backgroundColor : [
								'rgba(115, 159, 64, 0.2)',
								'rgba(172, 99, 132, 0.2)',],
							borderColor : [ 
								'rgba(115, 159, 64, 1)',
								'rgba(172, 99, 132, 1)'],
							data:[data.급여, data.용돈]//데이터
						}]
						
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