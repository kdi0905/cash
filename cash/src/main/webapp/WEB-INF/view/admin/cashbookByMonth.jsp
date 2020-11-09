<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>cashbookByMonth</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{
		margin: auto;
	width: 1300px; 
	height : 100%; 
	background-color: #fafbfc;
}
tbody{
	background-color: white;
}
.sunday {
	color: #FF0000;
}

.sumout {
	color: #FF0000;
}

.sumin {
	color: #47C83E;
}

thead{
	background-color:  #D5D5D5;
}
table{
 
	text-align: center;
}
th {
	width: ${100/7}%;
}
td {
	height: 80px;
	vertical-align: top;
}
.tdbg{
	background-color: #EAEAEA;
}
</style>
</head>
<body>
		<div style="margin-left: 10%; margin-right:10%;">
		<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
		
		<!-- ���̾ -->
		<table class="table table-bordered" style="margin-top:30px; width: 200px; font-size:20px; float: left;" >
			<tr>
				<td style="height: 30px" class="tdbg">�̹��� ����</td>
			</tr>
			<tr>
				<td class= "sumin"> ${sumIn}</td>
			</tr>
		</table>
		<table class="table table-bordered" style="margin-top:30px; width: 200px;font-size:20px;; float: right;" >
			<tr>
				<td style="height: 30px" class="tdbg">�̹��� ����</td>
			</tr>
			<tr>
				<td class="sumout"> - ${sumOut}</td>
			</tr>
		</table>
		
		<div style="margin-top:50px; text-align: center;">
			<h3>
				
				<div style="margin-bottom: 10px;">${currentYear}��</div>
				<a class="text-secondary" href="/admin/cashbookByMonth/pre/${currentYear}/${currentMonth-1}">&nbsp;&nbsp;<&nbsp;&nbsp;</a>
				 ${currentMonth} �� 
				<a class ="text-secondary"  href="/admin/cashbookByMonth/next/${currentYear}/${currentMonth+1}">&nbsp;&nbsp;>&nbsp;&nbsp;</a>
			</h3>
		</div>
		<div>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="sunday">��</th>
						<th>��</th>
						<th>ȭ</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
						<th>��</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
							<c:if test="${i-(firstDayOfWeek-1) < 1}">
								<td>&nbsp;</td>
							</c:if>
							<c:if test="${i-(firstDayOfWeek-1) > 0}">
								<c:if test="${i%7 == 1}">
									<td>
									<div>
										<a  class="sunday" href="/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
										 ${i-(firstDayOfWeek-1)}
										 </a></div>
										  <c:forEach var="c" items="${cashList}">
											<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
												<c:if test="${c.cashbookKind =='����'}">
													<div class="sumin">${c.cashbookPrice}</div>
												</c:if>
												<c:if test="${c.cashbookKind =='����'}">
													<div class="sumout">- ${c.cashbookPrice}</div>
												</c:if>
											</c:if>
										</c:forEach>

									</td>
								</c:if>
								<c:if test="${i%7 !=1 }">
									<td>
											<!-- <a class="text-dark" href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}"> -->
										 <a class="text-dark" href="/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
										 ${i-(firstDayOfWeek-1)}
										 </a> <!-- ����/���� ����� �ִ� ��¥�� cashList���� �˻� -->

										<c:forEach var="c" items="${cashList}">
											<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
												<c:if test="${c.cashbookKind =='����'}">
													<div class="sumin">${c.cashbookPrice}</div>
												</c:if>
												<c:if test="${c.cashbookKind =='����'}">
													<div class="sumout">- ${c.cashbookPrice}</div>
												</c:if>
											</c:if>
										</c:forEach>


									</td>
								</c:if>
							</c:if>
							<c:if test="${i%7 == 0}">
					</tr>
					<tr>
						</c:if>
						</c:forEach>

						<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
							<c:forEach begin="1"
								end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
								<td>&nbsp;</td>
							</c:forEach>
						</c:if>
					</tr>
				</tbody>
			</table>
		</div>
</div>
</body>
</html>