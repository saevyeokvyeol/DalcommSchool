<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : 정산 내역 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<style type="text/css">
	section {width: 1200px; margin: auto;}
	table {width: 1200px;}
	th, td {border: 1px solid black;}
</style>



</head>
<body>
		<section>
			<form>

				<h1>정산 내역 조회 </h1>
				
				<table class="table" id="adjustTable">
					<thead>
						<tr>
							<th>정산코드</th>
							<th>정산금액</th>
							<th>은행</th>
							<th>예금주</th>
							<th>계좌번호</th>
							<th>정산신청일</th>
							<th>정산일</th>
							<th>정산상태</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.list}">
		                        <tr>
		                            <th colspan="8">
		                                <span> 정산 신청한 내역이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.list}" var="adjust">
		                            <tr>
		                                <td>${adjust.adjustNo}</td>
		                                <td>${adjust.adjustPrice}</td>
		                                <td>${adjust.bank}</td>
		                                <td>${adjust.depositor}</td>
		                                <td>${adjust.account}</td>
		                                <td>${adjust.adjustInsertDate}</td>
		                                <td>${adjust.adjustCompleteDate}</td>
		                                <td>${adjust.adjustState.adjustStateName}</td>
		                            </tr>
		                        </c:forEach>
		                    </c:otherwise>
		                </c:choose>
						
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
			</form>
		</section>
		
</body>
</html>