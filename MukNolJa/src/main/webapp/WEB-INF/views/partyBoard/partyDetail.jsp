<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	h3{font-weight: bold;}
	.title{height: 300px; margin-bottom: 10px; margin-top: 30px;}
	.title button{background: #6BB6EC; border-color: #6BB6EC;}
	.title button:hover{background: white; color: #6BB6EC; border-color: #6BB6EC;}
	#location1, #location2{border: 1px solid lightgray; border-radius: 5px;}
	#location1{padding-left: 20px; padding-top: 15px; padding-right: 20px; height: 200px; margin-bottom: 30px;}
	#location2{height: 400px;}
	#location1 button{float: right;}
	#profile img{border-radius: 50%; width: 50px; height: 50px; margin-bottom: 10px;}
	#location2{overflow-x: auto;}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px;}
	.content{height: 250px; margin-bottom: 30px;}
	.content textarea{border: none;}
	
 	
 	ol.numbered {
	  list-style: none;
	  border-left: 3px solid #b3b3b3;
	  counter-reset: numbered-list;
	  margin-left: 100px;
	  margin-top: 20px;
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
	  background-color: #b3b3b3;
	  border: 3px solid white;
	  border-radius: 50%;
	  color: white;
	  content: counter(numbered-list, decimal);
	  counter-increment: numbered-list;
	  display: block;
	  font-weight: bold;
	  width: 30px;
	  height: 30px;
	  margin-top: -0.5em;
	  line-height: 30px;
	  position: absolute;
	  left: -17px;
	  text-align: center;
	}
	
	#travelReply{margin-top: 30px;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
	
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>

	<div class="container">
	
		<br><br><br><br><br><br>
	
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMDlfODgg%2FMDAxNjY3OTY5OTMzNzUw.nBSmNlV8uDvnFKqWt-OPry4vj_kqvXvAbEncuTSeIQ4g.3TXDOLw_NDlgt2Eq7MmNMRoIZbVVSlbcWBE9Is6kh3cg.JPEG.yomlog%2FIMG_6948.jpg&type=sc960_832" class="img-fluid" alt="..." id="thumbnail">
		
		
		<div class="title row">
			<div class="col-lg-8">
				<!-- 제목 -->
				<h3>저랑 같이 강릉가실분😉</h3>
				
				<!-- 선택목록 -->
				<div id="location1">
					<p><i class="fa-solid fa-location-dot"></i> 서울</p>
					<p>모집인원 5/10</p>
					<p><i class="fa-solid fa-calendar-days"></i> 2022.12.25~2022.12.27</p>
					<button type="button" class="btn btn-primary btn-lg">동행참여하기</button>
				</div>
				
				<!-- 내용 -->
				<div class="content input-group">
				  <textarea class="form-control" aria-label="With textarea" style="resize: none;">크리스마스에 강릉 같이 가실분 코스는 대충 짰고 가실분들 있으면 코스 같이 상의해서 더 짜봐요! 같이 놀면 재밌을거같아요!!</textarea>
				</div>
			</div>
			
			<div class="col">
				<div id="profile">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
 					<label style="font-weight: bold;">슬픈고양이</label>
 					<button type="button" class="btn btn-primary btn-sm" style="font-size: 10px; font-weight: 100; border-radius: 10px;">채팅하기</button>
				</div>
				<div id="location2">
					 <ol class="numbered">
						<li>List item one</li>
						<li>List item two</li>
						<li>List item three</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
						<li>List item four</li>
					</ol>
				</div>
			</div>
			
			<div id="partyReply">
				<h4 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>0</span></h4>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
				</div>
			</div>
		</div>
		
		

		<br><br>
		
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>