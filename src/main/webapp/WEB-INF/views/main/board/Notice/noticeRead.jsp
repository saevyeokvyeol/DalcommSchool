<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<head> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
	
<script type="text/javascript">

	
</script>
<title>Insert title here</title>
</head>
<body>

<div id="sidebarHeader">
	<h3>공지사항</h3>
</div>
<table class="table" id="boardDetailTable">
	<tr> 
	    <td> <!-- 글 제목 -->
	    	<h4>${requestScope.notice.noticeTitle}</h4>
			<div id="date">${notice.noticeInsertDate.toString().substring(0, 10)}</div>
		</td>
	</tr>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
	<tr>
	     <td>
	     	<c:if test="${notice.noticeImg != null}">
	     		<img alt="" src="${pageContext.request.contextPath}/img/notice/${requestScope.notice.noticeImg}">
	     	</c:if>
			<pre><h6>${requestScope.notice.noticeContent}</h6></pre>
	     </td>
    </tr>
</table>
<a class="btn btn-primary" href="${pageContext.request.contextPath}/main/board/Notice/noticeList">목록으로</a>
</body>
</html>