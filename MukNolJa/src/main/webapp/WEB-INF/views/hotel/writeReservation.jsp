<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	.mukRound {border-radius: 10px;}
	.mukButton {background: #6BB6EC; color:white; height:40px; border-radius: 10px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	.mukMutedText {color:#B9B9B9;}
	
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

	<div class="container mt-5 mb-5">
		<form id="reservationForm" action="insertReservation.ho" class="row row-cols-1 row-cols-sm-1 row-cols-md-2 row-cols-lg-2 justify-content-between">
			
			<div class="col-md-6 col-lg-6 pt-5">
			
				<!-- 예약자 정보 시작 -->
				<h4 class="fw-bold pb-5">예약자 정보</h4>
				<div class="mb-5">
					<label for="reservationName" class="form-label mukMutedText">예약자 이름</label>
					<input type="text" class="form-control" name="reservationName" placeholder="체크인시 필요한 정보입니다." value="${loginUser.name }" required>
				</div>
				<div class="mb-5">
					<label for="reservationPhone" class="form-label mukMutedText">휴대폰 번호</label>
					<input type="tel" class="form-control" name="reservationPhone" placeholder="체크인시 필요한 정보입니다." value="${loginUser.phone }" required>
				</div>
				<!-- 예약자 정보 끝 -->
				
				<!-- 결제수단 선택 시작 -->
				<h4 class="fw-bold pt-5 pb-3">결제수단 선택</h4>
				<select class="form-select" name="paymentMethod">
					<option selected value="html5_inicis">신용카드</option>
					<option value="kakaopay">카카오페이</option>
					<option value="tosspay">토스페이</option>
				</select>
				<!-- 결제수단 선택 끝 -->
			
			</div>
			
			<div class="col-md-5 col-lg-5 pt-5">
				<div id="reservationInfo">
					<div class="p-5">
						<div class="mb-3">
							<div class="mukMutedText mb-1">호텔 이름</div>
							<h5>${hotel.hotelName }</h5>
							<input type="hidden" name="hotelId" value="${hotel.hotelId }">
							<input type="hidden" name="hotelName" value="${hotel.hotelName }">
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">객실 이름</div>
							<h5>${room.roomName }</h5>
							<input type="hidden" name="roomId" value="${room.roomId }">
							<input type="hidden" name="roomName" value="${room.roomName }">
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">숙박기간</div>
							<fmt:parseNumber value="${r.checkinDate.time / (1000*60*60*24)}" integerOnly="true" var="checkinDate" scope="request"/>
							<fmt:parseNumber value="${r.checkoutDate.time / (1000*60*60*24)}" integerOnly="true" var="checkoutDate" scope="request"/>
							<h5>${checkoutDate - checkinDate }박 ${checkoutDate - checkinDate+1 }일</h5>
						</div>
						<div class="mb-3">
							<div class="mukMutedText mb-1">체크인</div>
							<input type="hidden" name="checkinDate" value="${r.checkinDate }">
							<input type="hidden" name="checkinTime" value="${room.checkinTime }">
							<h5><fmt:formatDate value="${r.checkinDate }" pattern="MM.dd E" /> ${room.checkinTime }</h5>
						</div>
						<div>
							<div class="mukMutedText mb-1">체크아웃</div>
							<input type="hidden" name="checkoutDate" value="${r.checkoutDate }">
							<input type="hidden" name="checkoutTime" value="${room.checkoutTime }">
							<h5><fmt:formatDate value="${r.checkoutDate }" pattern="MM.dd E" /> ${room.checkoutTime }</h5>
						</div>
						<hr class="mukMutedText mt-5 mb-5">
						<div>
							<div class="mb-1">
								<span class="fw-bold">총 결제 금액</span><span>(VAT 포함)</span>
							</div>
							<input type="hidden" name="paymentAmount" value="${room.roomPrice }">
							<h4 class="fw-bold" style="color:#6BB6EC"><fmt:formatNumber value="${room.roomPrice }" pattern="#,###원"/></h4>
						</div>
					</div>
					<button type="button" id="reservationButton" class="mukButton" style="width:100%; height:50px;">결제하기</button>
				</div>
			</div>
		</form>
	</div>


	<!-- 아임포트 결제 api 구현 -->
	<script>
		var IMP = window.IMP; // 생략 가능
		IMP.init("imp30848876"); // 예: imp00000000
		
		$("#reservationButton").on("click", function(){
			requestPay();
		});
		
		function requestPay() {
			// IMP.request_pay(param, callback) 결제창 호출
			IMP.request_pay({ // param
				pg: $("select[name=paymentMethod]").val(),
				merchant_uid: "${currentReservationId}",
				name: "${hotel.hotelName} "+"${room.roomName}",
				amount: 100,
				buyer_email: "gildong@gmail.com",
				buyer_name: "${loginUser.name}",
				buyer_tel: "${loginUser.phone}",
				buyer_addr: "${loginUser.address}",
				buyer_postcode: "null"
			}, function(rsp) { // callback
			  		console.log(rsp);
				if (rsp.success) {
					// 결제 성공 시 로직,
					$("form").submit();
				} else {
					// 결제 실패 시 로직,
					alert(rsp.error_msg);
				}
			});
		}
	</script>
	<!-- 아임포트 결제 api 구현 -->


	<!-- 전화번호 입력 설정 시작 -->
	<script>
		function autoHypenTel(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';

			if (str.substring(0, 2) == 02) {
				// 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
				if (str.length < 3) {
					return str;
				} else if (str.length < 6) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2);
					return tmp;
				} else if (str.length < 10) {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 3);
					tmp += '-';
					tmp += str.substr(5);
					return tmp;
				} else {
					tmp += str.substr(0, 2);
					tmp += '-';
					tmp += str.substr(2, 4);
					tmp += '-';
					tmp += str.substr(6, 4);
					return tmp;
				}
			} else {
				// 핸드폰 및 다른 지역 전화번호 일 경우
				if (str.length < 4) {
					return str;
				} else if (str.length < 7) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3);
					return tmp;
				} else if (str.length < 11) {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 3);
					tmp += '-';
					tmp += str.substr(6);
					return tmp;
				} else {
					tmp += str.substr(0, 3);
					tmp += '-';
					tmp += str.substr(3, 4);
					tmp += '-';
					tmp += str.substr(7);
					return tmp;
				}
			}
			return str;
		}
		
		
		$('input[type=tel]').keyup(function(event) {
			event = event || window.event;
			var _val = this.value.trim();
			this.value = autoHypenTel(_val);
		});
	</script>
	<!-- 전화번호 입력 설정 끝 -->
</body>
</html>