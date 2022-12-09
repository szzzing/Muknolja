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
	#category{
 		width: 90%;
		height: 150px;
		border-radius: 5px;
		border-style: hidden;
		box-shadow: 0 0 0 1px #d3d3d3;
		table-layout: fixed;
		margin-left:auto; 
    	margin-right:auto;
		margin-top: 30px;
    	margin-bottom: 30px;
    	clear: both;
	}
	#category td{text-align: center;}
	.list-group li{width: 100px; height: 70px; text-align: center; padding: 20px;}
	#list1{margin-top:50px; margin-bottom: 50px;}
	h1{text-align: center; font-weight: 900;}
	#input{width: 400px;}
	.page-link{color:#3C988D;}
	.page-link:focus, .page-link:hover {color: #fff; background-color: #3C988D;}
	
	ol.numbered {
	  list-style: none;
	  border-left: 3px solid #b3b3b3;
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
	
	
	.card img{height: 250px;}
	.card{margin-bottom: 30px;}
	.card td{width: 70px; font-size: 14px; color: gray; margin-right: auto;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
</style>
</head>
<body>
	
	
	<jsp:include page="../member/menubar.jsp"/>
	
	<div class="container">
		<br><br><br><br><br><br>
		<h1>동행게시판</h1>
		
		<table id="category" class="table table-bordered align-middle">
			<tr>
				<td>서울</td>			
				<td>인천</td>			
				<td>대전</td>			
				<td>대구</td>			
				<td>광주</td>			
				<td>부산</td>			
				<td>울산</td>			
				<td>세종</td>			
				<td>경기</td>			
			</tr>
			<tr>
				<td>강원</td>			
				<td>충북</td>			
				<td>충남</td>			
				<td>경북</td>			
				<td>경남</td>			
				<td>전북</td>			
				<td>전남</td>			
				<td>제주</td>			
				<td>전체보기</td>			
			</tr>
		</table>
			
			<div class="input-group" id="input">
				<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
			
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start" style="clear: both; margin-top: 20px;">
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
						 </ol>
						 
						 <table>
						 	<tr>
						 		<td><i class="fa-solid fa-users"></i> 5/10</td>
						 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
						 	</tr>
						 </table>
						 
					  </div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
							</ol>
							
							<table>
							 	<tr>
							 		<td><i class="fa-solid fa-users"></i> 5/10</td>
							 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
							 	</tr>
							 </table>
					  </div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
							</ol>
							
							<table>
							 	<tr>
							 		<td><i class="fa-solid fa-users"></i> 5/10</td>
							 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
							 	</tr>
							 </table>
					  </div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
							</ol>
							
							<table>
							 	<tr>
							 		<td><i class="fa-solid fa-users"></i> 5/10</td>
							 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
							 	</tr>
							 </table>
					  </div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
							</ol>
							
							<table>
							 	<tr>
							 		<td><i class="fa-solid fa-users"></i> 5/10</td>
							 		<td><i class="fa-regular fa-comment-dots"></i> 5개</td>
							 	</tr>
							 </table>
					  </div>
					</div>
				</div>
				
				<div class="col-md-3">
					<div class="card h-90" style="width: 18rem;">
					  <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjExMTBfMTE1%2FMDAxNjY4MDU3MjU0NjQ5.1oHW6oHqjqL5w5UE0J8YFeAyXkCvdTWz-ZzIi4ThPywg.FeBfV1UwWQ5jz_BUu6222dXZrS6jMVuX4Kf0Yt0o7kog.JPEG.lollol7768%2FKakaoTalk_20221109_092054938_26.jpg&type=sc960_832" class="card-img-top" alt="...">
					  <div class="card-body">
						  <ol class="numbered">
							  <li>List item one</li>
							  <li>List item two</li>
							  <li>List item three</li>
							  <li>List item four</li>
							</ol>
							
							<table>
							 	<tr>
							 		<td><i class="fa-solid fa-users"></i> 5/10</td>
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
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>