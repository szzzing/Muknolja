<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	h1{text-align: center; font-weight: 900;}
	h6{text-align: center; font-weight: bold; color: gray;}
	#travelBtn{float: right; margin-top: 70px; margin-bottom: 10px;}
	#travelBtn button{font-size: 20px; color: gray; background: white; border: none; margin-left: 10px;}
	#carouselExampleInterval{height: 600px; margin-bottom: 10px;}
	#carouselExampleInterval img{height: 600px;}
	#detailContent{border-top: 2px solid gray; padding: 10px; margin-bottom: 20px;}
	#travelReply{margin-top: 30px;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>
	
	<div class="container">
	
		<br><br><br><br><br><br><br>
			<h1>${title}</h1>
			
			<br>
<%-- 			${tList} --%>
			
			<h6>${addr}</h6>
			
			<div id="travelBtn">
				<button id="print"><span><i class="fa-solid fa-print"></i></span></button>
				<button id="travelCount"><span><i class="fa-solid fa-eye"></i> 30</span></button>
			</div>
			
		<table class="table text-center mt-5 mb-5">
			<tr>
				<td scope="col">
					<h5>사진보기</h5>
				</td>
				<td scope="col">
					<h5>상세정보</h5>
				</td>
				<td scope="col">
					<h5>댓글보기</h5>
				</td>
			</tr>
		</table>
		
		<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner carouselImg">
		    <div class="carousel-item active" data-bs-interval="2000">
		      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDhfNTkg%2FMDAxNjIwNDQ1NDEzMjMy.5MU5M5KGbrMq6NqH0nwDuT_aoLCLbm8YCU_XgDpqxN0g.xl4oeCee3CUuHTlOLPXFRsvxk4bFSqgG657ck29xcYMg.JPEG.number1khj%2F20140503_171748.jpg%234096x2304" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
		
		<br><br>
		
		<h4>상세정보</h4>
		
		<div id="detailContent">
			${overview}
		</div>
		
		<div id="map" style="width:100%;height:350px;"></div>
		
		<div id="travelReply">
			<h4 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>0</span></h4>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
			</div>
		</div>
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
	</div>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ca321a5811ec7bd78b88fbdc6d97e558"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${mapy}, ${mapx}), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${mapy}, ${mapx}); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
	</script>
	
	<script>
		$('#print').click(function(){
			window.print();
		});
		
		
		$.ajax({
			method: "GET",
			url: "http://apis.data.go.kr/B551011/KorService/detailImage?serviceKey=yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=" + ${contentId} + "&imageYN=Y&subImageYN=Y&_type=json",
			data: {},
			success: (response) =>{
				let items = response["response"]["body"]["items"]["item"]
				for(let i = 0; i < items.length; i++){
					let image = items[i]["originimgurl"];
					
					var carouselDiv = $('.active').clone();
					carouselDiv.prop('src', image);
					
// 					<div class="carousel-item active" data-bs-interval="2000">
// 				      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDhfNTkg%2FMDAxNjIwNDQ1NDEzMjMy.5MU5M5KGbrMq6NqH0nwDuT_aoLCLbm8YCU_XgDpqxN0g.xl4oeCee3CUuHTlOLPXFRsvxk4bFSqgG657ck29xcYMg.JPEG.number1khj%2F20140503_171748.jpg%234096x2304" class="d-block w-100" alt="...">
// 				    </div>
					
				}
			},
			error: (data)=>{
				console.log(data);
			}
		});
		
		
		
		
		
// 			url: "http://apis.data.go.kr/B551011/KorService/detailIntro?serviceKey=yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D&numOfRows=20&pageNo=" + ${page} + "&MobileOS=ETC&contentId=" + ${contentId} + "&contentTypeId=12&_type=json",
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>