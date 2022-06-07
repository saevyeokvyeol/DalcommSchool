<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script src="https://kit.fontawesome.com/351ed6665e.js" crossorigin="anonymous"></script>
		<script type="text/javascript">
			$(function() {
				$.ajax({
					url: "${pageContext.request.contextPath}/like/selectByStudentId",
					type: "post",
					data: {"${_csrf.parameterName}" : "${_csrf.token}"},
					dataType: "json",
					success: function(result){
							text = ""
							if(result.length == 0){
								text += "찜한 클래스가 없습니다."
							} else {
								$.each(result, function(index, item){
									text += `\${item.classId} | <a href="${pageContext.request.contextPath}/main/class/\${item.classId}">\${item.className}</a> | \${item.classPrice} | \${item.teacherNickname} | \${item.StateId} | \${item.classImage}<br>`
								})
							}
							
							$("#myList").html(text);
					},
					error: function(err){
						alert("클래스 카테고리를 가져올 수 없습니다.")
					}
				})
				
				$("#deleteLikes").click(function() {

					$.ajax({
						url: "${pageContext.request.contextPath}/like/deleteByStudentId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}"},
						success: function(){
							$("#myList").html("찜한 클래스가 없습니다.");
						},
						error: function(err){
							alert("찜 목록을 삭제할 수 없습니다.")
						}
					})
				})
			})
		</script>
	</head>
	<body>
		<div id="myList">
		</div>
		<button id="deleteLikes">목록 전체 삭제</button>
	</body>
</html>