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
	.list-group li{width: 100px; height: 70px; text-align: center; padding: 20px;}
	#list1{margin-top:50px; margin-bottom: 50px;}
	h1{text-align: center; font-weight: 900;}
	#input{width: 500px;}
	.page-link{color:#3C988D;}
	.page-link:focus, .page-link:hover {color: #fff; background-color: #3C988D;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	ol.numbered {
	  list-style: none;
	  border-left: 3px solid RGB(107, 182, 236,0.7);
	  counter-reset: numbered-list;
	  margin-left: 10px;
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
	.ur{
			 box-shadow: 0px 8px 8px 0px rgba(0,0,0,0.3);
			 padding-left:0px;
			 padding-bottom:0px;
			 margin-left:0px;
			 border-radius:10px;
			 border: 2px solid  RGB(107, 182, 236, 0.3);
			 margin-top: 50px;
			 margin-bottom: 40px;
			 cursor: pointer;
		}
		li{list-style:none;}
		
		.ll{
			font-size: 20px;
			font-weight: 600;
			width:100%;
			
			color: #575757;
			text-align: center;
			height: 60px;
			float:left;
			vertical-align: middle;
			line-height: 3em;
			border: 1px solid #fffcfb;
			border-radius:10px;
			position: relative;
			display: block;
			text-decoration: none;
			box-shadow: 0em 1.5em 0 ,lightgrey;
			transition: all .25s linear;
		}
		.ll:hover {
			background: #6BB6EC;
			color: #fffcfb;
			transform: translate(-.9em, -.9em);
			transition: all .25s linear;
			box-shadow: 0.5em 2em 0 #e1e1e1;
		}
		  
		.ll{
		    transition: all .25s linear; 
		}
 	.card img{height: 250px;}
	.card{margin-bottom: 30px; cursor: pointer;}
	.card td{width: 80px; font-size: 14px; color: gray; margin-right: auto;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
</style>
</head>
<body style="background-color:white;">
	
	
	<jsp:include page="../member/menubar.jsp"/>
	
	<div class="container">
		<br><br><br><br><br><br><br><br>
		<h1 class="fw-bold" style="color: #6BB6EC; font-size: 55px;">여행친구찾기</h1>
		
		<!-- 카테고리 -->
		<ul id="category" class="ur" >
				<div style="display:flex;" lass="ur1">
					<li class="ll 0">전체</li>
					<li class="ll 1">서울</li>
					<li class="ll 2">인천</li>
					<li class="ll 3">대전</li>
					<li class="ll 4">대구</li>
					<li class="ll 5">광주</li>
					<li class="ll 6">부산</li>
					<li class="ll 7">울산</li>
					<li class="ll 8">세종</li>
				</div>
				<div style="display:flex;">
					<li class="ll 31">경기</li>
					<li class="ll 32">강원</li>
					<li class="ll 33">충북</li>
					<li class="ll 34">충남</li>
					<li class="ll 35">경북</li>
					<li class="ll 36">경남</li>
					<li class="ll 37">전북</li>
					<li class="ll 38">전남</li>
					<li class="ll 38">제주</li>
				</div>
		</ul>
		
		<!-- 검색하기 -->
			<div style="display: inline-block">
				<div class="input-group" id="input">
					<input type="text" class="searchInput1 form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</div>
			
		<!-- 글쓰기버튼 -->
			<div  style="float: right;">
				<button type="button" class="writeButton mukButton" style="width: 150px;" id="writeButton">글쓰기</button>
			</div>
			
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start" style="margin-top: 20px;">
				
				<div class="col" style="margin-bottom: 30px;">
					<div class="card card-cover h-100 overflow-hidden\">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
					  	<h5 style="margin-bottom: 20px;white-space:nomal;line-height:1.2;height:2.5em;overflow:hidden">저랑 같이 강릉가실분😉</h5>
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
						 </ol>
						 
						 <table>
						 	<tr>
						 		<td><i class="fa-solid fa-users"></i> 5/10</td>
						 		<td><i class="fa-solid fa-heart"></i> 여자만</td>
						 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
						 	</tr>
						 </table>
						 
					  </div>
					</div>
				</div>
				
				</div>
			
			<nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			      </a>
			    </li>
			    <li class="page-item"><a class="page-link" href="#">1</a></li>
			    <li class="page-item"><a class="page-link" href="#">2</a></li>
			    <li class="page-item"><a class="page-link" href="#">3</a></li>
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
			    </li>
			  </ul>
			</nav>
		
		</div>
		
		<script>
			const partyCards = document.getElementsByClassName('card');
			for(const partyCard of partyCards){
				partyCard.addEventListener('click', function(){
					location.href = '${contextPath}/partyDetail.pa';
				});
			}
			
			const writeButton = document.getElementById('writeButton');
			writeButton.addEventListener('click', function(){
				location.href = '${contextPath}/partyWrite.pa';
			});
		
		</script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>