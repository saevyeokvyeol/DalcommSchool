<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 자신이 쓴 QnA 글 전체 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	.pagination{
		display: block;
		text-align: center;
	}

</style>

<script type="text/javascript">
$(function() {
	
	$(".qnaTitle").click(function(){
			//alert($(this).val());
			
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
					$("#deleteId").val(`\${result.qnaId}`);
					
					let complete = result.qnaComplete;
					if(complete == "T"){
						
						$("#replyId").html(`\${result.replyId}`);
						$("#teacherNickname").html(`\${result.teacherNickname}`);
						$("#replyInsertDate").html(`\${result.replyInsertDate.toString().substring(0, 10)}`);
						$("#replyContent").html(`\${result.replyContent}`);
						
						$("#requestForm").remove();
						
					} else {
						$("#replyDetail-form").text("")
						$("#replyDetail-Card-body").remove();
					}
					
				},
				error: function(err){
					alert(err + "에러 발생");
				}
			})//ajax 끝
		})// $(".qnaTitle").click 끝
		
		
		 $(".deleteBtn").click(function(){
			   //alert(111);
			   $("#requestForm").attr("action", "${pageContext.request.contextPath}/main/board/qna/qnaDelete");
			   $("#requestForm").submit();
		   
	   })
	   
	   
	// 선택한 QnA글 가지고 수정폼으로 가기
		$(".updateBtn").click(function() {
			//alert($("#qnaDetail-form #qnaId").html());
			$.ajax({
				url : "${pageContext.request.contextPath}/qnaUpdateForm",
				type : "post",
				data:{
					"${_csrf.parameterName}":"${_csrf.token}",
					"qnaId" : $("#qnaDetail-form #qnaId").html()
				},
				success : function(result) {
					$("#exampleModal").modal("hide");
					
					$('body').removeClass('modal-open');
					$('.modal-backdrop').remove();
					
					//alert(result)
					$("#qna-main-update .qnaId").val(`\${result.qnaId}`);
					$("#qna-main-update .updateQnaTitle").val(`\${result.qnaTitle}`);
					$("#qna-main-update .qnaContent").val(`\${result.qnaContent}`);
					$("#qna-main-update .secretState").val(`\${result.secretState}`);
				},
				error : function(error) {
					alert("QnA 글을 가져올 수 없습니다.");
				}
			}); // 아작스 종료
		})//$(".updateBtn").click 끝
	   
	
}); //ready 끝


</script>


</head>
<body>


	<section>
	    <div>
	    	<h1>QnA</h1>
	    	
	        <table class="table">
	            <thead>
	                <tr>
		                <th>번호</th>
		                <th>작성자</th>
		                <th>제목</th>
		                <th>등록일자</th>
		                <th>답변완료</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:choose>
	                    <c:when test ="${empty requestScope.pageList.content}">
	                        <tr>
	                            <th colspan="6">
	                                <span> 등록된 Q&A가 없습니다.</span>
	                            </th>
	                        </tr>
	                    </c:when>
	                    <c:otherwise>
	                        <c:forEach items="${requestScope.pageList.content}" var="qna">
	                            <tr>
	                                <td><span>${qna.qnaId}</span></td>
	                                <td><span>${qna.student.studentId}</span></td>
	                                <td>
	                                    <c:choose>
	                                    	<c:when test="${qna.blindState eq 'T'}">
		                                        <a>이 글은 관리자의 권한으로 블라인드처리가 되었습니다.</a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<button class="btn btn-light qnaTitle" data-bs-toggle="modal" data-bs-target="#exampleModal2" value="${qna.qnaId}">${qna.qnaTitle}</button>
		                                    </c:otherwise>   
	                                    </c:choose>
	                                    <%-- <a href="${pageContext.request.contextPath}/main/board/qna/qnaRead/${qna.qnaId}">${qna.qnaTitle}</a> --%>
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
	                            </tr>
	                        </c:forEach>
	                    </c:otherwise>
	                </c:choose>
	            </tbody>
	        </table>
	        
	        <%-- ${pageList.hasPrevious()}  /  ${pageList.hasNext()} --%>
				<div style="text-align: center">
					
						<!--  블럭당  -->
				 <nav class="pagination-container">
					<div class="pagination">
					<c:set var="doneLoop" value="false"/>
						
						  <c:if test="${(startPage-blockCount) > 0}"> <!-- (-2) > 0  -->
						      <a class="pagination-newer" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${startPage-1}">PREV</a>
						  </c:if>
						  
								<span class="pagination-inner"> 
								  <c:forEach var='i' begin='${startPage}' end='${(startPage-1)+blockCount}'> 
								  
									<c:if test="${(i-1)>=pageList.getTotalPages()}">
									       <c:set var="doneLoop" value="true"/>
									</c:if> 
								     
								    <c:if test="${not doneLoop}" >
								         <a class="${i==nowPage?'pagination-active':page}" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${i}">${i}</a> 
								    </c:if>
								   
								  </c:forEach>
								</span> 
								<!-- 
								[다음]
				 
									  if( (시작페이지+한블록당뿌려질[]개수)<= 총페이지수){
									      [다음]출력;
									  }  
									
									  ex)if( (startPage+blockCount) <= pageCount){
									
									      }
								 -->
								 <c:if test="${(startPage+blockCount)<=pageList.getTotalPages()}">
								     <a class="pagination-older" href="${pageContext.request.contextPath}/main/mypage/qnaList?nowPage=${startPage+blockCount}">NEXT</a>
								 </c:if>
								 
							
						
						</div>
					</nav>  
				   </div>
	        
	        
	    </div>
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
        
		<!-- 수정시 필요한 데이터들을 hidden으로 숨겨놓고 폼 데이터로 보내준다. -->
		<form name="requestForm" method="post" id="requestForm" >
			<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
			<input type=hidden name="qnaId" id="deleteId" value="${qna.qnaId}">
		
			<!-- Button trigger modal -->
			<input type="button" class="btn btn-outline-primary updateBtn" id="updateBtn" data-bs-toggle="modal" data-bs-target="#updateModal" value="수정하기" >
			<input class="btn btn-outline-primary deleteBtn" type="button" value="삭제하기" >

		</form>
		
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

<!-- QnA 글 수정하기 모달-->
<!-- Modal -->
<div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel3" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel3">Q&A글 수정하기</h5>
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
				  <input class="form-control qnaId" type=text name="qnaId"  value="${qna.qnaId}" required readonly="readonly">
				</div>
                <div>
				  제목
				  <input class="form-control updateQnaTitle" type=text name="qnaTitle" size="30"  value="${qna.qnaTitle}">
				</div>
				<div>
				  내용 
				  <textarea class="form-control qnaContent" name="qnaContent" rows="10" cols="33">${qna.qnaContent}</textarea>	
				</div>
				<div>
				  비밀글 체크 
				  <!-- <input class="form-check-input" type="checkbox" id="inlineFormCheck-T" name="secretState" value="T">공개 -->
				  <input class="form-check-input" type="checkbox" id="inlineFormCheck-F" name="secretState" value="F">비공개
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