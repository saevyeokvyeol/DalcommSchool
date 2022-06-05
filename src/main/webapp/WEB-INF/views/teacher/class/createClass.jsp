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
						data : {"${_csrf.parameterName}" : "${_csrf.token}"},
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
					}); // 아작스 종료
				} // 카테고리 가져오기 종료
				
				function readImage(input) {
				    // 인풋 태그에 파일이 있는 경우
				    if(input.files && input.files[0]) {
				        // FileReader 인스턴스 생성
				        var reader = new FileReader()
				        // 이미지가 로드가 된 경우
				        reader.onload = e => {
				        	var previewImage = document.getElementById("preview-image")
				            previewImage.src = e.target.result
				        }
				        // reader가 이미지 읽도록 하기
				        reader.readAsDataURL(input.files[0])
				    }
				}
				// input file에 change 이벤트 부여
				var inputImage = document.getElementById("input-image")
				inputImage.addEventListener("change", e => {
				    readImage(e.target)
				})
				
				var fileNo = 0;
				var filesArr = new Array();

				/* 첨부파일 추가 */
				$("[name=files]").on("change", function() {
				    var maxFileCnt = 3;   // 첨부파일 최대 개수
				    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
				    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
				    var curFileCnt = this.files.length;  // 현재 선택된 첨부파일 개수

				    // 첨부파일 개수 확인
				    if (curFileCnt > remainFileCnt) {
				        alert("더 이상 추가 이미지를 등록할 수 없습니다");
				    }

				    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {

				        const file = this.files[i];

				        // 첨부파일 검증
				        if (validation(file)) {
				            // 파일 배열에 담기
				            var reader = new FileReader();
				            reader.onload = function () {
				                filesArr.push(file);
				            };
				            reader.readAsDataURL(file)

				            // 목록 추가
				            let htmlData = '';
				            htmlData += '<div id="file' + fileNo + '" class="filebox">';
				            htmlData += '   <p class="name">' + file.name + '</p>';
				            htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><i class="far fa-minus-square"></i></a>';
				            htmlData += '</div>';
				            $('.file-list').append(htmlData);
				            fileNo++;
				        } else {
				            continue;
				        }
				    }
				    // 초기화
				    document.querySelector("input[type=file]").value = "";
				})
				
				/* 첨부파일 검증 */
				function validation(obj){
				    const fileTypes = ['image/gif', 'image/jpg', 'image/png'];
				    if (obj.name.lastIndexOf('.') == -1) {
				        alert("확장자가 없는 파일은 등록할 수 없습니다.");
				        return false;
				    } else if (!fileTypes.includes(obj.type)) {
				        alert("클래스 이미지는 gif, jpg, png 파일만 등록할 수 있습니다.");
				        return false;
				    } else {
				        return true;
				    }
				}

				/* 첨부파일 삭제 */
				function deleteFile(num) {
				    document.querySelector("#file" + num).remove();
				    filesArr[num].is_delete = true;
				}

				/* 폼 전송 */
				function submitForm() {
				    // 폼데이터 담기
				    var form = document.querySelector("form");
				    var formData = new FormData(form);
				    for (var i = 0; i < filesArr.length; i++) {
				        // 삭제되지 않은 파일만 폼데이터에 담기
				        if (!filesArr[i].is_delete) {
				            formData.append("attach_file", filesArr[i]);
				        }
				    }

				    $.ajax({
				        method: 'POST',
				        url: '/register',
				        dataType: 'json',
				        data: formData,
				        async: true,
				        timeout: 30000,
				        cache: false,
				        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
				        success: function () {
				            alert("파일업로드 성공");
				        },
				        error: function (xhr, desc, err) {
				            alert('에러가 발생 하였습니다.');
				            return;
				        }
				    })
				}
				
				selectAllCategory();
			})
		</script>
	</head>
	<body>
		<form action="${pageContext.request.contextPath}/teacher/class/insert?${_csrf.parameterName}=${_csrf.token}"
			enctype="multipart/form-data" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
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
						<div class="image-container">
						    <img style="width: 500px;" id="preview-image" src="">
						</div>
						<label class="form-label">대표 이미지</label>
						<input type="file" id="input-image" name="file">
					</td>
				</tr>
				<tr>
					<td class="insert">
						<div class="file-list"></div>
						<label class="form-label">추가 이미지</label>
						<input type="file" multiple="multiple" name="files">
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