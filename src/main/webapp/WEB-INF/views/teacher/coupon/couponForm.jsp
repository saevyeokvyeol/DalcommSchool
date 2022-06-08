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
		function selectByTeacherId(){
			$.ajax({
				url: "/teacher/selectByTeacherId",
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
					$("select[name = classId]").append(text);
				},
				error: function(err){
					
					alert("클래스명을 가져올 수 없습니다.")
				}
			})
		}
		selectByTeacherId();
	})
		
		
	});
</script>
</head>
<body>
    
    
    <!--쿠폰등록하기-->
    <div class="card" style="width: 30rem;">
        <div class="card-body">
         	<form name="coupon-teacher-insert" method="post" id="coupon-teacher-insert" action="${pageContext.request.contextPath}/couponInsert">
         	<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
         		<h2> 쿠폰 등록하기 </h2>
         		<table>
	         			<tr>
	         				<th>선생님ID</th>
	         				<td><input type=hidden name="teacherId" value="Tkim1234" id="teacherId"></td>
	         				<%-- <td><input type=hidden name="teacherId" value="${teacher.teacherId} id="teacherId"></td> --%>
	         			</tr>
	         			<tr>
	         				<th>클래스명</th>
	         				<td>
								<select name="classId" id="classId" class="form-select">
						        	<option value="0">-클래스 선택-</option>          
						        </select>
							</td>
	         			</tr>
	         			<tr>
	         				<th>쿠폰상태</th>
	         				<td>
								<select name="couponStateId" id="couponStateId" class="form-select">
						        	<option value="0">-쿠폰상태 선택-</option>
						        	<option value="1">발급</option>
						        	<option value="2">발급중지</option>
						        	<option value="3">삭제</option>          
						        </select>
							</td>
	         			</tr>
	         			<tr>
	         				<th>쿠폰명</th>
	         				<td><input class="form-control" type="text" name="couponName" id="couponName"></td>
	         			</tr>
	         			<tr>
	         				<th>할인금액</th>
	         				<td><input class="form-control" type="number" name="couponDc" id="couponDc" placeholder="숫자만 입력해주세요."></td>
	         			</tr>
	         			<tr>
	         				<th>사용기간</th>
	         				<td><input class="form-control" type="number" name="couponEndDate" id="couponEndDate" placeholder="숫자로 입력해주세요."></td>
	         			</tr>
         				
         		</table>
                
                <input type="submit" class="btn btn-dark mt-3" id="coupon-insert-btn" value="등록하기">
         	 </form>
         </div>
     </div>
     <hr>
    
	<div align=right><span>&lt;<a href="${pageContext.request.contextPath}/teacher/coupon/couponAllList">뒤로 돌아가기</a>&gt;</span></div>


</body>
</html>