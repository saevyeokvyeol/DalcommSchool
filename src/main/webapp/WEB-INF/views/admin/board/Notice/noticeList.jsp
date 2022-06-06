<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
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
		width: 500px;
	}
</style>

<head>

<h1>Notice 리스트</h1>
	<form action="${pageContext.request.contextPath}/admin/board/Notice/noticeSearch" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	       <select name = "keyfield">
	          <option value = "noticeTitle" selected>제목</option>
	          <option value = "noticeContent">내용</option>
	       </select>
	       <input type="text" id="keyword" name="keyword">
     	  <input type="submit" id="search" value="검색">
    </form>
    
    <hr><!-- 구분선 -->
    
    <table>
    	<thead>
    	<tr>
    	
             <th>글번호</th>
             <th>제목</th>
             <th>내용</th>
         </tr>
    	</thead>
	<tbody>
		<c:choose>
			<c:when test="${empty notice}">
				<tr>
					<th colspan="10">
					<span> 검색할 정보가 없습니다.</span>
					</th>
				</tr>
			</c:when>

			<c:when test="${not empty notice}">
				<c:forEach items="${requestScope.notice}" var="notice">
					<tr>
						<td><span>${notice.noticeNo}</span></td>
						<td><span><a href="${pageContext.request.contextPath}/admin/board/Notice/noticeRead/${notice.noticeNo}">
									${notice.noticeTitle}</a></span></td>

						<td><span>${notice.noticeContent}</span></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
</table>
  
  <hr><!-- 구분선 -->
  
<button type="button" class="btn btn-primary" onclick="location.href='${pageContext.request.contextPath}/admin/board/Notice/write'">등록하기</button>
<button type="button" class="btn btn-danger" onclick="">삭제</button>

</head>
</body>

</html>