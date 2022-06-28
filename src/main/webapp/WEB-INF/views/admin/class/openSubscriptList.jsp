<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
		<style type="text/css">
			.accordion-body {border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 10px; padding: 30px;}
			#searchBtn {text-align: right;}
			#searchBox {margin: 30px 0;}
			#searchBox .btn-group {width: 100%; margin: 10px 0;}
			#searchBtnBox {padding: 20px 0 0; text-align: center;}
			#searchBtnBox > .btn {width: 100px;}
		</style>
	</head>
	<script type="text/javascript">
		$(function() {
			$(".open").click(function() {
				$.ajax({
					url: "${pageContext.request.contextPath}/admin/class/updateStateOpen",
					type: "post",
					data: {"${_csrf.parameterName}": "${_csrf.token}", "classId" : $(this).val()},
					success: function(){
						location.reload();
					},
					error:function(request, status, error){

						swal("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

					}
				})
			})
		})
	</script>
	<body>
		<div id="allBookList">
		 	<table class="table">
		 		<thead>
		 			<tr>
		 				<th>
		 					카테고리
		 				</th>
		 				<th>
		 					클래스명
		 				</th>
		 				<th>
		 					선생님
		 				</th>
		 				<th>
		 					등록일
		 				</th>
		 				<th>
		 					가격
		 				</th>
		 				<th>
		 					상태
		 				</th>
		 			</tr>
		 		</thead>
		 		<tbody>
					<c:choose>
						<c:when test="${empty list}">
							클래스가 존재하지 않습니다.
						</c:when>
						<c:otherwise>
							<div class="classList">
								<c:forEach items="${list.content}" var="classes">
									
								</c:forEach>
							</div>
						</c:otherwise>
					</c:choose>
		 			<c:forEach items="${list.content}" var="classes">
		 				<tr>
		 					<td>${classes.classCategory.categoryName}</td>
		 					<td>${classes.className}</td>
		 					<td>${classes.teacher.teacherNickname}(${classes.teacher.teacherId})</td>
		 					<td>${classes.classInsertDate.toString().substring(0, 10)}</td>
		 					<td><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</td>
		 					<td><button class="btn btn-primary open" value="${classes.classId}">공개</button></td>
		 				</tr>
		 			</c:forEach>
		 		</tbody>
		 	</table>
		</div>
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
	</body>
</html>