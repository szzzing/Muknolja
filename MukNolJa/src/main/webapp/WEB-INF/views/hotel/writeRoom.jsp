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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
</style>
</head>
<body>

	<div class="container mt-5 mb-5" style="max-width:800px;">
		<h2 class="fw-bold p-5" style="text-align:center;">객실 등록</h2>
		
		<form action="${ contextPath }/insertRoom.ho" enctype="multipart/form-data" method="post">
			<div class="col form-floating mb-3 mt-3">
				<input type="text" class="form-control" name="roomName" required>
				<label for="roomName">객실명</label>
			</div>
			<div class="col form-floating mb-3 mt-3">
				<input type="number" class="form-control" name="roomPrice" min="0" required>
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
			
			<div class="col form-floating mb-3 mt-3">
				<input type="number" class="form-control" name="totalNumber" min="0" required>
				<label for="roomPrice">객실 수</label>
			</div>
			
			<div class="form-floating mb-3 mt-3">
				<textarea class="form-control" name="roomIntro" rows="2" style="height:60px; resize:none" required></textarea>
				<label for="roomInfo" class="form-label">객실 한줄소개</label>
			</div>
			
			<div class="form-floating mb-3 mt-3">
				<textarea class="form-control" name="roomInfo" rows="10" style="height:300px; resize:none" required></textarea>
				<label for="roomInfo" class="form-label">객실 설명</label>
			</div>
			
			<div class="mb-3">
				<input type="file" class="form-control" name="roomImg">
			</div>
			<div class="mb-3">
				<input type="file" class="form-control" name="roomImg">
			</div>
			<div class="mb-3">
				<input type="file" class="form-control" name="roomImg">
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="mukButton" style="width:100%; align:bottom !important">작성하기</button>
			</div>
		</form>
	</div>
	
	<script>
		$("button[type=submit]").on("click", function(){
			var content = $("textarea[name=roomInfo]").val();
			content = content.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("textarea[name=roomInfo]").val(content);
		});
	</script>
</body>
</html>