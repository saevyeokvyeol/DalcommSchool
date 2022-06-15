<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<title>Insert title here</title>

<style type="text/css">
	
	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}
	
	#badge1 {
		background-color: green;
	}
	
	#badge2 {
		background-color: red;
	}

	</style>

</head>
<body>
	
	<form action="${pageContext.request.contextPath}/admin/user/teacherSearch" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	    <div class="row g-3">
		<div class="col-md-6">
		</div>	 
		<div class="col-md-2">
	       <select name = "keyfield" class="form-select">
	          <option value = "teacherID" selected>아이디</option>
	          <option value = "teacherName">이름</option>
	          <option value = "teacherPhone">연락처</option>
	          <option value = "teacherEmail">이메일</option>
	       </select>
	     </div>
	     <div class="col-md-3">  
	       <input type="text" class="form-control" id="keyword" name="keyword">
     	 </div>
     	 <div class="col-md-1">
     	  <input type="submit" class="btn btn-primary" id="search" value="검색">
     	 </div>
    </div>
    </form>
    
    <hr><!-- 구분선 -->
    
  <table class="table">
        <thead>
            <tr>
             <th>아이디</th>
             <th>이름</th>
             <th>연락처</th>
             <th>이메일</th>
             <th>가입일</th>
             <th>회원상태</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test ="${empty teacherList}">
                    <tr>
                        <th colspan="6">
                            <span> 조회할 회원 정보가 없습니다.</span>
                        </th>
                    </tr>
                </c:when>
                
                 <c:when test ="${not empty teacherList}">
		              <c:forEach items="${teacherList.content}" var="teacher">
		                        <tr>
		                            <td>
		                            	<span>${teacher.teacherId}</span>
		                            </td>
		                            <td>
		                            	<span>${teacher.teacherName}</span>
		                            </td>
		                            <td>
			                            <span><c:set var="phone" value="${teacher.teacherPhone}"/>
			                            ${fn:substring(phone,0,3)} - ${fn:substring(phone,3,7)} - ${fn:substring(phone,7,13)}
			                            </span>
		                            </td>
		                            <td>
		                            	<span>${teacher.teacherEmail}</span>
		                            </td>
		                            <td>
			                            <span><fmt:parseDate value="${teacher.teacherInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
			                           <span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		                           </td>
		                            <td>
		                            	<c:if test="${teacher.teacherQuit == 'F'}">
			                            	<span class="badge rounded-pill text-bg-primary" id="badge1">활동중</span>
		                            	</c:if>
		                            	<c:if test="${teacher.teacherQuit == 'T'}">
			                            	<span class="badge rounded-pill text-bg-secondary" id="badge2">탈퇴</span>
		                            	</c:if>
		                            </td>
		                        </tr>
                    	</c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>
    
<!--  페이징처리  -->
<nav aria-label="Page navigation example">
	<ul class="pagination justify-content-center">
	<c:set var="doneLoop" value="false"/>
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <li class="page-item">
			      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${startPage-1}">PREV</a>
			  </li>
		  </c:if>
		  
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<teacherList.totalPages?(startPage-1)+blockCount:teacherList.totalPages}'> 
			    <c:if test="${(i-1)>=pageList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		  <c:if test="${not doneLoop}" >
			<li class="page-item">
		         <a class="page-link ${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${i}">${i}</a> 
			</li>
		  </c:if>
		</c:forEach>
				
		 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
			 <li class="page-item">  
			     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${startPage+blockCount}">NEXT</a>
			 </li>
		 </c:if>
		 </ul>
	</nav>  
</body>
</html>