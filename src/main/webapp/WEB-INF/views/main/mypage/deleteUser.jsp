<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 탈퇴 페이지 입니다 ^^ </h2>

	<form id="frm" action="/mypage/newFireProc" method="post">
	<h3 class="h3tit01">회원탈퇴사유</h3>
	<div class="bk_box mgt0">회원 탈퇴 신청 전, 탈퇴 사유를 체크해주세요.</div>
	<table class="sy_tbl">
		<colgroup>
			<col style="width:210px;" />
			<col  />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">개인정보관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="a_rd01" name="a_rd" />
							<label for="a_rd01">아이디 변경을 위해 탈퇴 후 재가입</label>
						</li>
						<li>
							<input type="radio" id="a_rd02" name="a_rd" />
							<label for="a_rd02">장기간 부재</label>
						</li>
						<li>
							<input type="radio" id="a_rd03" name="a_rd" />
							<label for="a_rd03">개인정보 누출 우려</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row">사이트 이용관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="b_rd01" name="a_rd" />
							<label for="b_rd01">컨텐츠 등 이용할 만한 서비스 부족</label>
						</li>
						<li>
							<input type="radio" id="b_rd02" name="a_rd" />
							<label for="b_rd02">사이트 속도 및 안정성 불만</label>
						</li>
						<li>
							<input type="radio" id="b_rd03" name="a_rd" />
							<label for="b_rd03">사이트 이용 불편</label>
						</li>
						<li>
							<input type="radio" id="b_rd04" name="a_rd" />
							<label for="b_rd04">이용빈도 낮음</label>
						</li>
						<li>
							<input type="radio" id="b_rd05" name="a_rd" />
							<label for="b_rd05">실질적인 혜택 부족</label>
						</li>
					</ul>
				</td>
			</tr>
			<tr>
				<th scope="row">클래스 이용관련</th>
				<td>
					<ul class="syrd_list">
						<li>
							<input type="radio" id="c_rd01" name="a_rd" />
							<label for="c_rd01">클래스의 다양성/품질 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd02" name="a_rd" />
							<label for="c_rd02">클래스 가격 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd05" name="a_rd" />
							<label for="c_rd05">사후조치 불만</label>
						</li>
						<li>
							<input type="radio" id="c_rd06" name="a_rd" />
							<label for="c_rd06">탈퇴사유 직접 입력(기타)</label>
                            <textarea cols="20" rows="5" id="out_etc" name="out_etc"  style="width:574px; height:96px; padding:5px; background:#fff; border:1px solid #000000; display:none"></textarea>
						</li>
					</ul>
				</td>
			</tr>
		</tbody>
	</table>
	<div class="bk_box mgt60">아래 체크 리스트에 전부 동의를 해주셔야 회원 탈퇴가 진행됩니다. 꼼꼼히 읽고 체크박스에 체크해주세요.</div>
	<ul class="gsm_list">
		<li>
			<div class="gsm_left">
				<input type="checkbox" id="gsm01" class="gsm_ck"  name="gsm_ck"/>
				<label for="gsm01"></label>
				<span>회원 탈퇴를 신청하시면 해당 아이디는 즉시 탈퇴 처리되며,<br />이후 영구적으로 사용이 중지되므로 새로운 아이디로만 재가입이 가능합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<input type="checkbox" id="gsm02" class="gsm_ck" name="gsm_ck" />
				<label for="gsm02"></label>
				<span>회원 탈퇴 신청 후, 1개월 동안 재가입이 불가능합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<input type="checkbox" id="gsm03" class="gsm_ck"  name="gsm_ck"/>
				<label for="gsm03"></label>
				<span>고객님께서 소유한 쿠폰, 구매내역 등은 복원 불가합니다.</span>
			</div>
		</li>
		<li>
			<div class="gsm_left">
				<input type="checkbox" id="gsm04" class="gsm_ck" name="gsm_ck" />
				<label for="gsm04"></label>
				<span>사이트 게시판에 등록된 게시물은 탈퇴 후에도 삭제되지 않습니다.<br />게시물 등의 삭제를 원하시는 경우에는 반드시 탈퇴 전 삭제하시기 바랍니다.</span>
			</div>
		</li>
	</ul>
	<div class="bk_box mgt60">마지막으로, 회원 탈퇴를 위한 고객님의 회원 정보를 입력해 주세요.</div>
	<div class="ad_box">
		<div class="ad_tbl_box">
			<table>
				<colgroup>
					<col style="width:160px;" />
					<col />
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">아이디</th>
						<td class="id"><span></span></td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td><input type="password" id="user_pass" name="user_pass"  /></td>
					</tr>
				</tbody>
			</table>
			<div class="btn_right"><a href="javascript:void(0);" onclick="clickFire();" class="btn_black01">회원 탈퇴하기</a></div>
		</div>
	</div>
    </form>
<input type="hidden" id="contents" name="contents" value=""  />
<input type="hidden" id="userid" name="userid" value=""  />
		
</body>
</html>