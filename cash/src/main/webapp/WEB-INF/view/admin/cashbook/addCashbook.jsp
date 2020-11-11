<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addCashbook</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
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
<body>

		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div style="text-align: center;">
		<h1 style="margin-top: 30px;" >수입/지출</h1>
		</div>
		<form id="addCashbookForm"method="post" action="/admin/addCashbook/${currentYear }/${currentMonth}/${currentDay}">
			<table class="table table-bordered" style="text-align: center">
			<tr>
					<td>cashbook_date</td>
					<td>
						<input id="cashbookDate" type="text" name="cashbookDate" value ="${currentYear}-${currentMonth}-${currentDay}" disabled="disabled"> 
						<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookDateCheck"></span>
					</td>
				</tr>
				<tr>
					<td>cashbook_kind</td>
					<td>
						<input class="cashbookKind" type="radio" name="cashbookKind" value="수입">수입
						<input class="cashbookKind" type="radio" name="cashbookKind" value="지출">지출
						 <span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookKindCheck"></span>
					</td>
				</tr>
				<tr>
					<td>category_name</td>
					<td>
						<select id="categoryName" name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<option value="${c.categoryName}">${c.categoryName}</option>
								
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>cashbook_price</td>
					<td>
						<input type="text" id ="cashbookPrice" name="cashbookPrice" placeholder="가격을 입력하세요">
						<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookPriceCheck"></span>
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<input type="text" id="cashbookContent"name="cashbookContent" placeholder="내용을 입력하세요">
						<span class="text-danger" style="margin-left:10px; font-size: 10px"id="cashbookContentCheck"></span>
					</td>
				</tr>
			</table>
			<button id ="btn" class="btn btn-secondary" style="float: right" type="button">수입/지출입력</button>
		</form>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("#btn").click(function(){
		
		if($(".cashbookKind:checked").val()==undefined){
			$("#cashbookKindCheck").html("수입/지출을 선택해주세요.");
		}else{
			$("#cashbookKindCheck").html("");
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
		if($(".cashbookKind:checked").val()!=undefined&&$("#cashbookPrice").val()!=""&&$("#cashbookContent").val()!=""){
			$("#addCashbookForm").submit();
		}
		});
</script>
</html>