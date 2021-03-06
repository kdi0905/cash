<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
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

</head>
<body id="page-top">
<div id="wrapper">
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div id="content-wrapper" class="d-flex flex-column">
		<div class="container-fluid" style="margin: auto;min-width:700px;max-width: 1100px;">
			<div class="card shadow mb-4">
				<div class="card-header py-3  align-items-center justify-content-between text-center">
					<h5 class="m-0 font-weight-bold text-primary text-center ">월 카테고리 지출
					</h5>
				</div>
				<div class="card-body">
					<div style="margin: auto;">
						<div class="row">
						<div class="from-group text-center" style="margin: auto; ">
							<table>
								<tr>
									<td><span id="select"></span></td>
									<td></td>
									<td><button id="chartBtn" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" type="button">Chart</button></td>
								</tr>
							</table>
						</div>
						</div>
						<!-- 0)출력 -->
						<div class="text-center" id="canvas" style="margin-left: auto; margin-right:auto;width:70%; margin-top: 20px;  height: 400px;">
							<!--   <canvas id="myChart"></canvas>-->
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>	

<script>
let today = new Date();
let year = today.getFullYear(); //년도

$('#select').html('<input class="form-control text-center " type="text" id="year" value="'+year+'" placeholder="년도 입력하세요.">');

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