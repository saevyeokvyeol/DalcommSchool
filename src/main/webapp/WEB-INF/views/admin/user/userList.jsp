<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style type="text/css">
	
	a{
		text-decoration: none;
	}
	table,th,td{
		text-align: center;
	}

	</style>
	
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').trigger('focus')
			})
	</script>


</head>
<body>
<h2>관리자용 회원 조회 페이지 입니다</h2>

<div class="main-content">
<div class="col-sm-12">	
	<form action="${pageContext.request.contextPath}/admin/user/userSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	       <select name = "keyfield" class="selectpicker">
	          <option value = "studentID" selected>아이디</option>
	          <option value = "studentName">이름</option>
	          <option value = "studentPhone">연락처</option>
	          <option value = "studentEmail">이메일</option>
	       </select>
	       <input type="text" id="keyword" name="keyword">
     	  <input type="submit" id="search" value="검색">
    </form>
    <hr><!-- 구분선 -->
    
  <table class="table table-striped table-hover">
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
                <c:when test ="${empty studentList}">
                    <tr>
                        <th colspan="10">
                            <span> 조회할 회원 정보가 없습니다.</span>
                        </th>
                    </tr>
                </c:when>
                
                 <c:when test ="${not empty studentList}">
		              <c:forEach items="${studentList.content}" var="student">
		                        <tr>
		                            <td><span>
		                            <a href="${pageContext.request.contextPath}/admin/user/studentDetail" id="popup_open_btn">
		                            ${student.studentId}</a></span></td>
		                            <td><span>${student.studentName}</span></td>
		                            <td><span>
		                            <c:set var="phone" value="${student.studentPhone}"/>
		                            ${fn:substring(phone,0,3)} - ${fn:substring(phone,3,7)} - ${fn:substring(phone,7,13)}
		                            </span></td>
		                            <td><span>${student.studentEmail}</span></td>
		                            <td><span><fmt:parseDate value="${student.studentInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		                            <span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span></td>
		                            <td><span>${student.studentQuit}</span></td>
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
		      <a class="pagination-newer" href="${pageContext.request.contextPath}/admin/user/userList?nowPage=${startPage-1}">PREV</a>
		  </c:if>
		  
		<span class="pagination-inner"> 
		  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
		  
			    <c:if test="${(i-1)>=pageList.getTotalPages()}">
			       <c:set var="doneLoop" value="true"/>
			    </c:if> 
		    
		  <c:if test="${not doneLoop}" >
		         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/admin/user/userList?nowPage=${i}">${i}</a> 
		  </c:if>
		   
		</c:forEach>
		</span> 
				
		 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
		     <a class="pagination-older" href="${pageContext.request.contextPath}/admin/user/userList?nowPage=${startPage+blockCount}">NEXT</a>
		 </c:if>
		</div>
	</nav>  
</div>

	<!-- 회원 Id 클릭시 모달창 팝업으로 뜨고 상세 정보 띄운다 -->
	 <!-- Button trigger modal -->
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
	  모달창 띄우자
	</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalCenterTitle">회원 정보 상세 - 수강 클래스</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	       	<table>
	       		<thead>
	       		<tr>
			       	<th>클래스명</th>
		            <th>수강일</th>
		            <th>수강인원</th>
		            <th>결제금액</th>
	            </tr>
	       		</thead>
       			<tbody>
<%-- 	       	<c:forEach items="" var=""> --%>
<!-- 	       		<tr> -->
<!-- 	       			<td></td> -->
<!-- 	       			<td></td> -->
<!-- 	       			<td></td> -->
<!-- 	       			<td></td> -->
<!-- 	       		</tr> -->
<%-- 	       	</c:forEach> --%>
	       	</tbody>
	       	</table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
</div>
</div>
</div>
</body>
</html>