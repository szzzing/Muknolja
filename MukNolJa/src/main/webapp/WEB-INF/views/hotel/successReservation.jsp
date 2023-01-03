<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹놀자</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	.form-control {border:1px solid #e9e9e9 !important}
	.mukRound {border-radius: 10px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.mukMutedText {color:#B9B9B9;}
	::-webkit-scrollbar {width:5px;}
	::-webkit-scrollbar-thumb {background-color:#e9e9e9; border-radius:10px;}
	::-webkit-scrollbar-track {opacity:0;}
	#reservationInfo {
		background: #F9F9F9;
		border-radius: 20px;
	}
</style>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

</head>
<body>
	<div class="container text-center mt-5 mb-5">
		<h2 class="fw-bold">예약이 완료되었습니다.</h2>
		
		<div id="reservationInfo" class="row justify-content-center">
			<div class="col-lg-10 p-5" style="background:#fafafa; border-radius:20px;">
				<div class="row row-cols-1 row-cols-lg-2 gy-5">
					<div class="col">
						<img class="hotelImg img-fluid mukRound" src="${contextPath }/resources/uploadFiles/08a25a9e-80fa-43eb-9cbb-3fafca66c0ac.jpg" style="background-color:#F9F9F9;">
					</div>
					<div class="col">
						<table class="table table-borderless align-middle">
							<tr>
								<td class="mukSubText mb-1" style="width:100px;"><small>객실 정보</small></td>
								<td><h5>${r.hotelName } ${r.roomName }</h5></td>
							</tr>
							<tr>
								<td class="mukSubText mb-1" style="width:100px;"><small>예약 번호</small></td>
								<td><h5>${r.reservationId }</h5></td>
							</tr>
							<tr>
								<td class="mukSubText mb-1" style="width:100px;"><small>예약자 이름</small></td>
								<td><h5>${r.reservationName }</h5></td>
							</tr>
							<tr>
								<td class="mukSubText mb-1" style="width:100px;"><small>휴대폰 번호</small></td>
								<td><h5>${r.reservationPhone }</h5></td>
							</tr>
							<tr>
								<td class="mukSubText mb-1"><small>체크인</small></td>
								<td><h5><fmt:formatDate value="${r.checkinDate }" pattern="MM.dd E" /> ${r.checkinTime }</h5></td>
							</tr>
							<tr>
								<td class="mukSubText mb-1"><small>체크아웃</small></td>
								<td><h5><fmt:formatDate value="${r.checkoutDate }" pattern="MM.dd E" /> ${r.checkoutTime }</h5></td>
							</tr>
							<tr>
								<td class="mb-1">
									<small class="mukSubText">총 결제 금액</small>
								</td>
								<td><h5><fmt:formatNumber value="${r.paymentAmount }" pattern="#,###원"/></h5></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<button type="button" class="mukButton mt-3">메인으로</button>
	</div>
	
	
	<script>
		$("button").on("click", function(){
			location.href="${contextPath}/hotelList.ho";
		});
	</script>
</body>
</html>