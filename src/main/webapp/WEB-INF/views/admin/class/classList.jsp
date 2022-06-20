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
		<script type="text/javascript">
			$(function() {
				function selectPlaceRegion(){
					$.ajax({
						url: "${pageContext.request.contextPath}/place/selectPlaceRegion",
						type: "post",
						data: {"${_csrf.parameterName}": "${_csrf.token}"},
						dataType: "json",
						success: function(result){
							text = ""
							$.each(result, function(index, item){
								text += `<input type="radio" class="btn-check shadow-none placeRegion" name="placeRegion" id="\${item.regionName}" value="\${item.regionId}"><label class="btn btn-outline-primary shadow-none" for="\${item.regionName}">\${item.regionName}</label>`;
							})
							$("#placeRegion").append(text);
						},
						error:function(request, status, error){

							alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

						}
					})
				}
				
				function selectClassCategory(){
					$.ajax({
						url: "${pageContext.request.contextPath}/class/selectAllCategory",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}"},
						dataType: "json",
						success: function(result){
							text = ""
							$.each(result, function(index, item){
								text += `<input type="radio" class="btn-check shadow-none classCategory" name="classCategory" id="\${item.categoryName}" value="\${item.categoryId}"><label class="btn btn-outline-primary shadow-none" for="\${item.categoryName}">\${item.categoryName}</label>`;
							})
							text += ""
							$("#classCategory").append(text);
							search();
						},
						error: function(err){
							alert("클래스 카테고리를 가져올 수 없습니다.")
						}
					})
				}
				
				function search() {
					var query = window.location.search;
					var param = new URLSearchParams(query);
					$("#keyword").val(param.get('keyword'));
					$(".placeRegion[value="+param.get('placeRegion')+"]").prop("checked", true)
					$(".classCategory[value="+param.get('classCategory')+"]").prop("checked", true)
					$("[value="+param.get('sort')+"]").prop("checked", true)
				}

				$(document).on("click", "button[name=none-like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/insert",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "classId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-solid fa-heart fa-lg"></i>');
							$(this).attr("name", "like");
							$(this).attr("value", `\${result.likeId}`);
						},
						error: function(err){
						}
					})
				})

				$(document).on("click", "button[name=like]", function() {
					$.ajax({
						url: "${pageContext.request.contextPath}/like/deleteByLikeId",
						type: "post",
						data: {"${_csrf.parameterName}" : "${_csrf.token}", "likeId" : $(this).val()},
						context: this,
						success: function(result){
							$(this).html('<i class="fa-regular fa-heart fa-lg"></i>');
							$(this).attr("name", "none-like")
							$(this).attr("value", `\${result}`);
						},
						error: function(err){
							alert(123)
						}
					})
				})
				
				selectClassCategory();
				selectPlaceRegion();
			})
		</script>
	</head>
	<body>
		<div id="searchBtn">
			<button class="btn btn-outline-primary" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
				검색&필터
			</button>
		</div>
	
		<div class="accordion" id="searchBox">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse ${title=='클래스 검색'?'show':hide}" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<form action="${pageContext.request.contextPath}/admin/class/classSearch">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" name="keyword" id="keyword" placeholder="검색할 단어를 입력해주세요">
								<label for="floatingInput">검색할 단어를 입력해주세요</label>
							</div>
							
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="placeRegion">
							</div><br>
							
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="classCategory">
							</div><br>
							
							<div class="btn-group" role="group" aria-label="Basic radio toggle button group" id="sort">
								<input type="radio" class="btn-check shadow-none"  name="sort" id="new" value="new">
								<label class="btn btn-outline-primary shadow-none" for="new">최근 등록</label>
								<input type="radio" class="btn-check shadow-none" name="sort" id="review" value="review">
								<label class="btn btn-outline-primary shadow-none" for="review">후기 많은 순</label>
								<input type="radio" class="btn-check shadow-none" name="sort" id="likes" value="likes">
								<label class="btn btn-outline-primary shadow-none" for="likes">인기순</label>
								<input type="radio" class="btn-check shadow-none" name="sort" id="low" value="low">
								<label class="btn btn-outline-primary shadow-none" for="low">낮은 가격순</label>
								<input type="radio" class="btn-check shadow-none" name="sort" id="high" value="high">
								<label class="btn btn-outline-primary shadow-none" for="high">높은 가격순</label>
							</div><br>
							<div id="searchBtnBox">
								<input type="reset" class="btn btn-primary btn-lg" value="초기화">
								<input type="submit" class="btn btn-primary btn-lg" value="검색">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
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
		 					공개일
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
		 					<td>${classes.classOpenDate.toString().substring(0, 10)}</td>
		 					<td><fmt:formatNumber value="${classes.classPrice}" pattern="#,###" />원</td>
		 					<td>${classes.classState.stateName}</td>
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