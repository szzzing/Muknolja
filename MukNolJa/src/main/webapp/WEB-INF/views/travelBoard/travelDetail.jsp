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
			<h1>대관령 양떼목장</h1>
			
			<br>
			
			<h6>강원 평창군</h6>
			
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
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="10000">
		      <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA1MDhfNTkg%2FMDAxNjIwNDQ1NDEzMjMy.5MU5M5KGbrMq6NqH0nwDuT_aoLCLbm8YCU_XgDpqxN0g.xl4oeCee3CUuHTlOLPXFRsvxk4bFSqgG657ck29xcYMg.JPEG.number1khj%2F20140503_171748.jpg%234096x2304" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item" data-bs-interval="2000">
		      <img src="https://png.pngtree.com/thumb_back/fh260/background/20210207/pngtree-texture-black-background-simple-image_556931.jpg" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="https://png.pngtree.com/thumb_back/fh260/background/20210207/pngtree-texture-black-background-simple-image_556931.jpg" class="d-block w-100" alt="...">
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
			한국 농림부에서 지정한 동물복지와 산림보존에 특화된 목장이다. 20만 5,000㎡의 넓은 초지에 양들을 자유로이 방목한다. 1989년에 첫 축사를 완공하고 1991년에 면양을 들인 목장은 오늘날 면양 사육에 관해 한국 최고 수준의 시스템을 갖춘 목장으로 성장했다. 대관령양떼목장에서 즐길 거리는 크게 두 가지, 산책로 걷기와 먹이 주기 체험이다. 목장을 에두르는 1.2km 길이의 산책로는 40분가량이 소요된다. 야생식물이 자라는 산책로를 걸으며 초지에서 풀을 뜯는 양 떼를 만날 수 있다. 참고로 양은 초지 풀이 자라는 5월 중순~10월 말에 방목되고, 겨울에는 축사 안에서 생활한다. 산책로 초입에는 SNS 포토존으로 유명한 나무 움막이 있고, 산책로 중간 지점이자 목장 정상인 해발 920m에서 바라보는 백두대간은 막힌 가슴을 시원스럽게 한다. 산책로 마지막 코스인 먹이 주기 체험장에서는 축사 안의 양에게 건초를 줄 수 있다.
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
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667); 
	
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
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>