<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
	margin: auto;
	width: 1100px; 
	height : 100%; 
	background-color: #fafbfc;
}
</style>
</head>
<body>
	
	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<div style="text-align: center;">
	<h1 style="margin-top: 30px; ">사용자 추가</h1>
	<form id="addMember" method="post" action="/admin/addMember">
			<div>
				<span  style="font-size: 20px; margin-right: 30px;">ID :</span> <input id="id" type ="text" name="id">
			</div>
			<span id="idCheck" class="text-danger" style=" margin-left: 60px;"></span>
			<span id="idCheck2" class="text-success" style=" margin-left: 60px;"></span>
			<div style="margin-top: 10px;">
				<span style="font-size: 20px;  margin-right: 20px;">PW :</span> <input id="pw"type ="password" name="pw">
			</div>
			<span id="pwCheck" class="text-danger" style=" margin-left: 60px;"></span>
			<div style="margin-top: 10px">
				<button class="btn btn-secondary" id="btn" type="button">추가</button>
			</div>
		
	</form>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script >
	$('#id').focus();
	if($('#id')!=''){
		$('#id').blur(function(){
			//비동기 요청으로 id값을 서버에 보내고 #id값이 중복인지 아닌지  확인
			$.ajax({
				url:'/admin/idCheck/'+$('#id').val(),
				type:'post',
				success:function(data){ //data -> yes:사용가능한 id no:사용 불가 id
					if(data =='yes'){
						$('#idCheck2').html("사용가능한 ID입니다.");
						$('#pw').focus();
					}else{
						
						$('#idCheck').html("사용중인 ID입니다.");
						$('#id').select();
					}
				}
			})
		})
	}
		
	$('#btn').click(function(){
		if($('#id').val()==""){
			$('#idCheck').html("아이디를 입력해주세요.");	
			
		}else{
			$('#idCheck').html("");	
		}
		if($('#pw').val()==""){
			$('#pwCheck').html("비밀번호를 입력해주세요.");
			
		}else{
			$('#pwCheck').html("");	
				
		}
		if($('#id').val()!=""&&$('#pw').val()!=""){		
			$("#addMember").submit();	
		}
		
		
	});
	
</script>
</html>