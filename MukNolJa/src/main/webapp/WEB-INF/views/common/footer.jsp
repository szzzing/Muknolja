<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#footerDiv{
		height: 200px;
		background: #616161;
		color: white;
		padding: 50px 150px;
		font-size: 10px;
	}
	.footerCate{
		color: white;
		text-decoration: none;
		margin: 10px 0px;
	}
	.footerCate:hover{
		color: #6BB6EC;
		cursor: pointer;
	}
	#qa{
		font-size: 14px;
	}
	#qa:hover{
		color: #6BB6EC;
		cursor: pointer;
	}
	
</style>
</head>
<body>
	<div id="footerDiv">
		<div class="row">
			<div class="col-6">
				상호 :(주)먹놀자 | 대표자명 : 김민주<br>
				사업자등록번호 : 000-00-0000 | 통신판매업신고번호 : 제0000-서울중구-0000호<br>
				연락처 : 000-0000-0000 | 팩스 : 000-0000-0000| 이메일 : muknolja@naver.com<br>
				주소 : 서울특별시 중구 남대문로 120 대일빌딩 2층, 3층
				<hr>
				Copyright@C1K3
			</div>
			<div class="col-1" style="line-height: 25px">
				<a class="footerCate" href="#">Travel</a><br>
				<a class="footerCate" href="#">Hotel</a><br>
				<a class="footerCate" href="#">Party</a><br>
				<a class="footerCate" href="#">Review</a>
			</div>
			<div class="col" style="line-height: 25px">
				이용약관<br>
				개인정보처리방침
			</div>
			<div class="col">
				<b id="qa">문의하기</b>
			</div>
		</div>
	</div>
</body>
</html>