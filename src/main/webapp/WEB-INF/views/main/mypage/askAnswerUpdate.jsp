<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#preview-image{
		width: 350px;
		height: 350px;
		/* object-fit:cover; */
		background-size: contain;
	
	}

</style>



    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    
  
  
	  <script type="text/javascript">
	    	$(document).ready(function() {
				$('#summernote').summernote({
					height: 300,
					minHeight: null,
					maxHeight: null,
					focus:true,
					lang: "ko-KR",
					placeholder: '최대 2048자까지 쓸 수 있습니다.'
				
				});
			});
	    	
	    	
	    	$(function(){
	    		
	    		$(".mainFileBtn").click(function() {
					$("#input-image").click()
				})
				
				$("img").click(function() {
				    $(".mainImgCon").css("display", "none")
				    $("#preview-image").attr("src", "")
				    $(".mainFileBtn").css("display", "block")
				    $("#input-image").val("")
				})
				
				function readImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var previewImage = document.getElementById("preview-image")
				            previewImage.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var inputImage = document.getElementById("input-image")
				inputImage.addEventListener("change", e => {
				    readImage(e.target)
				    $(".mainImgCon").css("display", "block")
				    $(".mainFileBtn").css("display", "none")
				})
	    	})
	    	
	    	
	    </script>

</head>
<body>
<div class="main-content">
		<form name=updateForm method=post action="${pageContext.request.contextPath}/main/board/askanswer/updateStudent?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
		    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"> <!-- csrf token 전송 -->
		    																							
		    <input type='hidden' name='askNo' value="${askSelectByIdList.askNo}">
		    <div align=right><span style="font-size:9pt;"><a class="btn btn-primary"  href="${pageContext.request.contextPath}/main/mypage/askAnswerSelectById" role="button">목록으로</a></span></div>
		    
			<table class="table">
			    <tr>
			        <td>
			            ${askSelectByIdList.askNo} 번 게시물 수정하기
			        </td>
			    </tr>
			    <tr>
			        <td>
			            문의 ID : ${askSelectByIdList.student.studentId}
			        </td>
			    </tr>
			    <tr>
			        <td>
			            문의 제목 
			        </td>
			        <td>
						<input type=text name="askTitle" size="20" value="${askSelectByIdList.askTitle}">
					</td>
			    </tr>
			   
			    <tr>
			    	<td>
			    		첨부파일
			    	</td>
					<td>
						 <div class="mb-3" align="center"> 
							<div class="image-container mainImgCon">
							    <a><img id="preview-image" src="${pageContext.request.contextPath}/img/ask/${askSelectByIdList.askImg}"></a>
							</div>
							<!-- <button type="button" class="fileBtn mainFileBtn">
								<i class="fa-regular fa-image fa-2xl"></i>
								파일 첨부
							</button> -->
							<input type="file" id="input-image" name="file">
						 </div>
					</td>
				</tr>
			    
			    <tr>
			      	<td>
			      		문의 내용
			      	</td>
			        <td>
						<textarea name="askContent" id="summernote">${askSelectByIdList.askContent}</textarea>
					</td>
			    </tr>
			 
			</table>
			<div class="col text-center">
							
				<input type="submit" class="btn btn-primary" value="수정하기"> 
				<input type="reset" class="btn btn-primary" value="다시쓰기">
			</div>
		</form>													
	<hr>
	
</div>
</body>
</html>