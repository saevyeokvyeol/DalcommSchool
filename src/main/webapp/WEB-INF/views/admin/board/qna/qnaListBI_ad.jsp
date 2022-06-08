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

<title>QnA: 전체보기 - 관리자</title>

<script type="text/javascript">
	$(function(){
		
		
		$("button").click(function(){
			var target =$(this).attr("name")
			
			$.ajax({
	        url: "${pageContext.request.contextPath}/admin/board/qna/qnaBlind" , //서버요청주소
	        type: "post" , //요청방식 (get,post...)
	        data: {"${_csrf.parameterName}": "${_csrf.token}", qnaId: target, blindState: 'T'} , //서버에게 보낼 데이터정보(parameter정보)
	        
	        success: function(result){
	            alert("블라인드 처리되었습니다.")
	            location.reload()
	        },
	
	        error: function(err){//실패했을 때 콜백함수
	            alert(err+"오류가 발생했습니다.")
	        } 
	
	        })
		})
	})
</script>
</head>
<body>

    <div>
        <table>
            <thead>
            	<tr>
            		
            	</tr>
                <tr>
	                <th>번호</th>
	                <th>클래스</th>
	                <th>작성자</th>
	                <th>제목</th>
	                <th>등록일자</th>
	                <th>답변완료</th>
	                <th>블라인드유무</th>
	                <th>블라인드처리</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test ="${empty requestScope.list}">
                        <tr>
                            <th colspan="8">
                                <span> 등록된 Q&A가 없습니다.</span>
                            </th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.list}" var="qna">
                            <tr>
                                <td><span>${qna.qnaId}</span></td>
                                <td><span>${qna.classes.classId}</span></td>
                                <td><span>${qna.student.studentId}</span></td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/main/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a>
                                </td>
                                <td><span>${qna.qnaInsertDate}</span></td>
                                <td><span>${qna.qnaComplete}</span></td>
                                <td><span>${qna.blindState}</span></td>
                                <td>
                                	<c:choose>
                                        <c:when test="${qna.blindState eq 'F'}">
                                            <button type="button" class="btn btn-danger" name="${qna.qnaId}" value="F">게시글 숨기기</button>
                                        </c:when>
                                        <c:when test="${qna.blindState eq 'T'}">
                                            <button type="button" class="btn btn-secondary" name="${qna.qnaId}" value="T">블라인드 처리됨</button>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
    <hr>
     


</body>
</html>