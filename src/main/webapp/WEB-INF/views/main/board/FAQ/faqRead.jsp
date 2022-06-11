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

<head>

<div class="main-content">

	<h5> 고객센터 > 공지사항 </h5><br><hr>
	
<table align="center" class="table">
  
	<tr> 
		 <td> <!-- 글 제목 -->
	    	제목
	    </td>
	    <td> <!-- 글 제목 -->
	    	${requestScope.faq.faqTitle}
	    </td>
	</tr>
	<tr> 
		 <td> <!-- 글 제목 -->
	    	작성자
	    </td>
	    <td> <!-- 글 제목 -->
	    	관리자
	    </td>
	</tr>
	<tr> 
		 <td> <!-- 글 제목 -->
	    	작성일
	    </td>
		<td>
			<fmt:parseDate value="${faq.faqInsertDate}" pattern="yyyy-mm-dd" var="parseDate" scope="page"/>
			<fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/>
		</td>
	</tr>
	<tr> 
		 <td><!-- 글 제목 -->
            카테고리
        </td>
        <td>
        	${faq.faqCategory.faqCategoryName}
        </td>
	</tr>
		<!-- 브라우저에 글 내용을 뿌려줄 때는 개행문자(\n)가 <br>태그로 변환된 문자열을 보여줘야 한다. -->
	<tr>
	     <td colspan="2" style="text-align: center;">
			<img alt="" src="${pageContext.request.contextPath}/img/faq/${requestScope.faq.faqImg}">
			<span style="font-size:9pt;"><b><pre>${requestScope.faq.faqContent}</pre></b></span>
	     </td>
    </tr>
    
	<tr>
        <td>
        <!-- 관리자 버튼 권한-->
	        <div class="col-6 col-md-4">
				<form name="requestForm" method="post" id="requestForm">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
					<input type=hidden name="faqNo" value="${faq.faqNo}">
					
				</form>
			</div>
		</td>
		<td>
		</td>
	</tr>
	<tr>
		<td>
			<a class="btn btn-primary" href="${pageContext.request.contextPath}/main/board/FAQ/faqList" role="button" >목록으로</a>
		</td>
	</tr>
    </table>
    
    <form name="faqInfo" method="post">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		<input type=hidden name="faqNo" value="${faq.faqNo}">
	</form>
    
    </div>
    

</head>
</body>

</html>