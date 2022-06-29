<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA: 전체보기 - 관리자</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
	
/* 	.pagination{ */
/* 		display: block; */
/* 		text-align: center; */
/* 	} */

</style>

<script type="text/javascript">
$(function(){
	
	//블라인드처리
	$(".blind").click(function(){
		var target =$(this).attr("name")
		
		$.ajax({
        url: "${pageContext.request.contextPath}/admin/board/qna/qnaBlind" , //서버요청주소
        type: "post" , //요청방식 (get,post...)
        data: {"${_csrf.parameterName}": "${_csrf.token}", qnaId: target, blindState: 'T'} , //서버에게 보낼 데이터정보(parameter정보)
        
        success: function(result){
            swal("블라인드 처리되었습니다.")
            location.reload()
        },

        error: function(err){//실패했을 때 콜백함수
            swal(err+"오류가 발생했습니다.")
        } 

        })
	})// $("button").click 끝
	
	//글 상세보기
	$(".qnaTitle").click(function(){
			//swal($(this).val());
			
			$.ajax({
				url:"${pageContext.request.contextPath}/main/board/qna/qnaRead",
				type: "post",
				data:{"${_csrf.parameterName}": "${_csrf.token}",
					  "qnaId" : $(this).val()	
				},
				dataType:"json",
				success : function(result) {
				
					$("#qnaDetail-form #qnaId").html(`\${result.qnaId}`); //span, div 같은 태그에는 .html 속성으로 부여.
					$("#qnaDetail-form #studentId").html(`\${result.studentId}`);
					$("#qnaDetail-form #className").html(`\${result.className}`);
					$("#qnaDetail-form #qnaInsertDate").html(`\${result.qnaInsertDate.toString().substring(0, 10)}`);
					$("#qnaDetail-form #qnaTitle").html(`\${result.qnaTitle}`);
					$("#qnaDetail-form #qnaComplete").html(`\${result.qnaComplete}`);
					$("#qnaDetail-form #qnaContent").html(`\${result.qnaContent}`);
					//$("#deleteId").val(`\${result.qnaId}`);
					
					let complete = result.qnaComplete;
					if(complete == "T"){
						
						$("#replyId").html(`\${result.replyId}`);
						$("#teacherNickname").html(`\${result.teacherNickname}`);
						$("#replyInsertDate").html(`\${result.replyInsertDate.toString().substring(0, 10)}`);
						$("#replyContent").html(`\${result.replyContent}`);
						
						//$("#requestForm").remove();
						
					} else {
						$("#replyDetail-form").text("")
						$("#replyDetail-Card-body").remove();
					}
					
				},
				error: function(err){
					swal(err + "에러 발생");
				}
			})//ajax 끝
		})// $(".qnaTitle").click 끝
	
})
</script>
</head>
<body>


	<section>
        <table class="table">
            <thead>
            	<tr>
            		
            	</tr>
                <tr>
	                <th>번호</th>
	                <th>클래스명</th>
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
                    <c:when test ="${empty requestScope.list.content}">
                        <tr>
                            <th colspan="8">
                                <span> 등록된 Q&A가 없습니다.</span>
                            </th>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${requestScope.list.content}" var="qna">
                            <tr>
                                <td><span>${qna.qnaId}</span></td>
                                <td><span>${qna.classes.className}</span></td>
                                <td><span>${qna.student.studentId}</span></td>
                                <td>
                                    <%-- <a href="${pageContext.request.contextPath}/admin/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a> --%>
                                    <button class="btn btn-light qnaTitle" data-bs-toggle="modal" data-bs-target="#exampleModal2" value="${qna.qnaId}">${qna.qnaTitle}</button>
                                </td>
                                <td>
		                        	<span><fmt:parseDate value="${qna.qnaInsertDate}" pattern="yyyy-mm-dd" var="parseDate"/></span>
		                        	<span><fmt:formatDate value="${parseDate}" pattern="yyyy-mm-dd"/></span>
		                        </td>
                                <td>
			                        <c:choose>
			                        	<c:when test="${qna.qnaComplete == 'F'}">
			                        		<span class="badge bg-secondary">미답변</span>
			                        	</c:when>
			                        	<c:when test="${qna.qnaComplete == 'T'}">
			                        		<span class="badge bg-primary">답변 완료</span>
			                        	</c:when>
			                        </c:choose>
		                        </td>
                                <td>
                                	<c:choose>
			                        	<c:when test="${qna.blindState == 'F'}">
			                        		<span class="badge bg-secondary"></span>
			                        	</c:when>
			                        	<c:when test="${qna.blindState == 'T'}">
			                        		<span class="badge bg-primary">블라인드</span>
			                        	</c:when>
			                        </c:choose>
                                </td>
                                <td>
                                	<c:choose>
                                        <c:when test="${qna.blindState eq 'F'}">
                                            <button type="button" class="btn btn-primary blind" name="${qna.qnaId}" value="F">게시글 숨기기</button>
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
        
        <%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
			
<!--  페이징처리  -->
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:set var="doneLoop" value="false" />
					<c:if test="${(startPage-blockCount) > 0 and list.content.size() != 0}">
						<li class="page-item">
							<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
						</li>
					</c:if>
						<c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount<list.totalPages?(startPage-1)+blockCount:list.totalPages}'>
							<c:if test="${(i-1)>=list.getTotalPages()}">
								<c:set var="doneLoop" value="true" />
							</c:if>
							<c:if test="${not doneLoop}">
								<li class="page-item"><a class="page-link ${i==page?'active':'page'}" href="${URL}?page=${i}">${i}</a></li>
							</c:if>
						</c:forEach>
					<c:if test="${(startPage+blockCount) <= list.getTotalPages()}">
						<li class="page-item">
							<a class="page-link" href="${URL}?${location.search}page=${startPage+blockCount}">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
	</section>

<!-- QnA 상세보기 모달 -->
<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel2">Q&A 글 상세보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="card" style="width: 29rem;" id="qnaDtail-Card-body">
          <div class="card-body">
			<form id="qnaDetail-form">
				<div>답변완료&nbsp;&nbsp;<span id="qnaComplete"></span></div>
			    <div>글번호&nbsp;&nbsp;<span id="qnaId"></span></div>
			    <div>작성자&nbsp;&nbsp;<span id="studentId"></span></div>
			    <div>클래스 이름&nbsp;&nbsp;<span id="className"></span></div>
			    <div>작성 날짜&nbsp;&nbsp;<span id=qnaInsertDate></span></div>
			    <div>제목&nbsp;&nbsp;<span id="qnaTitle"></span></div>
			    <div>내용&nbsp;&nbsp;</div>
			    <div id="qnaContent"></div>
			</form>
		  </div>
        </div>
        
		
	<!-- 강사 답변글 -->
	  <div class="modal-body">
        <div class="card" style="width: 27rem;" id="replyDetail-Card-body">
          <div class="card-body">
			<form id="replyDetail-form">
			    <div>글번호&nbsp;&nbsp;<span id="replyId"></span></div>
			    <div>작성자&nbsp;&nbsp;<span id="teacherNickname"></span></div>
			    <div>작성 날짜&nbsp;&nbsp;<span id="replyInsertDate"></span></div>
			    <div>내용&nbsp;&nbsp;</div>
			    <div id="replyContent"></div>	
			</form>
		  </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-dark" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
 </div>
</div>  


</body>
</html>