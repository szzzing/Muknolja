<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="container" style="width:800px; margin-top:100px;">
		<h2 style="text-align: center;">객실 등록</h2>
		<form action="${ contextPath }/insertRoom.ho" method="post">
			<div class="col form-floating mb-3 mt-3">
				<input type="text" class="form-control" name="roomName" placeholder="객실명을 입력하세요." required>
				<label for="roomName">객실명</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="text" class="form-control" name="roomPrice" placeholder="숫자만 입력하세요." required>
				<label for="roomPrice">가격</label>
			</div>
			<div class="col form-floating mb-3 mt-3" style="width: 200px; float: left;">
				<input type="time" class="form-control" id="checkinTime" name="checkinTime" required>
				<label for="checkinTime">체크인 시간</label>
			</div>
			<div class="col form-floating m-3" style="width: 200px; float: left;">
				<input type="time" class="form-control" id="checkoutTime" name="checkoutTime" required>
				<label for="checkoutTime">체크아웃 시간</label>
			</div>
			<div style="clear:both;"></div>

			<div class="col form-floating mb-3 mt-3">
				<select class="form-select" name="maxAccept">
					<option selected>1</option>
					<option>2</option>
					<option>3</option>
					<option>4</option>
					<option>5</option>
				</select>
				<label for="maxAccept">인원</label>
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control" name="roomInfo" placeholder="내용을 입력하세요." rows="10" style="height:300px; resize:none" required></textarea>
				<label for="roomInfo" class="form-label">객실 기본정보</label>
			</div>
		</form>
	</div>
	<script type="text/javascript">
function roomCheck(){
	const ro_name = document.f.ro_name.value;
	const roomNameCheck = document.querySelector("#roomNameCheck")
	$.ajax({
		type:'POST',
		url:'${pageContext.request.contextPath}/room/roomCheck',
		header:{"Content-Type":"application/json"},
		dateType:'json',
		data:{ro_name:ro_name},
		success : function(result){
			if(result == true){
				roomNameCheck.innerHTML = '중복된 객실 이름이 존재합니다.';
				roomNameCheck.style.color = 'red';
			} else {
				roomNameCheck.innerHTML = '사용가능합니다';
				roomNameCheck.style.color = 'blue';
			}
		}
	})
}
  
</script>
</body>
</html>