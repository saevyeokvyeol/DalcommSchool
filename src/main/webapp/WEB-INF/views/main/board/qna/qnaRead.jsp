<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>QnA :상세보기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
	    $("input[value=삭제하기]").click(function(){
		   
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/qna/qnaDelete");
			   $("#requestForm").submit();
		   
	   })
	   
	   
	   // 선택한 QnA글 가지고 수정폼으로 가기
		$(".updateForm").click(function() {
			//alert(${qnaId});
			$.ajax({
				url : "${pageContext.request.contextPath}/qnaUpdateForm",
				type : "post",
				data: {
					"${_csrf.parameterName}":"${_csrf.token}",
					"qnaId" : ${qnaId}
				},
				success : function(result) {
					//alert(result)
					//$("#qna-main-update .qnaId").val(`\${result.qnaId}`);
					$("#qna-main-update .qnaTitle").val(`\${result.qnaTitle}`);
					$("#qna-main-update .qnaContent").val(`\${result.qnaContent}`);
					$("#qna-main-update .secretState").val(`\${result.secretState}`);
				},
				error : function(error) {
					alert("QnA 글을 가져올 수 없습니다.");
				}
			}); // 아작스 종료
		})//$(".updateForm").click 끝
	   
	   
		
	});
</script>
</head>
<body>

<div class="main-content">

    <div >
        <table class="table">
        	<tr>
            	<th></th>
        		<td><input type="hidden" name="qnaId" value="${qna.qnaId}"></td>
            </tr> 
        	<tr>
                <th>작성자&nbsp;&nbsp;</th>
                <td>${qna.student.studentId.substring(0,4)}****</td>
                <th>등록일자&nbsp;&nbsp;</th>
                <td>
                	<span><fmt:parseDate value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
                	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
                </td>
                <th>&nbsp;&nbsp;수정일자&nbsp;&nbsp;</th>
                <td>
                	<span><fmt:parseDate value="${qna.qnaUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
                	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td>${qna.qnaTitle}</td>
                <th>답변완료&nbsp;&nbsp;</th>
                <td>${qna.qnaComplete}</td>
            </tr>
            <tr>
                <th>내용</th>
                <td>${qna.qnaContent}</td>
            </tr>    
        </table>
        
        <!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<form name="requestForm" method="post" id="requestForm">
			<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type=hidden name="qnaId" value="${qna.qnaId}">
			<input type=hidden name="classId" value="${qna.classes.classId}" id="classId">
			<input type=hidden name="studentId" value="${qna.student.studentId}" id="studentId">
			
			<c:choose>
				<c:when test="${qna.qnaComplete eq 'T'}">
 					<input type=hidden value="수정하기" >
					<input type=hidden value="삭제하기" >
				</c:when>
				<c:otherwise>
					<!-- Button trigger modal -->
					<button type="button" class="btn btn-outline-primary updateForm" data-bs-toggle="modal" data-bs-target="#exampleModal" id="">
				  	수정하기
					</button>
					<input class="btn btn-outline-primary"  type=button value="삭제하기" >
				</c:otherwise>
			</c:choose>
		</form>
        
    </div>
        <hr>
    <div >
        <table>
            <c:choose>
            	<c:when test="${qna.qnaComplete eq 'T'}">
            		<tr>
		                <th>작성자</th>
		                <td>${qnaReply.teacher.teacherId}</td>
		                <th>등록일자</th>
		                <td>
		                	<span><fmt:parseDate value="${qnaReply.replyInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		                	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		                </td>
		                <th>수정일자</th>
		                <td>
		                	<span><fmt:parseDate value="${qnaReply.replyUpdateDate}" pattern="yyyy-mm-dd" var="updateDate"/></span>
		                	<span><fmt:formatDate value="${updateDate}" pattern="yyyy-mm-dd"/></span>
		                </td>
				    </tr>
		            <tr>
		                <th>내용</th>
		                <td>${qnaReply.replyContent}</td>
		            </tr>
            	</c:when>
            </c:choose>
        	
            
        </table>
    </div>
    
    <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/main/board/qna/qnaList">목록으로 돌아가기</a>&gt;</span></div>

</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Q&A글 수정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      	<!--QnA 수정하기-->
          <div class="card" style="width: 29rem;">
            <div class="card-body">
              <form name="qna-main-update" method="post" id="qna-main-update" action="${pageContext.request.contextPath}/main/board/qna/qnaUpdate" >
                <input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
                <%-- <input type="hidden" name="classId" value="${qna.classes.classId}">
                <input type="hidden" name="studentId" value="${qna.student.studentId}">
                --%>
                <input type="hidden" name="classId" value="2">
                <input type="hidden" name="studentId" value="lee1234">
                <div>
				  Q&A 글번호
				  <input class="form-control" type=text name="qnaId" id="qnaId" value="${qna.qnaId}" required readonly="readonly">
				</div>
                <div>
				  제목
				  <input class="form-control" type=text name="qnaTitle" size="30" id="qnaTitle" value="${qna.qnaTitle}">
				</div>
				<div>
				  내용 
				  <textarea class="form-control" name="qnaContent" id="qnaContent" rows="10" cols="33">${qna.qnaContent}</textarea>	
				</div>
				<div>
				  비밀글 체크 
				  <input class="form-check-input" type="checkbox" id="inlineFormCheck" name="secretState" value="T">공개
				  <input class="form-check-input" type="checkbox" id="inlineFormCheck" name="secretState" value="F">비공개
				</div>
				<div class="modal-footer">
			      <input type="submit" class="btn btn-primary" id="qna-update-btn" value="수정하기">
			      <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
		      	</div>
              </form>
            </div>
         </div>
      </div>
      
    </div>
  </div>
</div>


</body>
</html>