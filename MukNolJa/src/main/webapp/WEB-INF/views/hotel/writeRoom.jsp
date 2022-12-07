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
<title>객실 등록하기</title>
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
			<div class="mb-3">
				<input type="file" class="form-control form-control-lg" name="roomImg">
			</div>
			<div class="mb-3">
				<input type="file" class="form-control form-control-lg" name="roomImg">
			</div>
			<div class="mb-3">
				<input type="file" class="form-control form-control-lg" name="roomImg">
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-outline-secondary" style="align:bottom !important">작성하기</button>
			</div>
		</form>
	</div>
</body>
</html>