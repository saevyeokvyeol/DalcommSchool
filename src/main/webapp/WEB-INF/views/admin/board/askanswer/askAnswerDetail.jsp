<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript">

	$(function() {
		//alert(1);
		$("input[value=답변하기]").click(function(){
		   
		   $("#requestForm").attr("action", "${pageContext.request.contextPath}/admin/board/askanswer/askAnswerDetail");
		   $("#requestForm").submit();
	   })
	   
		
	});
	
	

</script>
</head>
<body>
		
		<table align="center" cellpadding="5" cellspacing="2" width="600" border='1'>
  		   <tr>  
		        <td>
		           글 번호 : ${askList.askNo}<p>
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
		        	첨부 파일명 : ${askAnswerDetail.askImg}<p>
		        </td>
		        <td>
		        	문의 일자 : ${askAnswerDetail.askInsertDate}<p>
		        </td>
		    </tr>
		    
</table>
	<input type="button" value="답변하기"> 
	
	<div class="row">
    <div class="col-sm-12" style="margin-top: 10px;">
        <div id="comment">
            <div class=" commont-write">
                <form class="comment_form" role="form"  method="post">
                     <label>
                        <div class="input-group">
                            <textarea name="comment" id="comments" class="form-control p-10" placeholder="댓글입력"></textarea>
                            <span class="input-group-btn">
                                <button class="btn btn-white btn-lg" id="comment-btn" type="button" style="background-color: #ddd">
                                    <i class="far fa-edit"></i>
                                </button>
                            </span>
                        </div>
                    </label>
                </form>    
            </div>
            <div class="comment-none">
                <div class="well text-center">
                    등록된 내용이 없습니다.
			https://kdg-is.tistory.com/57
                </div>
            </div>
        </div>
    </div>
</div>

      
                 
                 
                 
                 
<div align=right><span style="font-size:9pt;">&lt;<a href="${pageContext.request.contextPath}/admin/board/askAnswerList">리스트로 돌아가기</a>&gt;</span></div>

</body>
</html>