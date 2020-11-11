<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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


		<!-- 공지 -->
		<h1 style="text-align: center; margin-top: 30px;">공지사항</h1>
		<table class="table table-bordered" style="margin-top: 40px; text-align: center;">
		<thead>
			<tr>
				<th>notice_id</th>
				<th>notice_title</th>
				<th>notice_date</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var ="n" items="${noticeList}">
			<tr>
				<td>${n.noticeId }</td>
				<td>${n.noticeTitle }</td>
				<td>${n.noticeDate }</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
		<div style="text-align: center;">
		<h1>로그인</h1>
		<form id="loginForm"method="post" action="/login">
			<div >
				<span  style="font-size: 10px; margin-right: 30px;">ID :</span> <input id="id" type ="text" name="id">
			</div>
			<span id="idCheck" class="text-danger" style=" margin-left: 60px;"></span>
			<div style="margin-top: 20px;">
				<span style="font-size: 10px;  margin-right: 20px;">PW :</span> <input id="pw"type ="password" name="pw">
			</div>
			<span id="pwCheck" class="text-danger" style=" margin-left: 60px;"></span>
			<div style="margin-top: 20px">
				<button class="btn btn-secondary" id="btn" type="button">로그인</button>
			</div>
			<span id="loginCheck"></span>
		</form>
		</div>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script >

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
			$("#loginForm").submit();	
		}
		
	});
	
</script>
</html>