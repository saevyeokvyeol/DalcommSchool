<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>정산하기 폼</title>
<!--Bootstrap CSS-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/dalcommschool.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</head>
<body>

<div class="main-content">

<!--정산하기-->
<div class="card" style="width: 25rem;">
    <div class="card-body">
     	<form name="adjust-teacher-insert" method="post" id="adjust-teacher-insert" action="${pageContext.request.contextPath}/applyAdjust">
     	<input type=hidden name="${_csrf.parameterName}" value="${_csrf.token}">
     	<%-- <td><input type=hidden name="teacherId" value="${teacher.teacherId} id="teacherId"></td> --%>
     	<input type=hidden name="teacherId" value="Tkim1234" id="teacherId">
     	<input type=hidden name="adjustStateId" value="1" id="adjustStateId">
     		<h2> 정산신청하기 </h2>
     		<table>
      			<tr>
      				<th class="col-form-label">1. 정산 가능 총액</th>
      				<td>
						${adjustable}원
					</td>
      			</tr>
      			<tr>
      				<th class="col-form-label">2. 정산 신청 금액</th>
      				<td>
						<input type="number" class="form-control" id="exampleFormControlInput1" placeholder="0원" name="adjustPrice">
					</td>
      			</tr>
      			<tr>
      				<th class="col-form-label">3. 정산 받으실 은행</th>
      				<td>
						<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="ex) 우리은행, 신한은행...." name="bank">
					</td>
      			</tr>
      			<tr>
      				<th class="col-form-label">4. 예금주</th>
      				<td><input type="text" class="form-control" id="exampleFormControlInput1" name="depositor"></td>
      			</tr>
      			<tr>
      				<th class="col-form-label">5. 계좌번호</th>
      				<td>
      					<input type="text" class="form-control" id="exampleFormControlInput1" placeholder="ex) 1002-333-123456" name="account">
      				</td>
      			</tr>
      			
     		</table>
            
            <input type="submit" class="btn btn-dark mt-3" id="coupon-insert-btn" value="정산신청하기">
     	 </form>
     </div>
 </div>



</div>


</body>
</html>