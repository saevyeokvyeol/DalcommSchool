<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선생님 : 전체 발급 쿠폰 조회</title>
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
		
		
		//쿠폰상태변경 버튼으로
		$(document).on("click", ".couponStateChange", function() {
			
			$.ajax({
				url: "${pageContext.request.contextPath}/teacher/coupon/changeCouponState",
				type: "post",
				dataType : "text",
				data: {"${_csrf.parameterName}": "${_csrf.token}", couponId: $(this).parent().siblings().eq(1).text(), couponStateId: $(this).val()},
				success: function(result) {
					alert("수정되었습니다.");
					document.location.reload(true);
				},
				error: function(err) {
					alert(err + "\n에러발생");
				}
			}) // ajax 종료	
			
		})//onchang 끝	
		
		
		
		//선생님이 보유한 클래스명 가져오기
			$.ajax({
				url: "/teacher/selectByTeacherId",
				type: "post",
				data: {"${_csrf.parameterName}": "${_csrf.token}"},
				dataType: "json",
				success: function(result){
// 					alert(result);
					text = ""
					$.each(result, function(index, item){
						text += `<option value='\${item.classId}'>\${item.className}</option>`;
					})
					text += ""
					$("select[name = classId]").append(text);
				},
				error: function(err){
					
					alert("클래스명을 가져올 수 없습니다.")
				}		
			}) //ajax 끝
		
		
		// 선택한 쿠폰값 가지고 수정폼으로 가기
		$(".updateForm").click(function() {
			
			$.ajax({
				url : "${pageContext.request.contextPath}/couponUpdateForm",
				type : "post",
				data: {
					"${_csrf.parameterName}":"${_csrf.token}",
					"couponId" : $(this).parent().siblings().eq(1).text()
				},
				success : function(result) {
					//alert(result)
					$("#coupon-teacher-update .couponId").val(`\${result.couponId}`);
					$("#coupon-teacher-update .couponName").val(`\${result.couponName}`);
					$("#coupon-teacher-update .couponDc").val(`\${result.couponDc}`);
					$("#coupon-teacher-update .couponEndDate").val(`\${result.couponEndDate}`);
				},
				error : function(error) {
					alert("쿠폰번호를 가져올 수 없습니다.");
				}
			}) // 아작스 종료
		});//$(".updateForm").click 끝
		
		
		$(".deleteCoupon").click(function() {
			if(!confirm('정말로 삭제하시겠습니까?')){
				return false;
			}
		}); //$(".deleteCoupon").click 끝
		
		//쿠폰등록시 값 비워져있으면 alert 창 띄우기
		$(".coupon-insert-btn").click(function() {
			let classId = $(".select-classId").val();
			let couponName = $(".couponName-insert").val();
			let couponDc = $(".couponDc-insert").val();
			let couponEndDate = $(".couponEndDate-insert").val();
			
			if(classId==0){
				alert("클래스명을 선택해주세요");
				return false;
			}else if(couponName==""){
				alert("쿠폰이름을 적어주세요");
				return false;
			}else if(couponDc==""){
				alert("할인금액을 적어주세요");
				return false;
			}else if(couponEndDate==""){
				alert("사용기간을 적어주세요");
				return false;
			}
				
		});
		
		
	}); //ready 끝	
	
</script>


</head>
<body>

