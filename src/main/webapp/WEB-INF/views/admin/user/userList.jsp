<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>관리자용 회원 조회 페이지 입니다</h2>
	
	
	<form action="${pageContext.request.contextPath}/admin/user/userSearch" method="post">
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
                        <th colspan="6">
                            <span> 조회할 회원 정보가 없습니다.</span>
                        </th>
                    </tr>
                </c:when>
                
                 <c:when test ="${not empty studentList}">
		              <c:forEach items="${studentList}" var="student">
		                        <tr>
		                            <td><span>${student.studentId}</span></td>
		                            <td><span>${student.studentName}</span></td>
		                            <td><span>${student.studentPhone}</span></td>
		                            <td><span>${student.studentEmail}</span></td>
		                            <td><span>${student.studentInsertDate}</span></td>
		                            <td><span>${student.studentQuit}</span></td>
		                        </tr>
                    	</c:forEach>
                </c:when>
            </c:choose>
        </tbody>
    </table>


</body>
</html>