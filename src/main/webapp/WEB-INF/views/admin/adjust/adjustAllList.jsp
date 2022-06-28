<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 정산 내역 전체조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<style type="text/css">
	
	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}
	table{
		width: 1500px;
	}


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
							location.reload()
							
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

<div>

	<section>
		<form>
			
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
	                    <c:when test ="${empty requestScope.list.content}">
	                        <tr>
	                            <th colspan="9">
	                                <span> 정산 신청한 내역이 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.list.content}" var="adjust">
	                            <tr>
	                                <td>${adjust.adjustNo}</td>
	                                <td>${adjust.teacher.teacherId}</td>
	                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${adjust.adjustPrice}"/>원</td>
	                                <td>${adjust.bank}</td>
	                                <td>${adjust.depositor}</td>
	                                <td>${adjust.account}</td>
	                                <td>
			                        	<span><fmt:parseDate value="${adjust.adjustInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
			                        <td>
			                        	<span><fmt:parseDate value="${adjust.adjustCompleteDate}" pattern="yyyy-mm-dd" var="completeDate"/></span>
			                        	<span><fmt:formatDate value="${completeDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
	                                <td>
										<select name="select_adjustStateName" id="select_adjustStateName" class="form-select">
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
												<!-- <option name="adjustStateId" value="1">정산신청</option>
												<option name="adjustStateId" value="2">정산진행중</option>
												<option name="adjustStateId" value="4">정산반려</option> --> 
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
			
			<!--  페이징처리  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:set var="doneLoop" value="false" />
					<c:if test="${(startPage-blockCount) > 0 and list.content.size() != 0}">
						<li class="page-item">
							<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
						</li>
					</c:if>
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
							<c:if test="${(i-1)>=list.getTotalPages()}">
								<c:set var="doneLoop" value="true" />
							</c:if>
							<c:if test="${not doneLoop}">
								<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
					<c:if test="${(startPage+blockCount) <= list.getTotalPages()}">
						<li class="page-item">
							<a class="page-link" href="${URL}?${location.search}page=${startPage+blockCount}">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
			
		</form>
	</section>
	
</div>		
		
</body>
</html>