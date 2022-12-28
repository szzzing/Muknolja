<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>

<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	h1{text-align: center; margin-bottom: 30px;}
	#datepicker{cursor: pointer;}
	#title{margin-bottom: 30px;}
 	.compDate label{color: #6BB6EC; font-size: 13px;}
	#gender label{color: #6BB6EC; font-size: 13px;}
	#location label{color: #6BB6EC; font-size: 13px;}
	.compNum input{accent-color: #6BB6EC;}
	.compNum label{color: #6BB6EC; font-size: 13px;}
	.content{height: 400px; margin-bottom: 30px;}
	.content label{font-size: 17px; color: #6BB6EC;}
	.location1{border: 1px solid lightgray; height: 300px; margin-top: 20px; margin-bottom: 20px; border-radius: 5px; padding: 10px; overflow-x: auto;}
	.searchInfo p{color: lightgray; font-size: 12px;}
	.searchInfo hr{height: 1px;}
	.location2{border: 1px solid lightgray; height: 358px; border-radius: 5px; overflow-x: auto;}
	.location1::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	.location1::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: lightgray; /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	.location1::-webkit-scrollbar-track {
	    background: rgba(176, 176, 176, .1);  /*스크롤바 뒷 배경 색상*/
	}
	.location2::-webkit-scrollbar {
	    width: 8px;  /* 스크롤바의 너비 */
	}
	.location2::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: lightgray; /* 스크롤바의 색상 */
	    border-radius: 10px;
	}
	.location2::-webkit-scrollbar-track {
	    background: rgba(176, 176, 176, .1);  /*스크롤바 뒷 배경 색상*/
	}
	ol.numbered {
	  list-style: none;
	  border-left: 3px solid RGB(107, 182, 236,0.7);
	  counter-reset: numbered-list;
	  margin-left: 50px;
	  margin-top: 25px;
	  position: relative;
	}
	ol.numbered li {
	  font-size: 16px;
	  line-height: 1.2;
	  margin-bottom: 30px;
	  padding-left: 10px;
	}
	ol.numbered li:last-child {
	  border-left: 3px solid white;
	  margin-left: -3px;
	}
	ol.numbered li:before {
	  background-color: #6BB6EC;
	 
	  border-radius: 50%;
	  color: white;
	  content: counter(numbered-list, decimal);
	  counter-increment: numbered-list;
	  display: block;
	  font-weight: bold;
	  width: 30px;
	  height: 30px;
	  margin-top: -0.4em;
	  line-height: 30px;
	  position: absolute;
	  left: -17px;
	  text-align: center;
	  padding-top:-10px;
	}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
 	#select{float: left;}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px; background: lightgray; color: white;}
 	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
</style>
</head>
<body>
	
	<jsp:include page="../member/menubar.jsp"/>
	
	
	<div class="container">
	
	<br><br><br><br><br><br>
		<img src="${ contextPath }/resources/img/noImage.png" class="img-fluid" alt="..." id="thumbnail">
	
		<!-- 제목 -->
		<div id="title" class="input-group input-group-lg">
		  <span class="input-group-text" id="inputGroup-sizing-lg" style="background: #6BB6EC; color: white">제목</span>
		  <input type="text" class="title form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg" required>
		</div>
		
		<!-- 선택 -->
		<div class="row">
			<div class="col">
				<div id="location" class="form-floating">
					<select id="selectLocation"class="form-select" aria-label="Default select example">
						<option selected disabled>지역</option>
						<option value="서울">서울</option>
						<option value="인천">인천</option>
						<option value="대전">대전</option>
						<option value="대구">대구</option>
						<option value="광주">광주</option>
						<option value="부산">부산</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="제주">제주</option>
					</select>
					<label for="floatingSelect">지역</label>
				</div>
			</div>
			<div class="col">
				<div class="compDate form-floating mb-3">
					<input type="text" class="travelDate form-control" id="daterangepicker" name="daterangepicker">
					<label for="floatingInput">날짜선택</label>
				</div>
			</div>
			
			<div class="col">
				<div id="gender" class="form-floating">
				  <select class="gender form-select" id="floatingSelect" aria-label="Floating label select example">
				    <option selected disabled>성별</option>
				    <option value="여자만">여자만</option>
				    <option value="남자만">남자만</option>
				    <option value="무관">무관</option>
				  </select>
				  <label for="floatingSelect">성별</label>
				</div>
			</div>
			
			<div class="col">
				<div class="compNum form-floating mb-3">
					<input type="number" class="partyNum form-control" min="1" max="20">
					<label for="floatingInput">동행인원(최대 20명)</label>
				</div>
			</div>
		</div>
		
		<!-- 코스선택 -->
		<h3 style="margin-top: 20px; font-weight: 600; color: #6BB6EC;">코스선택</h3>
		<div class="row" style="margin-top: 20px;">
			<div class="col">
				<div class="row">
					
					<div class="col">
						<div class="input-group" id="input">
							<input type="text" id="searchInput" class="form-control" placeholder="여행지 검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
						</div>
					</div>
				</div>
				
				<div id="location1" class="location1">
				</div>
			</div>
			
			<div class="col">
				<div class="location2">
					<ol class="numbered">
					</ol>
				</div>
				<h6 style="text-align: right; color: gray; font-size: 13px; margin-bottom: 15px;"><i class="fa-solid fa-check"></i>클릭시 삭제가능</h6>
				
			</div>
		</div>
		
		<!-- 내용 -->
	<form action="${contextPath}/insertParty.pa" method="POST" enctype="multipart/form-data">
		<div class="content form-floating">
		  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 400px; resize: none;" name="partyContent"></textarea>
		  <label for="floatingTextarea2">내용</label>
		</div>
		
		<div class="d-grid gap-2">
			<button type="submit" class="writeButton mukButton" style="width: 100%;" id="writeButton">작성하기</button>
 		</div>
 		
 		<!-- hidden값 -->
 		<input id="myFile" type="file" accept="image/*" style="display:none;" name="firstFile">
 		<input type="hidden" name="partyTitle" id="hiddenTitle">
 		<input type="hidden" name="partyArea" id="hiddenLocation">
 		<input type="hidden" name="partyStartDate" id="hiddenStartDate">
 		<input type="hidden" name="partyEndDate" id="hiddenEndDate">
 		<input type="hidden" name="gender" id="hiddenGender">
 		<input type="hidden" name="maxParticipate" id="hiddenNum">
 		<input type="hidden" name="partyCourse" id="hiddenCourse">
 		<input type="hidden" name="contentCourse" id="hiddenCourse2">
 	</form>
		
		<br><br>
		
		
	</div>
	
	<script>
		<!-- 제목넣기 -->
		const hiddenTitle = document.getElementById('hiddenTitle');
		const title = document.getElementsByClassName('title')[0];
		title.addEventListener('focusout', function(){
			hiddenTitle.value = title.value;
			console.log(hiddenTitle.value);
		});
		
		<!-- 지역넣기 -->
		const hiddenLocation = document.getElementById('hiddenLocation');
		const selectLocation = document.getElementById('selectLocation');
		selectLocation.addEventListener('change', function(){
			hiddenLocation.value = selectLocation.value;
			console.log(hiddenLocation.value);
		});
		
		<!-- 성별넣기 -->
		const hiddenGender = document.getElementById('hiddenGender');
		const gender = document.getElementsByClassName('gender')[0];
		gender.addEventListener('change', function(){
			hiddenGender.value = gender.value;
			console.log(hiddenGender.value);
		});
		
		<!-- 인원수넣기 -->
		const hiddenNum = document.getElementById('hiddenNum');
		const partyNum = document.getElementsByClassName('partyNum')[0];
		partyNum.addEventListener('focusout', function(){
			if(partyNum.value > 20){
				partyNum.value = 20;
			}
			hiddenNum.value = partyNum.value;
		});
		
		<!-- 코스넣기 -->
		const writeButton = document.getElementById('writeButton');
		const numberLis = document.getElementsByClassName('numberLi');
		const contentIds = document.getElementsByClassName('contentId2');
		const hiddenCourse = document.getElementById('hiddenCourse');
		const hiddenCourse2 = document.getElementById('hiddenCourse2');
		var courseTest = "";
		var courseTest2 = "";
		writeButton.addEventListener('click', function(){
			for(const numberLi of numberLis){
				courseTest += numberLi.innerText + '/';
			}
			for(const contentId of contentIds){
				courseTest2 += contentId.value + '/';
			}
			hiddenCourse.value = courseTest.slice(0, -1);
			hiddenCourse2.value = courseTest2.slice(0, -1);
		});
		
		
		
 		<!-- 첨부파일 -->
	    $("#thumbnail").click(function(){
	    	$('#myFile').click();
	    });

	    const myFile = document.querySelector('#myFile');
	    const thumbnail = document.querySelector('#thumbnail');
	    
		    myFile.addEventListener('change', ()=>{
		    	const reader = new FileReader();
		    	reader.onload = function(e){
					console.log(e);		    		
		    		thumbnail.src = e.target.result;
		    	};
		    	reader.readAsDataURL(myFile.files[0]);
		    });
		    
 		<!-- 코스검색API -->
		const searchButton = document.getElementById('button-addon2');  
		const locationDiv = document.getElementById('location1');
	   	const searchInput = document.getElementById('searchInput');
		
	   	searchInput.addEventListener('keypress', function(e){
	   		if (e.keyCode === '13') {
	   	        event.preventDefault();
	   	        searchButton.click();
	   	    }
			
			while(locationDiv.firstChild){
				locationDiv.removeChild(locationDiv.firstChild);
			}
			
			const keyword = searchInput.value;
			$.ajax({
				method: "GET",
				url: "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=20&listYN=Y&&arrange=A&keyword=" + keyword +"&_type=json",
				data: {},
				success: (response) =>{
					let items = response["response"]["body"]["items"]["item"];
					
					var all = '';
					
					for(let i = 0; i < items.length; i++){
						
						let title = items[i]["title"];
						let addr = items[i]["addr1"];
						let contentId = items[i]["contentid"];
						
						var span = '<span>' + title + '</span>';
						var p = '<p>' + addr + '</p>';
						var hidden = '<input type="hidden" value="' + contentId + '" class="contentId1">';
						var searchDiv = '<div class="searchInfo" style="cursor: pointer;">' + span + p + hidden + '</div><hr>';
						
						document.querySelector('.location1').innerHTML += searchDiv;
					}
				},
				error: (data)=>{
					console.log(data);
				}
			});
			
   		});
	   	
 	   	<!-- 코스선택 후 리스트에 추가 -->
	   	$(document).on('click', '.searchInfo', function(){
	   		var li = '<li class="numberLi" style="cursor: pointer">' + this.querySelector('span').innerText + '</li>';
	   		var ContentId = '<input type="hidden" value="' + this.querySelector('.contentId1').value + '" class="contentId2">';
	   		var numLi = document.querySelector('.numbered');
	   		numLi.innerHTML += (li+ContentId);

			const locDiv = document.getElementsByClassName('location2')[0];
			locDiv.isScrollBottom = true;
				
			locDiv.addEventListener("scroll", (event) => {
				if (event.target.scrollHeight - event.target.scrollTop === event.target.clientHeight) {
					locDiv.isScrollBottom = true;
				} else {
					locDiv.isScrollBottom = false;
				}
			});
			
			if (locDiv.isScrollBottom) {
				locDiv.scrollTop = locDiv.scrollHeight;
			}

	   		if(numLi.childElementCount > 20){
	   			alert('20개 까지만 선택할 수 있습니다.');
	   			numLi.removeChild(numLi.lastChild);
	   		}
	   	});
	   	
 	   	<!-- 코스지우기 -->
	   	$(document).on('click', '.numberLi', function(){
	   		this.remove(this);
	   	});
	</script>
	
	<script>
//  	✔datepicker
		$(function(){
			$('#daterangepicker').daterangepicker();
			$("#daterangepicker").daterangepicker({
			    locale: {
			    "separator": " ~ ",                     // 시작일시와 종료일시 구분자
			    "format": 'YYYY-MM-DD',     // 일시 노출 포맷
			    "applyLabel": "확인",                    // 확인 버튼 텍스트
			    "cancelLabel": "취소",                   // 취소 버튼 텍스트
			    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
			    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
			    },
			    minDate: new Date(),
			    autoApply: true,                         // 확인/취소 버튼 사용여부
			});
			
			<!-- 날짜넣기 -->
			$('.travelDate').change(function(){
				$('#hiddenStartDate').val($('.travelDate').val().split(" ~ ")[0]);
				$('#hiddenEndDate').val($('.travelDate').val().split(" ~ ")[1]);
			});
			
		});
		
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
</body>
</html>