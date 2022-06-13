<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생(자신)이 보유한 쿠폰 조회</title>
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
			<div><h1>쿠폰조회</h1></div>
			<table class="table">
		
			<div class="btn-group" role="group" aria-label="Basic outlined example">
				<form action="${pageContext.request.contextPath}/main/mypage/couponList">
					<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="couponUseable" value="useable">
			  		<button type="submit" class="btn btn-outline-primary couponbtn" value="useable">사용가능한 쿠폰</button>
				</form>
				<form action="${pageContext.request.contextPath}/main/mypage/couponList">
					<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="couponUseable" value="used">
					<button type="submit" class="btn btn-outline-primary couponbtn" value="used">사용한 쿠폰</button>
				</form>
			  	<form action="${pageContext.request.contextPath}/main/mypage/couponList">
					<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
					<input type="hidden" name="couponUseable" value="expired">
					<button type="submit" class="btn btn-outline-primary couponbtn" value="expired">만료된 쿠폰</button>
				</form>
			  
			</div>
		
			<thead>
				<tr>
					<th>쿠폰아이디</th>
					<th>쿠폰명</th>
					<th>할인금액</th>
					<th>쿠폰사용여부</th>
					<th>쿠폰발행일</th>
					<th>쿠폰만료일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
                    <c:when test ="${empty requestScope.issueCouponList.content}">
                        <tr>
                            <th colspan="6">
                                <span> 보유한 쿠폰이 없습니다.</span>
                            </th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.issueCouponList.content}" var="issueCoupon">
                            <tr>
                                <td>${issueCoupon.coupon.couponId}</td>
                                <td>${issueCoupon.coupon.couponName}</td>
                                <td>${issueCoupon.coupon.couponDc}원</td>
                                <td>${issueCoupon.issueUsable}</td>
                                <td>
		                        	<span><fmt:parseDate value="${issueCoupon.issueStartDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		                        </td>
		                        <td>
		                        	<span><fmt:parseDate value="${issueCoupon.issueStartDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
		                        	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
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
					      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/mypage/couponList?nowPage=${startPage-1}">PREV</a>
					  </c:if>
					  
							<span class="pagination-inner"> 
							  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
							  
								<c:if test="${(i-1)>=pageList.getTotalPages()}">
								       <c:set var="doneLoop" value="true"/>
								</c:if> 
							     
							    <c:if test="${not doneLoop}" >
							         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/mypage/couponList?nowPage=${i}">${i}</a> 
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
							     <a class="pagination-older" href="${pageContext.request.contextPath}/main/mypage/couponList?nowPage=${startPage+blockCount}">NEXT</a>
							 </c:if>
					
					</div>
				</nav>  
			</div>
			
			
		</section>

</div>
		
</body>
</html>