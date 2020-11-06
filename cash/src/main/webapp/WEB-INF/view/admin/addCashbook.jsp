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
	padding: 0;
	margin: 0;
	width: 100%; 
	height : 100%; 
	overflow: hidden; 
	background-position : 0 0;
	background-repeat: no-repeat;
	background-attachment :fixed; 
	background-size : cover; 
	position :relative; 
	overflow-y: auto;
}
</style>
<body>
	<div style="margin-left: 10%; margin-right:10%;">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div style="text-align: center;">
		<h1 style="margin-top: 30px;" >수입/지출</h1>
		</div>
		<form method="post" action="/admin/addCashbook?currentYear=${param.currentYear }&currentMonth=${param.currentMonth}&currentDay=${param.currentDay}">
			<table class="table table-bordered" style="text-align: center">
			<tr>
					<td>cashbook_date</td>
					<td>
						<input type="text" name="cashbookDate" value ="${param.currentYear}-${param.currentMonth}-${param.currentDay}" required="required"> 
					</td>
				</tr>
				<tr>
					<td>cashbook_kind</td>
					<td>
						<input type="radio" name="cashbookKind" value="수입">수입
						<input type="radio" name="cashbookKind" value="지출">지출
					</td>
				</tr>
				<tr>
					<td>category_name</td>
					<td>
						<select name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<option value="${c.categoryName}">${c.categoryName}</option>
								
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>cashbook_price</td>
					<td>
						<input type="text" name="cashbookPrice" placeholder="가격을 입력하세요">
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<input type="text" name="cashbookContent" placeholder="내용을 입력하세요">
					</td>
				</tr>
			</table>
			<button class="btn btn-secondary" style="float: right" type="submit">수입/지출입력</button>
		</form>
</div>
</body>
</html>