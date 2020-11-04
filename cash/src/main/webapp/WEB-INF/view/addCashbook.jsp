<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<h1>addCashbook</h1>
		<form method="post" action="/addCashbook">
			<table class="table">
			<tr>
					<td>cashbook_date</td>
					<td>
						<input type="text" name="cashbookDate" value ="${param.currentYear}-${param.currentMonth}-${param.currentDate}" required="required"> 
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
						<input type="text" name="cashbookPrice">
					</td>
				</tr>
				<tr>
					<td>cashbook_content</td>
					<td>
						<input type="text" name="cashbookContent">
					</td>
				</tr>
			</table>
		</form>
</body>
</html>