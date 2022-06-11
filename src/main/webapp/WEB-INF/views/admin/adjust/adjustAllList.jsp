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
	.pagination{
		display: block;
		text-align: center;
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

<div class="main-content">

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
	                    <c:when test ="${empty requestScope.adjustList.content}">
	                        <tr>
	                            <th colspan="9">
	                                <span> 정산 신청한 내역이 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.adjustList.content}" var="adjust">
	                            <tr>
	                                <td>${adjust.adjustNo}</td>
	                                <td>${adjust.teacher.teacherId}</td>
	                                <td>${adjust.adjustPrice}</td>
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
			
			<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
			<div style="text-align: center">
				
					<!--  블럭당  -->
			 <nav class="pagination-container">
				<div class="pagination">
				<c:set var="doneLoop" value="false"/>
					
					  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
					      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/adjust/adjustAllList?nowPage=${startPage-1}">PREV</a>
					  </c:if>
					  
							<span class="pagination-inner"> 
							  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
							  
								<c:if test="${(i-1)>=pageList.getTotalPages()}">
								       <c:set var="doneLoop" value="true"/>
								</c:if> 
							     
							    <c:if test="${not doneLoop}" >
							         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/adjust/adjustAllList?nowPage=${i}">${i}</a> 
							    </c:if>
							   
							  </c:forEach>
							</span> 
							<!-- 
							[다음]
			 
								  if( (시작페이지+한블록당뿌려질[]개수)<= 총페이지수){
								      [다음]출력;
								  }  
								
								  ex)if( (startPage+blockCount) <= pageCount){
								
								      }
							 -->
							 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
							     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/adjust/adjustAllList?nowPage=${startPage+blockCount}">NEXT</a>
							 </c:if>
					
					</div>
				</nav>  
			</div>
			
		</form>
	</section>
	
</div>		
		
</body>
</html>