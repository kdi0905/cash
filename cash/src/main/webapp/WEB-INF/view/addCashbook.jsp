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
<style>
body{
	padding: 0;
	margin: 0;
	width: 1100px; // 가로 폭 
	height : 100%; //세로폭 
	overflow: hidden; // 범위를 넘엇을시 넘는 영역 숨김 
	background-position : 0 0;//시작위치 
	background-repeat: no-repeat; // 배경화면 반복 
	background-attachment :fixed; // 배경화면 스크롤시 고정
	background-size : cover; // 배경화면 비율유지
	position :relative; //위치지정 
	overflow-y: auto;//스크롤
}
</style>
<body>

		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		<h1>addCashbook</h1>
		<form method="post" action="/addCashbook?currentYear=${param.currentYear }&currentMonth=${param.currentMonth}&currentDay=${param.currentDay}">
			<table class="table" style="width: 600px; height: 100%; text-align: center">
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
			<button type="submit">수입/지출입력</button>
		</form>

</body>
</html>