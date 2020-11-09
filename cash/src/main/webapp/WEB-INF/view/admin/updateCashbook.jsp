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
	width: 1300px; 
	height : 100%; 
}
</style>
<body>
	<div style="margin-left: 10%; margin-right:10%;">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<div style="text-align: center;">
		<h1 style="margin-top: 30px;" >수입/지출 </h1>
		</div>
		<form method="post" action="/admin/updateCashbook/${cashbook.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">
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
						<select name="categoryName">
							<c:forEach var="c" items="${categoryList}">
								<c:if test="${c.categoryName==cashbook.categoryName}">
								<option selected="selected" value="${c.categoryName}">${c.categoryName}</option>
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
						<input type="text" name="cashbookPrice" value="${cashbook.cashbookPrice}">
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<input type="text" name="cashbookContent" value="${cashbook.cashbookContent}">
					</td>
				</tr>
			</table>
			<button class="btn btn-secondary" style="float: right" type="submit">수정</button>
		</form>
</div>
</body>
</html>