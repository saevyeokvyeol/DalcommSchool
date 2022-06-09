<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지용 리뷰 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script type="text/javascript">
  $(function(){
	  
	  $("button").click(function(){
			var target =$(this).attr("name")
			
			$.ajax({
	        url: "${pageContext.request.contextPath}/main/board/review/blind" , //서버요청주소
	        type: "post" , //요청방식 (get,post...)
	        data: {"${_csrf.parameterName}": "${_csrf.token}", reviewId: target, reviewBlindState: 'true'} , //서버에게 보낼 데이터정보(parameter정보)
	        
	        success: function(result){
	            alert("블라인드 처리되었습니다.")
	            location.reload()
	        },
	
	        error: function(err){//실패했을 때 콜백함수
	            alert(err+"오류가 발생했습니다.")
	        } 
	
	        })
		})
  })
</script>
</head>
<body>
	
	<table>
		  <thead>
		    <tr>
		      <th>아이디</th>
		      <th>별점</th>
		      <th>클래스 이름</th>
		      <th>내용</th>
		      <th>작성 날짜</th>
		      <th>블라인드 유무</th>
		      <th>블라인드 처리</th>
		    </tr>
		  </thead>
		  <tbody>
		    <c:choose>
		      <c:when test="${requestScope.classReviews.content==null}">
		        <tr>
		          <th colspan="7">
		            <span>등록된 후기가 없습니다.</span>
		          </th>
		        </tr>
		      </c:when>
		      <c:otherwise>
		        <c:forEach items="${classReviews.content}" var="review">
		          <div id="review">
		          <tr>
		            <td><span>${review.student.studentId}</span></td>
		            <td><span>${review.reviewRate}</span></td>
		            <td><span>${review.classes.className}</span></td>
		            <td><a href="${pageContext.request.contextPath}/main/board/review/read/${review.reviewId}">${review.reviewContent}</a></td>
		            <td>
		            	<span><fmt:parseDate value="${review.reviewInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		            	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		            </td>
		            <td><span>${review.reviewBlindState}</span></td>
		            <td>
                   	  <c:choose>
                         <c:when test="${review.reviewBlindState eq 'false'}">
                             <button type="button" class="btn btn-danger" name="${review.reviewId}" value="false">게시글 숨기기</button>
                         </c:when>
                         <c:when test="${review.reviewBlindState eq 'true'}">
                             <button type="button" class="btn btn-secondary" name="${review.reviewId}" value="true">블라인드 처리됨</button>
                         </c:when>
                      </c:choose>
	                </td>
		          </tr>
				  </div>
		        </c:forEach>
		      </c:otherwise>
		    </c:choose>
		  </tbody>
		</table>
		
		<!-- 페이징 처리 -->
		<div>
		  <nav class="pagination-container">
		    <div class="pagination">
		      <c:set var="doneLoop" value="false"/>
		      		<c:if test="${(startPage-blockCount)>0 }">
		      		  <a class="pagination-newer" href="${pageContext.request.contextPath}/main/board/review/list?nowPage=${startPage-1}">이전</a>	      		
		      		</c:if>
		      		
		      		<span class="pagination-inner">
		      		  <c:forEach var='i' begin="${startPage}" end="${(startPage-1)+blockCount}">
		      		    
		      		    <c:if test="${(i-1)>=classReviews.getTotalPages()}">
		      		      <c:set var="doneLoop" value="true"/>
		      		    </c:if>
		      		    <c:if test="${not doneLoop}">
		      		      <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/board/review/list?nowPage=${i}">${i}</a>
		      		    </c:if>
		      		    
		      		  </c:forEach>
		      		</span>
		      		
		      		<c:if test="${(startPage+blockCount)<=classReviews.getTotalPages()}">
		      		  <a class="pagination-older" href="${pageContext.request.contextPath}/main/board/review/list?nowPage=${startPage+blockCount}">다음</a>
		      		</c:if>
		    </div>
		  
		  </nav>
		</div>
	

</body>
</html>