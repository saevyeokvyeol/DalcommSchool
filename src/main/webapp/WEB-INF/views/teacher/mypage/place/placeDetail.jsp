<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공방 상세 보기</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>

<style type="text/css">
	#map {
  height: 400px;
  
  width: 800px;
  
}
body{margin: auto; width: 1200px;}
	#placeRoute{ height: 100px; width: 800px;}
	#etc{height: 50px; width: 800px;}
	
	.textbox{resize:none;}

</style>

<script type="text/javascript">
	$(function(){
		
		/*
		공방 인프라 정보 가져오기
		*/
		function selectPlaceInfra(){
			$.ajax({
				url: "/teacher/teacherMypage/place/selectInfra",
				type: "post",
				dataType: "json",
				data : {"${_csrf.parameterName}": "${_csrf.token}",
						placeId: ${place.placeId}
				},
				success: function(result){
// 					swal(result);
					let text="";
					$.each(result, function(index, item){
						
						text += `\${item.infraName}/`;
						
					})
					$("#placeInfra").after(text);
				},
				error: function(err){
					swal(err + "에러 발생")
				}
			})
		}selectPlaceInfra();
	})
	
// 	function initialize() {
// 	  var geocoder = new google.maps.Geocoder();
// 	  var map;
// 	  var address = document.getElementById('placeAddr').value;
	  
// 	  geocoder.geocode( { 'address': address}, function(results, status) {
// 	      if (status == 'OK') {
// 	        map.setCenter(results[0].geometry.location);
// 	        var marker = new google.maps.Marker({
// 	            map: map,
// 	            position: results[0].geometry.location
// 	        });
// 	        var lat = results[0].geometry.location.lat();
// 	        var lng = results[0].geometry.location.lng();
	        
// 	        var latlng = new google.maps.LatLng(lat, lng);
	        
// 	        var mapOptions = {
// 	        	    zoom: 14,
// 	        	    center: latlng
// 	        }
// 	        map = new google.maps.Map(document.getElementById('map'), mapOptions);
// 	      } else {
// 	        swal('Geocode was not successful for the following reason: ' + status);
// 	      }
// 	  });
// 	}


	  var geocoder;
	  var map;
	  
	  function initialize() {
	    geocoder = new google.maps.Geocoder();
	    var latlng = new google.maps.LatLng(37.534089572097, 127.1450466624);
	    var mapOptions = {
	      zoom: 16,
	      center: latlng
	    }
	    map = new google.maps.Map(document.getElementById('map'), mapOptions);
	  }
	

	
	function codeAddress() {
	    var address = document.getElementById('placeAddr').value;
	    geocoder.geocode( { 'address': address}, function(results, status) {
	      if (status == 'OK') {
	    	  
	    	  var lat = results[0].geometry.location.lat();
	 	      var lng = results[0].geometry.location.lng(); 
	    	  
	        map.setCenter(results[0].geometry.location);
	        var marker = new google.maps.Marker({
	            map: map,
	            position: results[0].geometry.location
	        });
	        
	      } else {
	        swal('Geocode was not successful for the following reason: ' + status);
	      }
	    });
	}
	
// 	codeAddress();
	$(function(){	
		codeAddress();
		
})

</script>
</head>
<body>

<h3>나의 공방 상세정보</h3>
<form>
<table>
  <tr>
    <th>공방 이름</th>
    <td>${place.placeName}</td>
  </tr>
  <tr>
    <th>공방 지역</th>
    <td>${place.placeRegion.regionName}</td>
  </tr>
  <tr>
    <th>공방 주소</th>
    <td >${place.placeAddr}, ${place.detailAddr}</td>
    <input type="hidden" id="placeAddr" value="${place.placeAddr}">
  </tr>
  <tr>
    <th>지도</th>
    <td>
      <div id="map"></div>
	  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmfiqODEsD_SffBbyZp3twBsE-p_brpTE&callback=initialize&v=weekly&region=KR" defer></script>
    </td>
  </tr>
  <p>
  <tr>
    <th>공방 편의시설</th>
	<td id="placeInfra"></td>
  </tr>
  
</table>
<a href="${pageContext.request.contextPath }/teacher/teacherMypage/place/updateForm">수정하기</a>
</form>
</body>
</html>