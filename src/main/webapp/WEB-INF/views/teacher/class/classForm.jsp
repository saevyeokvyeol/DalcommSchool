<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
		<script type="text/javascript">
			$(function() {
				function selectAllCategory() {
					$.ajax({
						url : "${pageContext.request.contextPath}/teacher/class/selectAllCategory",
						type : "post",
		    			dataType: "json",
						success : function(result) {
							text = ""
							$.each(result, function(index, item) {
								text += `<option value='\${item.categoryId}'>\${item.categoryName}</option>`;
							})
							$("#categoryId").append(text);
						},
						error : function(error) {
							alert("카테고리 정보를 가져올 수 없습니다.");
						}
					});
				}
				
				selectAllCategory();
			})
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/teacher/class/insert"
			enctype="multipart/form-data" method="post">
			<table>
				<tr>
					<td>
						<label class="form-label">선생님ID</label>
						<input type="text" placeholder="선생님ID" name="teacherId" value="Tkim1234">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">클래스명</label>
						<input type="text" placeholder="클래스명" name="className">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">클래스 소개글</label>
						<textarea rows="5" cols="50" name="classInfo"></textarea>
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">클래스 금액</label>
						<input type="number" placeholder="클래스명" name="classPrice">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">대표 이미지</label>
						<input type="file" placeholder="클래스명" name="file">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">추가 이미지</label>
						<input type="file" multiple="multiple" placeholder="클래스명" name="files">
					</td>
				</tr>
				<tr>
					<td>
						<label class="form-label">카테고리</label>
						<select name='categoryId' id="categoryId">
							<option value='0'>클래스 카테고리 선택</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						<input type="submit" value="클래스 등록">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>