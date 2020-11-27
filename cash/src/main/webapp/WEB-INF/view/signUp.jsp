<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>회원가입</title>
   
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath }/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath }/css/sb-admin-2.min.css" rel="stylesheet">
	  <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/js/sb-admin-2.min.js"></script>
</head>

<body class="bg-gradient-primary">
	<div class="container" style="margin-top:10%;">

        <!-- Outer Row -->
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                             <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">회원가입</h1>
                                    </div>
                                  <form id="signUp" method="post" action="${pageContext.request.contextPath }/signUp">
                                        <div class="form-group">
                                            <input id="memberName" type="text" class="form-control form-control-user" name="memberName"
                                                placeholder="Nickname">
                                              <span id="nameCheck1" class="text-danger" ></span>
											<span id="nameCheck2" class="text-success" ></span>
                                        </div>
                                        <div class="form-group">
                                            <input id="memberId" type="text" class="form-control form-control-user"
                                                aria-describedby="emailHelp" name="memberId"
                                                placeholder="Id">
                                           
                                            <span id="idCheck1" class="text-danger" ></span>
											<span id="idCheck2" class="text-success" ></span>
											
                                        </div>
                                        <div class="form-group">
                                            <input id="memberPw1" type="password" class="form-control form-control-user" name="memberPw"
                                                 placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <input id="memberPw2" type="password" class="form-control form-control-user" 
                                                 placeholder="Repeat Password">
                                             <span id="pwCheck" class="text-danger" ></span>
                                        </div>
                                       <button class="btn btn-primary btn-user btn-block" id="btn" type="button">회원가입</button>
                                    </form>
                                    <hr>
                                    <div class="text-center">
                                    	<a class="small" href="${pageContext.request.contextPath }/login">돌아가기</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script >


$('#memberName').blur(function(){
	//비동기 요청으로 id값을 서버에 보내고 #id값이 중복인지 아닌지  확인
	if($('#memberName').val() != '') {
		$.ajax({
			url:'${pageContext.request.contextPath }/nameCheck/'+$('#memberName').val(),
			type:'post',
			success:function(data){ //data -> yes:사용가능한 id no:사용 불가 id
				// 공백 확인
				
			
				
					
		
				if(data =='yes'){
					$('#nameCheck1').html("");
					$('#nameCheck2').html("사용가능한 닉네임입니다.");
					$('#memberId').focus();
				}else{
					$('#nameCheck2').html("");
					$('#nameCheck1').html("사용중인 닉네임입니다.");
					$('#memberName').select();
					$('#memberName').focus();
				}
			}
		});
	}
});
	


$('#memberId').blur(function(){
	//비동기 요청으로 id값을 서버에 보내고 #id값이 중복인지 아닌지  확인
	if($('#memberId').val() != '') {
		$.ajax({
			url:'${pageContext.request.contextPath }/idCheck/'+$('#memberId').val(),
			type:'post',
			success:function(data){ //data -> yes:사용가능한 id no:사용 불가 id
				// 공백 확인
				
			
				if(data =='yes'){
					$('#idCheck1').html("");
					$('#idCheck2').html("사용가능한 ID입니다.");
					$('#memberPw').focus();
				}else{
					$('#idCheck2').html("");
					$('#idCheck1').html("사용중인 ID입니다.");
					$('#memberId').select();
					$('#memberId').focus();
				}
			}
		});
	}
});

$('#btn').click(function(){
	if($('#memberName').val()==""){
		$('#nameCheck1').html("닉네임을 입력해주세요.");	
	}else{
		$('#nameCheck1').html("");	
	}
	
	if($('#memberId').val()==""){
		$('#idCheck1').html("아이디를 입력해주세요.");	
		
	}else{
		$('#idCheck1').html("");	
	}
	if($('#memberPw1').val()=="" || $('#memberPw2').val()==""){
		$('#pwCheck').html("비밀번호를 입력해주세요.");
		return;
	}else if($('#memberPw1').val()!= $('#memberPw2').val()){
		$('#pwCheck').html("다시 비밀번호를 입력해주세요.")
		return;
	}else if($('#memberName').val()!=""&&$('#memberId').val()!=""&&$('#memberPw1').val()!=""){		
		$("#signUp").submit();	
	}
});
	
</script>
</html>