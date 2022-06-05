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

<title>선생님 : 클래스 쿠폰 등록하기</title>

<script type="text/javascript">
	$(function() {
		//alert(1);
		
		//선생님이 보유한 클래스명 가져오기
		$(function(){
		function selectPlaceRegion(){
			$.ajax({
				url: "/",
				type: "post",
				data: {"${_csrf.parameterName}": "${_csrf.token}"},
				dataType: "json",
				success: function(result){
// 					alert(result);
					text = ""
					$.each(result, function(index, item){
						text += `<option value='\${item.classId}'>\${item.className}</option>`;
					})
					text += ""
					$("select[name = select_classId]").append(text);
				},
				error: function(err){
					
					alert("클래스명을 가져올 수 없습니다.")
				}
			})
		}
		selectPlaceRegion();
	})
		
		
	});
</script>
</head>
<body>
    
    
    <!--쿠폰등록하기-->
    <div class="card">
        <div class="card-body">
         	<form name="reply-teacher-insert" method="post" id="reply-teacher-insert" action="${pageContext.request.contextPath}/couponInsert">
         		<h2> 쿠폰 등록하기 </h2>
         		<table>
         				<tr>
         					<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
         				</tr>
	         			<tr>
	         				<th>선생님ID</th>
	         				<td><input type=hidden name="teacherId" value="Tann1234" id="teacherId"></td>
	         				<%-- <td><input type=hidden name="teacherId" value="${teacher.teacherId} id="teacherId"></td> --%>
	         			</tr>
	         			<tr>
	         				<th>클래스명</th>
	         				<td>
								<select name="select_classId" id="select_classId">
						        	<option name="classId" value="0">-클래스 선택-</option>          
						        </select>
							</td>
	         			</tr>
	         			<tr>
	         				<th>쿠폰상태</th>
	         				<td>
								<select name="select_couponStateId" id="select_couponStateId">
						        	<option name="couponStateId" value="0">-쿠폰상태 선택-</option>
						        	<option name="couponStateId" value="1">발급</option>
						        	<option name="couponStateId" value="2">발급중지</option>
						        	<option name="couponStateId" value="3">삭제</option>          
						        </select>
							</td>
	         			</tr>
	         			<tr>
	         				<th>쿠폰명</th>
	         				<td><input class="form-control" type=text name="couponName" id="couponName"></td>
	         			</tr>
	         			<tr>
	         				<th>할인금액</th>
	         				<td><input class="form-control" type=text name="couponDc" id="couponDc" placeholder="숫자만 입력해주세요."></td>
	         			</tr>
	         			<tr>
	         				<th>사용기간</th>
	         				<td><input class="form-control" type=text name="couponEndDate" id="couponEndDate" placeholder="숫자로 입력해주세요."></td>
	         			</tr>
         				
         		</table>
                
                <input type="submit" class="btn btn-dark mt-3" id="reply-insert-btn" value="쿠폰등록하기">
         	 </form>
         </div>
     </div>
     <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/">뒤로 돌아가기</a>&gt;</span></div>


</body>
</html>