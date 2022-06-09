<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : 정산 내역 조회</title>

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
	                    <c:when test ="${empty requestScope.adjustList}">
	                        <tr>
	                            <th colspan="8">
	                                <span> 정산 신청한 내역이 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.adjustList.content}" var="adjust">
	                            <tr>
	                                <td>${adjust.adjustNo}</td>
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
			
			<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
			<div style="text-align: center">
				
					<!--  블럭당  -->
			 <nav class="pagination-container">
				<div class="pagination">
				<c:set var="doneLoop" value="false"/>
					
					  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
					      <a class="pagination-newer" href="${pageContext.request.contextPath}/teacher/adjust/adjustList?nowPage=${startPage-1}">PREV</a>
					  </c:if>
					  
							<span class="pagination-inner"> 
							  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
							  
								<c:if test="${(i-1)>=pageList.getTotalPages()}">
								       <c:set var="doneLoop" value="true"/>
								</c:if> 
							     
							    <c:if test="${not doneLoop}" >
							         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/teacher/adjust/adjustList?nowPage=${i}">${i}</a> 
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