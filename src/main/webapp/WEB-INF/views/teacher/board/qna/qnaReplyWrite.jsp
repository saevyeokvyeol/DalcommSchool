<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>선생님 : Q&A 답변 등록하기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
		
		/*$("input[value=답변등록하기]").click(function(){
		   
		   $("#reply-teacher-insert").attr("action", "${pageContext.request.contextPath}/qnaReplyInsert");
		   $("#reply-teacher-insert").submit();
	   })*/
		   
		
	});
</script>
</head>
<body>
    
    
    <!--답변하기-->
    <div class="card">
        <div class="card-body">
         	<form name="reply-teacher-insert" method="post" id="reply-teacher-insert" action="${pageContext.request.contextPath}/qnaReplyInsert">
         		<b>${qnaId}번 Q&A글에  답변 등록 </b>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="replyContent"></textarea>
                <%-- <input type=hidden name="qnaId" value="${classQna.qnaId}" id="qnaId">
				<input type=hidden name="teacherId" value="${teacher.teacherId}" id="teacherId">
                <input type="hidden" name="replyId" value="${replyId}"> --%>
                <input type=hidden name="qnaId" value="${qnaId}" id="qnaId">
                <%-- <input type=hidden name="teacherId" value="${teacherId}" id="teacherId"> --%>
				<input type=hidden name="teacherId" value="Tann1234" id="teacherId">
                
                <input type="submit" class="btn btn-dark mt-3" id="reply-insert-btn" value="답변등록하기">
         	 </form>
         </div>
     </div>
     <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/teacher/board/qna/qnaList_th">목록으로 돌아가기</a>&gt;</span></div>


</body>
</html>