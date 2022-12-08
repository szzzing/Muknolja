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
	h1{text-align: center; margin-bottom: 30px;}
	#datepicker{cursor: pointer;}
	#title{margin-bottom: 30px;}
 	.compDate label{color: #3C988D; font-size: 13px;}
	#gender label{color: #3C988D; font-size: 13px;}
	.compNum input{accent-color: #3C988D;}
	.content{height: 400px; margin-bottom: 30px;}
	.content label{font-size: 20px;}
	#location1, #location2{border: 1px solid lightgray; height: 250px; margin-bottom: 30px; border-radius: 5px;}
	#location1{padding: 15px;}
	#location1 button{float: right;}
	#location1 img{border-radius: 50%; width: 50px; height: 50px; margin-bottom: 10px;}
	#location2{overflow-x: auto;}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px;}
 	
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
	  left: -19.5px;
	  text-align: center;
	}
	
</style>
</head>
<body>

	<div class="container">
	
	<br><br><br><br><br><br>
	
		<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMDlfODgg%2FMDAxNjY3OTY5OTMzNzUw.nBSmNlV8uDvnFKqWt-OPry4vj_kqvXvAbEncuTSeIQ4g.3TXDOLw_NDlgt2Eq7MmNMRoIZbVVSlbcWBE9Is6kh3cg.JPEG.yomlog%2FIMG_6948.jpg&type=sc960_832" class="img-fluid" alt="..." id="thumbnail">
		
		<!-- 제목 -->
		<div id="title" class="input-group input-group-lg">
		  <span class="input-group-text" id="inputGroup-sizing-lg" style="background: #3C988D; color: white">제목</span>
		  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-lg">
		</div>
		
		<!-- 코스선택 -->
		<div class="row">
			<div class="col">
				<div id="location1">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
					<label>슬픈고양이</label>
					<p><i class="fa-solid fa-location-dot"></i> 서울</p>
					<p>모집인원 5/10</p>
					<p><i class="fa-solid fa-calendar-days"></i> 2022.12.25~2022.12.27</p>
					<button type="button" class="btn btn-outline-primary">참여하기</button>
				</div>
			</div>
			
			<div class="col">
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
					</ol>
				</div>
				
			</div>
		</div>
		
		<!-- 내용 -->
		<div class="content input-group">
		  <span class="input-group-text" style="background: #3C988D; color: white;">내용</span>
		  <textarea class="form-control" aria-label="With textarea" style="resize: none;"></textarea>
		</div>
		

		<br><br>
		
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>