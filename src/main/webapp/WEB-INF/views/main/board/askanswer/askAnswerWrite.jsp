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

<form name="writeForm" method="post" action="${pageContext.request.contextPath}/main/board/askanswer/insert" >
	 <select name="askCategoryId">
		  <option value="">카테고리 종류</option>
		  <option value="1">클래스</option>
		  <option value="2">결제</option>
		  <option value="3">환불</option>
		  <option value="4">후기</option>
		  <option value="5">탈퇴</option>
	</select> 
<table>
    <tr>
        <td>
            ID : <input type="text" name="studentId"><p>
        </td>
    </tr>
    <tr>
        <td>
           	문의 제목 : <input type="text" name="askTitle"><p>
        </td>
    </tr>
    <tr>
    	<td>
    		문의 내용 : <textarea rows="" cols="" name="askContent"></textarea><p>
    	</td>
    </tr>
    <tr>
    	<td>
    		첨부 이미지 :<input type="image" name="askImg"><p>
    	</td>
  	</tr>
    
</table>
	<tr>
        <span><input type=submit value=글쓰기></span> 
        <span><input type=reset value=다시쓰기></span></td>
    </tr>
</form>

</body>
</html>