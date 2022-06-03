<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 등록 폼입니다.</title>
<style type="text/css">
	div{width: 600px; height:auto; border: 1px}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDiCAAmADa4iRAdiHejCCqQbkk0T2oT0x0&callback=myMap"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">

<!-- 주소 API -->
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>

<script type="text/javascript">

	/*
	지도 API
	*/
	 function myMap(){
	      var mapOptions = { 
	            center:new google.maps.LatLng(51.508742, -0.120850),
	            zoom:5
	      };
	 
	      var map = new google.maps.Map( 
	             document.getElementById("googleMap") 
	            , mapOptions );
	 }

	/*
	공방 지역 정보 가져오기
	*/
	$(function(){
		function selectPlaceRegion(){
			$.ajax({
				url: "/place/selectPlaceRegion",
				type: "post",
				dataType: "json",
				success: function(result){
					alert(result);
					text = ""
					$.each(result, function(index, item){
						text += `<option value='\${item.regionId}'>\${item.regionName}</option>`;
					})
					text += ""
					$("select[name = placeRegion]").append(text);
				},
				error: function(err){
					alert("지역정보를 가져올 수 없습니다.")
				}
			})
		}
		selectPlaceRegion();
	})
	
	/*
	
	*/
	 
	
</script>
</head>
<body>
<h1> 공방 등록폼~ </h1>

<section>
  <form id="insertForm" method="post" action="${pageContext.request.contextPath}/place/insert">
    <table>
      <tr>
        <th>공방 이름</th>
        <td><input type="text" id="placeName" class="" placeholder="사용하시는 공방의 이름을 설정해주세요."/></td>
      </tr>
      <tr>
        <th>공방 지역</th>
        <td>
          <select name="placeRegion">
            <option value="0">--지역 선택--</option>
          </select>
        </td>
      </tr>
      <tr>
        <th>공방 주소</th>
        <td>
		  <input type="text" id="sample6_postcode" name="zipcode" class="form-control" readonly="readonly" >
		  <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-outline-dark shadow-none" value="우편번호검색">
		  <input type="text" id="sample6_address" name="addrAddr" class="form-control">
		  <input type="text" id="sample6_detailAddress" name="addrDetailAddr" class="form-control" placeholder="상세주소1(선택)">
		  <input type="text" id="sample6_extraAddress" name="addrRefAddr" class="form-control" placeholder="상세주소2(선택)">
		</td>
      </tr>
      <div id="googleMap"></div>
      <tr>
        <legend>공방 편의 시설</legend>
        <input type="checkbox" name="">
      </tr>
    </table>
  </form>

</section>


</body>
</html>