<div class="teacher-main-content">
	<section>

			<h1>전체쿠폰조회 </h1>
			
			<table class="table" id="couponTable">
				<thead>
					<tr>
						<th>클래스명</th>
						<th>쿠폰ID</th>
						<th>쿠폰명</th>
						<th>할인금액</th>
						<th>등록일자</th>
						<th>사용기간</th>
						<th>쿠폰상태</th>
						<th>삭제하기</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
	                    <c:when test ="${empty requestScope.list.content}">
	                        <tr>
	                            <th colspan="8">
	                                <span> 클래스 내 발급 가능한 쿠폰이 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.list.content}" var="coupon">
	                            <tr>
	                            	<td>${coupon.classes.className}</td>
	                                <td>${coupon.couponId}</td>
	                                <td>
	                                	<button type="button" class="btn btn-light updateForm" data-bs-toggle="modal" data-bs-target="#exampleModal2" value="${coupon.couponId}">
										${coupon.couponName}</button>
									</td>
	                                <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${coupon.couponDc}"/>원</td>
	                                <td>
			                        	<span><fmt:parseDate value="${coupon.couponInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
			                        </td>
	                                <td>${coupon.couponEndDate}일</td>
	                                <td>
	                                	<c:choose>
											<c:when test="${coupon.couponState.couponStateId == '1'}">
												<button type="button" class="btn btn-secondary couponStateChange" id="couponStateChange" value="1">
													${coupon.couponState.couponStateName}
												</button>
											</c:when>
											<c:when test="${coupon.couponState.couponStateId == '2'}">
												<button type="button" class="btn btn-primary couponStateChange" id="couponStateChange" value="2">
													${coupon.couponState.couponStateName}
												</button>
											</c:when>
										</c:choose>	
										<%-- <select name="select_couponStateName" id="select_couponStateName" class="form-select">
											<c:choose>
											<c:when test="${coupon.couponState.couponStateId == '1'}">
												<option name="couponStateId" value="1">${coupon.couponState.couponStateName}</option>
												<option name="couponStateId" value="2">발급중지</option>
											</c:when>
											<c:when test="${coupon.couponState.couponStateId == '2'}">
												<option name="couponStateId" value="2">${coupon.couponState.couponStateName}</option>
												<option name="couponStateId" value="1">발급</option>
											</c:when>
											</c:choose>	        
	        							</select> --%>
	        						</td>
	        						<!-- <td>
										<button type="button" class="btn btn-primary updateForm" data-bs-toggle="modal" data-bs-target="#exampleModal2" id="">
											수정하기
										</button>
									</td> -->
									<td>
										<form method="post" id="delete" action="${pageContext.request.contextPath}/teacher/coupon/couponDelete">
											<input type="hidden" name="couponId" value="${coupon.couponId}">
											<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
											<input class="btn btn-primary deleteCoupon" type="submit" value="삭제하기">
											
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
			
			<!-- Button trigger modal 쿠폰등록하기-->
			<div style="text-align: right">
				<button type="button" class="btn btn-dark mt-3 insertForm" data-bs-toggle="modal" data-bs-target="#exampleModal">
			  	쿠폰등록하기
				</button>
			</div>
			
			<!-- Modal 쿠폰등록하기-->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">쿠폰 등록하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div class="card" style="width: 28rem;">
			        <div class="card-body">
			           <sec:authorize access="isAuthenticated()">
 					   <sec:authentication property="principal" var="teacher"/>
			           <form name="coupon-teacher-insert" method="post" id="coupon-teacher-insert" action="${pageContext.request.contextPath}/couponInsert"">
			            <input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			             <div>
			             	<!-- 선생님ID -->
			             	<!-- <input type="hidden" name="teacherId" value="Tkim1234" id="teacherId" required readonly="readonly"> -->
			           		<%-- <input type="hidden" name="teacherId" value="${coupon.teacher.teacherId}" id="teacherId"> --%>
			             </div>
			             <div>
			             	클래스명
			             	<select name="classId" id="classId" class="form-select select-classId">
						        <option value="0">-클래스 선택-</option>          
						    </select>
			             </div>
			             <div>
			               쿠폰상태 
			              <input class="form-control" type="hidden" name="couponStateId" id="couponStateId" value="2" >
			              <input  class="form-control" type="text" value="발급중지" readonly="readonly">
			             </div>
			             <div>
			               쿠폰명 
			               <input class="form-control couponName-insert" type="text" name="couponName" id="couponName">	
			             </div>
			             <div>
			               할인금액 
			               <input class="form-control couponDc-insert" type="text" name="couponDc" id="couponDc" placeholder="숫자만 입력해주세요.">	
			             </div>
			             <div>
			               사용기간 
			               <input class="form-control couponEndDate-insert" type="number" name="couponEndDate" id="couponEndDate" placeholder="숫자로 입력해주세요.">	
			             </div>
			             
			                <div class="modal-footer">
			                  <input type="submit" class="btn btn-primary coupon-insert-btn" id="coupon-insert-btn" value="등록하기">
			                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			                </div>
			            </form>
			            </sec:authorize>
			         </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>				
			
			<!-- Modal 쿠폰수정하기-->
			<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">쿠폰 수정하기</h5>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <div class="card" style="width: 28rem;">
			        <div class="card-body">
			           <form name="coupon-teacher-update" method="post" id="coupon-teacher-update" action="${pageContext.request.contextPath}/teacher/coupon/couponUpdate"">
			            <input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			             <div>
			               <!-- 쿠폰ID --> 
			              <input class="form-control couponId" type="hidden" name="couponId" id="couponId" required readonly="readonly">	
			             </div>
			             <div>
			               쿠폰명 
			               <input class="form-control couponName" type="text" name="couponName" id="couponName" value="${coupon.couponName}">	
			             </div>
			             <div>
			               할인금액 
			               <input class="form-control couponDc" type="text" name="couponDc" id="couponDc" value="${coupon.couponDc}">	
			             </div>
			             <div>
			               사용기간 
			               <input class="form-control couponEndDate" type="number" name="couponEndDate" id="couponEndDate" value="${coupon.couponEndDate}">	
			             </div>
			             
			                <div class="modal-footer">
			                  <input type="submit" class="btn btn-primary" id="coupon-update-btn" value="수정하기">
			                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			                </div>
			            </form>
			         </div>
			        </div>
			      </div>
			    </div>
			  </div>
			</div>				
			
			
	</section>
</div>
		
</body>
</html>