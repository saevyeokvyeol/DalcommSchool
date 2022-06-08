<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 정산 내역 전체조회</title>
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

<script type="text/javascript">
			$(function() {
				
				$(document).on("change", "#select_adjustStateName", function() {
					//var idValue1 = $(this).parent().siblings().eq(0).text(); //adjustNo
					//var idValue2 = $(this).val(); //adjustStateId
					//alert(idValue1);
					//alert(idValue2);
					
					$.ajax({
						url: "${pageContext.request.contextPath}/admin/adjust/changeAdjustState",
						type: "post",
						dataType : "text",
						data: {"${_csrf.parameterName}": "${_csrf.token}", adjustNo: $(this).parent().siblings().eq(0).text(), adjustStateId: $(this).val()},
						success: function(result) {
							alert("수정되었습니다.");
						},
						error: function(err) {
							alert(err + "\n에러발생");
						}
					}) // ajax 종료	
					
				})//onchang 끝	
				
				
			}); //ready 끝	
			
</script>


</head>
<body>
		<section>
			<form>

				<h1>정산 내역 조회 </h1>
				
				<table class="table" id="adjustTable">
					<thead>
						<tr>
							<th>정산코드</th>
							<th>선생님ID</th>
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
		                            <th colspan="9">
		                                <span> 정산 신청한 내역이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.list}" var="adjust">
		                            <tr>
		                                <td>${adjust.adjustNo}</td>
		                                <td>${adjust.teacher.teacherId}</td>
		                                <td>${adjust.adjustPrice}</td>
		                                <td>${adjust.bank}</td>
		                                <td>${adjust.depositor}</td>
		                                <td>${adjust.account}</td>
		                                <td>${adjust.adjustInsertDate}</td>
		                                <td>${adjust.adjustCompleteDate}</td>
		                                <td>
											<select name="select_adjustStateName" id="select_adjustStateName">
												<c:choose>
												<c:when test="${adjust.adjustState.adjustStateId == '1'}">
													<option name="adjustStateId" value="1">${adjust.adjustState.adjustStateName}</option>
													<option name="adjustStateId" value="2">정산진행중</option>
													<option name="adjustStateId" value="3">정산완료</option>
													<option name="adjustStateId" value="4">정산반려</option>
												</c:when>
												<c:when test="${adjust.adjustState.adjustStateId == '2'}">
													<option name="adjustStateId" value="2">${adjust.adjustState.adjustStateName}</option>
													<option name="adjustStateId" value="1">정산신청</option>
													<option name="adjustStateId" value="3">정산완료</option>
													<option name="adjustStateId" value="4">정산반려</option>
												</c:when>
												<c:when test="${adjust.adjustState.adjustStateId == '3'}">
													<option name="adjustStateId" value="3">${adjust.adjustState.adjustStateName}</option>
													<option name="adjustStateId" value="1">정산신청</option>
													<option name="adjustStateId" value="2">정산진행중</option>
													<option name="adjustStateId" value="4">정산반려</option> 
												</c:when>
												<c:when test="${adjust.adjustState.adjustStateId == '4'}">
													<option name="adjustStateId" value="4">${adjust.adjustState.adjustStateName}</option>
													<option name="adjustStateId" value="1">정산신청</option>
													<option name="adjustStateId" value="2">정산진행중</option> 
													<option name="adjustStateId" value="3">정산완료</option>
												</c:when>
												</c:choose>	
		        							</select>
		        						</td>
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