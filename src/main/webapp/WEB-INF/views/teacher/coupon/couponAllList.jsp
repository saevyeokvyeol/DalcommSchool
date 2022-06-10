<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : 전체 발급 쿠폰 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

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
				
				$(document).on("change", "#select_couponStateName", function() {
					//var idValue = $(this).parent().siblings().eq(1).text(); //couponId
					//var idValue = $(this).val(); //couponStateId
					//alert(idValue);
					
					$.ajax({
						url: "${pageContext.request.contextPath}/teacher/coupon/changeCouponState",
						type: "post",
						dataType : "text",
						data: {"${_csrf.parameterName}": "${_csrf.token}", couponId: $(this).parent().siblings().eq(1).text(), couponStateId: $(this).val()},
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

				<h1>전체쿠폰조회 </h1>
				
				<table class="table" id="couponTable">
					<thead>
						<tr>
							<th>클래스아이디</th>
							<th>쿠폰아이디</th>
							<th>쿠폰명</th>
							<th>할인금액</th>
							<th>등록일자</th>
							<th>수정일자</th>
							<th>사용기간</th>
							<th>쿠폰상태</th>
							<th>수정하기</th>
							<th>삭제하기</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
		                    <c:when test ="${empty requestScope.couponList}">
		                        <tr>
		                            <th colspan="8">
		                                <span> 클래스 내 발급 가능한 쿠폰이 없습니다.</span>
		                            </th>
		                        </tr>
		                    </c:when>
		                    <c:otherwise>
		                        <c:forEach items="${requestScope.couponList.content}" var="coupon">
		                            <tr>
		                            	<td>${coupon.classes.classId}</td>
		                                <td>${coupon.couponId}</td>
		                                <td>${coupon.couponName}</td>
		                                <td>${coupon.couponDc}</td>
		                                <td>
				                        	<span><fmt:parseDate value="${coupon.couponInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
				                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
				                        </td>
				                        <td>
				                        	<span><fmt:parseDate value="${coupon.couponUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
				                        	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
				                        </td>
		                                <td>${coupon.couponEndDate}일</td>
		                                <td>
											<select name="select_couponStateName" id="select_couponStateName" class="form-select">
												<c:choose>
												<c:when test="${coupon.couponState.couponStateId == '1'}">
													<option name="couponStateId" value="1">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="2">발급중지</option>
													<option name="couponStateId" value="3">삭제</option>
												</c:when>
												<c:when test="${coupon.couponState.couponStateId == '2'}">
													<option name="couponStateId" value="2">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="1">발급</option>
													<option name="couponStateId" value="3">삭제</option>
												</c:when>
												<c:otherwise>
													<option name="couponStateId" value="3">${coupon.couponState.couponStateName}</option>
													<option name="couponStateId" value="1">발급</option>
													<option name="couponStateId" value="2">발급중지</option> 
												</c:otherwise>
												</c:choose>	        
		        							</select>
		        						</td>
		        						<td>
		        							<form method="post" id="updateForm" action="${pageContext.request.contextPath}/teacher/coupon/couponUpdateForm">
												<input type="hidden" name="couponId" value="${coupon.couponId}">
												<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
												<input class="btn btn-primary" type="submit" value="수정하기">
											</form>
										</td>
										<td>
											<form method="post" id="delete" action="${pageContext.request.contextPath}/teacher/coupon/couponDelete">
												<input type="hidden" name="couponId" value="${coupon.couponId}">
												<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
												<input class="btn btn-danger" type="submit" value="삭제하기">
												
											</form>
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
						      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/coupon/selectAllCoupon?nowPage=${startPage-1}">PREV</a>
						  </c:if>
						  
								<span class="pagination-inner"> 
								  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
								  
									<c:if test="${(i-1)>=pageList.getTotalPages()}">
									       <c:set var="doneLoop" value="true"/>
									</c:if> 
								     
								    <c:if test="${not doneLoop}" >
								         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/teacher/coupon/couponAllList?nowPage=${i}">${i}</a> 
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
								     <a class="pagination-older" href="${pageContext.request.contextPath}/teacher/coupon/couponAllList?nowPage=${startPage+blockCount}">NEXT</a>
								 </c:if>
						
						</div>
					</nav>  
				</div>
				
				<div style="text-align: right"><a class="btn btn-dark" href="${pageContext.request.contextPath}/teacher/coupon/couponForm">쿠폰등록하기</a></div>
				
		</section>
		
</body>
</html>