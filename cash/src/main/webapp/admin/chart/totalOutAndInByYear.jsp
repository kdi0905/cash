<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통계</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet"	type="text/css">
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
					<h5 class="m-0 font-weight-bold text-primary text-center ">년도별 수입/지출
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
		url:'${pageContext.request.contextPath}/admin/totalOutAndInByYear/'+$('#year').val(),
		type:'get',
		success:function(data){
			
			var ctx = document.getElementById('myChart').getContext('2d');//캔퍼스태그를 가져와서 그린다. //2d,3d도화지를 가져온다.
				
			console.log(data);
			let pieChart = new Chart(ctx,{
				type:'pie',
				data:{
					labels:['수입','지출'],//항목
					datasets:[{
						label:data.year, //제목
						backgroundColor : [
							'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 99, 132, 0.2)'],
						borderColor : [ 
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 99, 132, 1)'],
						data:[data.수입, data.지출]//데이터
					}]
					
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
			url:'${pageContext.request.contextPath}/admin/totalOutAndInByYear/'+$('#year').val(),
			type:'get',
			success:function(data){
				
				var ctx = document.getElementById('myChart').getContext('2d');//캔퍼스태그를 가져와서 그린다. //2d,3d도화지를 가져온다.
					
				console.log(data);
				let pieChart = new Chart(ctx,{
					type:'pie',
					data:{
						labels:['수입','지출'],//항목
						datasets:[{
							label:data.year, //제목
							backgroundColor : [
								'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 99, 132, 0.2)'],
							borderColor : [ 
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 99, 132, 1)'],
							data:[data.수입, data.지출]//데이터
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