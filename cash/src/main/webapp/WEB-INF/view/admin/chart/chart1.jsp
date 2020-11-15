<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chart</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
		margin: auto;
	width: 1100px; 
	height : 100%; 
	background-color: #fafbfc;
}
thead{
	background-color:  #D5D5D5;
}
tbody{
	background-color: white;
}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div class="row">
		<div class="col">
		<jsp:include page="/WEB-INF/view/inc/chartMenu.jsp"></jsp:include>
		</div>
		
	<h1>chart1</h1>
		
	
	<div id=yearbtn>
	
	</div>
	<!-- chart -->
	<div>
		<canvas id="chart1"></canvas>
	</div>
	<!-- table -->
	<div></div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script><!--차트 -->
<script>
	$.ajax({
		url:'${pagecontext.request.contextPath}/admin/year',
		type:'get',
		success:function(data){
			
			for(let i=0;i<data.length; i++){	
			$('#yearbtn').append('<form method="post" action="${pagecontext.request.contextPath}/admin/totalOfMonthByYear/'+data[i]+'">')	
			$('#yearbtn').append('<button class="btn btn-secondary" style="magin" type=button id ='+data[i]+'>'+data[i])
			$('#yearbtn').append('</form>')
			}
			
		}
	});
//<a href="${pageContext.request.contextPath}/admin/totalOutAndInByYear/'+$(data.year[d])+'">
</script>
</html>