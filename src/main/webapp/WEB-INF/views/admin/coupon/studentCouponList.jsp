<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 : 학생이 가지고 있는 쿠폰 조회</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<style type="text/css">
	section {width: 1200px; margin: auto;}
	table {width: 1200px;}
	th, td {border: 1px solid black;}
</style>

<script type="text/javascript">
	
	
		
		
/*$(function(){
	//가입한 학생리스트
	function selectByStudentId(){
		$.ajax({
			url: "${pageContext.request.contextPath}/userList",
			type: "post",
			data: {"${_csrf.parameterName}": "${_csrf.token}"},
			dataType: "json",
			success: function(result){
				//alert(result);
				text = ""
				$.each(result, function(index, item){
					text += `<option value='\${item.studentId}'>\${item.studentId}</option>`;
				})
				text += ""
				$("select[name = studentId]").append(text);
			},
			error: function(err){
				
				alert("학생 아이디를 가져올 수 없습니다.")
			}
		}); //ajax 끝
	}//selectByStudentId() 끝
	selectByStudentId();
	
	
	$(document).on("change", "#studentId", function() {
		
		//alert(1);
		var idValue = $(this).val();
		alert(idValue);
		
		$.ajax({
			url: "${pageContext.request.contextPath}/studentCouponList",
			type: "post",
			dataType: "json",
			data : {"${_csrf.parameterName}":"${_csrf.token}", studentId : $(this).val()},
			success: function(result) {
				
				let text = "";
				$.each(result, function(index, item) {
					text += `<tr>`;
					text += `<td>\${item.issueNo}</a></td>`;
					text += `<td>\${item.coupon.couponId}</td>`;
					text += `<td>\${item.coupon.couponName}</td>`;
					text += `<td>\${item.issueUsable}</td>`;
					text += `<td>\${item.issueStartDate}</td>`;
					text += `<td>\${item.issueEndDate}</td>`;
					text += "</tr>";
					
				});//each함수 끝
				
				//$("#couponTalbe thead tr:gt(0)").remove(); //0번지 보다 큰거는 지우고 뿌려주기
				$("#couponTable tbody").text("");
				$("#couponTable tbody").append(text);
				
			}, // 성공 메소드
			error : function(err) {
				alert(err + " 에러 발생!");
			} // 에러 메소드
		}); // ajax 종료
		
	});//onchang
	
	
	
	
});//ready */

		
	
</script>


</head>
<body>
		<section>
			<form>

				<h1>쿠폰조회 </h1>
				<section class="selectStudentId">
					<select name="studentId" id="studentId" >
						<option value="0">--아이디선택--</option>
					</select>
				</section>
				
				<table class="table" id="couponTable">
					<thead>
						<tr>
							<th>쿠폰번호</th>
							<th>쿠폰아이디</th>
							<th>쿠폰명</th>
							<th>쿠폰사용여부</th>
							<th>쿠폰발행일</th>
							<th>쿠폰만료일</th>
						</tr>
					</thead>
					<tbody>
						
						
					</tbody>
					<tfoot>
						<tr>
							
						</tr>
					</tfoot>
					
				</table>
				
			</form>
		</section>
		
</body>
</html>