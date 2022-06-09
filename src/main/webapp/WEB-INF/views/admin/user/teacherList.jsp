<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자용 강사 조회 페이지 입니다</h2>
	
	
	<form action="${pageContext.request.contextPath}/admin/user/teacherSearch" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	       <select name = "keyfield">
	          <option value = "teacherID" selected>아이디</option>
	          <option value = "teacherName">이름</option>
	          <option value = "teacherPhone">연락처</option>
	          <option value = "teacherEmail">이메일</option>
	       </select>
	       <input type="text" id="keyword" name="keyword">
     	  <input type="submit" id="search" value="검색">
    </form>
    
    <hr><!-- 구분선 -->
    
  <table>
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
		                            <td><span>${teacher.teacherId}</span></td>
		                            <td><span>${teacher.teacherName}</span></td>
		                            <td><span><c:set var="phone" value="${teacher.teacherPhone}"/>
		                            ${fn:substring(phone,0,3)} - ${fn:substring(phone,3,7)} - ${fn:substring(phone,7,13)}
		                            </span></td>
		                            <td><span>${teacher.teacherEmail}</span></td>
		                            <td><span><fmt:parseDate value="${teacher.teacherInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span></td>
		                            <td><span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span></td>
		                            <td><span>${teacher.teacherQuit}</span></td>
		                        </tr>
                    	</c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>
    
    <hr>
<%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
<div style="text-align: center">
		<!--  블럭당  -->
 <nav class="pagination-container">
	<div class="pagination">
	<c:set var="doneLoop" value="false"/>
		
		  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=pageList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/user/teacherList?nowPage=${startPage+blockCount}">NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>
    
</body>
</html>