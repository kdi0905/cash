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
		<h1 style="margin-top: 30px;" >수입/지출 </h1>
		</div>
		<form id ="updateCashbookForm" method="post" action="/admin/updateCashbook/${cashbook.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">
			<table class="table table-bordered" style=" height: 100%; text-align: center">
			<tr>
					<td>cashbook_date</td>
					<td>
						<input type="text" name="cashbookDate" disabled="disabled" value ="${cashbook.cashbookDate}" required="required"> 
					</td>
				</tr>
				<tr>
					<td>cashbook_kind</td>
					<c:if test="${cashbook.cashbookKind=='수입'}">
					<td>
						<input type="radio" name="cashbookKind" value="수입" checked="checked">수입
						<input type="radio" name="cashbookKind" value="지출">지출
					</td>
					</c:if>
					<c:if test="${cashbook.cashbookKind=='지출'}">
					<td>
						<input type="radio" name="cashbookKind" value="수입" >수입
						<input type="radio" name="cashbookKind" value="지출"checked="checked">지출
					</td>
					</c:if>
				</tr>
				<tr>
					<td>category_name</td>
					<td>
						<select  name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<c:if test="${c.categoryName==cashbook.categoryName}">
								<option selected="selected" value="${c.categoryName}">${c.categoryName}</option>
								<span id="cashbookKindCheck"></span>
								</c:if>
								<c:if test="${c.categoryName!=cashbook.categoryName}">
								<option  value="${c.categoryName}">${c.categoryName}</option>
								</c:if>
							</c:forEach>
						</select>
						
					</td>
				</tr>
				<tr>
					<td>cashbook_price</td>
					<td>
						<input id="cashbookPrice" type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}">
						<span class="text-danger" style="margin-left:10px; font-size: 10px" id= "cashbookPriceCheck"></span>
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<input id="cashbookContent" type="text" name="cashbookContent" value="${cashbook.cashbookContent}">
						<span class="text-danger" style="margin-left:10px; font-size: 10px" id="cashbookContentCheck"></span>
					</td>
				</tr>
			</table>
			<button class="btn btn-secondary" id="btn" style="float: right" type="button">수정</button>
		</form>

</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$("#btn").click(function(){
		
		
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
		if($("#cashbookPrice").val()!=""&&$("#cashbookContent").val()!=""){
			$("#updateCashbookForm").submit();
		}
		});
</script>
</html>