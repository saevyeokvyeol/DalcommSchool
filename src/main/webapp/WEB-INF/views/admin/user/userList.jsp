<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
	
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
		$('#myModal').on('shown.bs.modal', function () {
			  $('#myInput').trigger('focus')
			})
	</script>


</head>
<body>
<h2>관리자용 회원 조회 페이지 입니다</h2>
	
<div class="col-sm-12">	
	<form action="${pageContext.request.contextPath}/admin/user/userSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	       <select name = "keyfield">
	          <option value = "studentID" selected>아이디</option>
	          <option value = "studentName">이름</option>
	          <option value = "studentPhone">연락처</option>
	          <option value = "studentEmail">이메일</option>
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
                <c:when test ="${empty studentList}">
                    <tr>
                        <th colspan="10">
                            <span> 조회할 회원 정보가 없습니다.</span>
                        </th>
                    </tr>
                </c:when>
                
                 <c:when test ="${not empty studentList}">
		              <c:forEach items="${studentList}" var="student">
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
		                            <td><span><fmt:parseDate value="${student.studentInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span></td>
		                            <td><span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span></td>
		                            <td><span>${student.studentQuit}</span></td>
		                        </tr>
                    	</c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>


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
</body>
</html>