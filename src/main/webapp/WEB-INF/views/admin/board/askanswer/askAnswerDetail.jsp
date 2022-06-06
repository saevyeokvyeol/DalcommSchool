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

<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
  		   <tr>  
		        <td>
		           글 번호 : ${askAnswerDetail.askNo}<p>
		        </td>
		        <td>
		        	문의 ID : ${askAnswerDetail.student.studentId}<p>
		        </td>
		        <td>
		        	문의제목 : ${askAnswerDetail.askTitle}<p>
		        </td>
		        <td>
				    카테고리 : ${askAnswerDetail.askCategory.askCategoryId}<p>
		        </td>
		        <td>
		            문의 내용 : ${askAnswerDetail.askContent}<p>
		        </td>
		        <td>
		        	문의 일자 : ${askAnswerDetail.askInsertDate}<p>
		        </td>
		    </tr>
</table>
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/board/askanswer/askAnswerList">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>