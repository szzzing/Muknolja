<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style>
		#carouselExampleInterval{height: 480px; margin-top: 80px;}
		#carouselExampleInterval img{height:480px;}
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
		.page-link:focus, .page-link:hover {color: #fff; background-color: #3C988D;}
		.travelInfo a{color: black; font-size: 25px; text-decoration: none;}
		.travelInfo p{color: gray; font-size: 15px; margin-top: 20px;}
		hr{margin: auto;}
		#hr1{height: 2px;}
		#num{margin: auto;}
		#num td:first-child{text-align:right;}
		#num td:nth-child(2){text-align:right;}
		#num button::after{content: "|"}
		#number{color: #3C988D;}
		#btn button{border: none; background: #fff; color: gray;}
		#btn button:hover{color: black; font-weight: 700;}
		#card{margin-bottom: 25px;}
	</style>
	
</head>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="10000">
	      <img src="https://search.pstatic.net/common?type=o&size=352x196&quality=75&direct=true&src=https%3A%2F%2Fg-grafolio.pstatic.net%2F20220130_97%2F1643543618449ELxOz_PNG%2FADBE82CC-2827-423F-8700-97641FDE75DF.png%3Ftype%3Df804_452" class="d-block w-100" alt="...">
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
	
	<div class="container">
	
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
		
		<hr id="hr1">
		
		<div id="num">
			<span>총 <span id="number">10000</span>건</span>
		</div>
		<div id="btn">
			<button>최신순</button>
			<button>인기순</button>
		</div>
		
		<hr id="hr2" >
		<br>
		
		<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start">

			 <div class="col">
	            <div id="card" class="card card-cover h-95 overflow-hidden\">
	               <img class="card-img-top"  style="height:300px;"  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTBfMjUw%2FMDAxNjUyMTY2NTY0Mzcx.2hqok9p-BJ-nUskBsMy3x-5ryOh1xdl7IoTJvQEQvpkg.zXcze5BuUlHaL7uSBu4OQCWDBKFp2rHk5VRnqdsSDywg.JPEG.gkdbqls13%2FIMG_3616.jpg&type=sc960_832">
	               <div class="card-body p-4 mb-auto">
	                  <h4 class="card-title lh-1 fw-bold">${ title }</h4>
	                  <div class="card-text text-muted">${ addr }</div>
	                  <div class="card-text text-muted">${ tel }</div>
	               </div>
	            </div>
	         </div>
			
			<div class="col">
	            <div id="card" class="card card-cover h-95 overflow-hidden\">
	               <img class="card-img-top"  style="height:300px;"  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTBfMjUw%2FMDAxNjUyMTY2NTY0Mzcx.2hqok9p-BJ-nUskBsMy3x-5ryOh1xdl7IoTJvQEQvpkg.zXcze5BuUlHaL7uSBu4OQCWDBKFp2rHk5VRnqdsSDywg.JPEG.gkdbqls13%2FIMG_3616.jpg&type=sc960_832">
	               <div class="card-body p-4 mb-auto">
	                  <h4 class="card-title lh-1 fw-bold">관광지이름</h4>
	                  <div class="card-text text-muted">지역이름</div>
	                  <div class="card-text text-muted">전화번호</div>
	               </div>
	            </div>
	         </div>
			
			<div class="col">
	            <div id="card" class="card card-cover h-95 overflow-hidden\">
	               <img class="card-img-top"  style="height:300px;"  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTBfMjUw%2FMDAxNjUyMTY2NTY0Mzcx.2hqok9p-BJ-nUskBsMy3x-5ryOh1xdl7IoTJvQEQvpkg.zXcze5BuUlHaL7uSBu4OQCWDBKFp2rHk5VRnqdsSDywg.JPEG.gkdbqls13%2FIMG_3616.jpg&type=sc960_832">
	               <div class="card-body p-4 mb-auto">
	                  <h4 class="card-title lh-1 fw-bold">관광지이름</h4>
	                  <div class="card-text text-muted">지역이름</div>
	                  <div class="card-text text-muted">전화번호</div>
	               </div>
	            </div>
	         </div>
	         
	         <div class="col">
	            <div id="card" class="card card-cover h-95 overflow-hidden\">
	               <img class="card-img-top"  style="height:300px;"  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTBfMjUw%2FMDAxNjUyMTY2NTY0Mzcx.2hqok9p-BJ-nUskBsMy3x-5ryOh1xdl7IoTJvQEQvpkg.zXcze5BuUlHaL7uSBu4OQCWDBKFp2rHk5VRnqdsSDywg.JPEG.gkdbqls13%2FIMG_3616.jpg&type=sc960_832">
	               <div class="card-body p-4 mb-auto">
	                  <h4 class="card-title lh-1 fw-bold">관광지이름</h4>
	                  <div class="card-text text-muted">지역이름</div>
	                  <div class="card-text text-muted">전화번호</div>
	               </div>
	            </div>
	         </div>
	         
	         <div class="col">
	            <div id="card" class="card card-cover h-95 overflow-hidden\">
	               <img class="card-img-top"  style="height:300px;"  src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA1MTBfMjUw%2FMDAxNjUyMTY2NTY0Mzcx.2hqok9p-BJ-nUskBsMy3x-5ryOh1xdl7IoTJvQEQvpkg.zXcze5BuUlHaL7uSBu4OQCWDBKFp2rHk5VRnqdsSDywg.JPEG.gkdbqls13%2FIMG_3616.jpg&type=sc960_832">
	               <div class="card-body p-4 mb-auto">
	                  <h4 class="card-title lh-1 fw-bold">관광지이름</h4>
	                  <div class="card-text text-muted">지역이름</div>
	                  <div class="card-text text-muted">전화번호</div>
	               </div>
	            </div>
	         </div>
	         
	         
	      </div>
	         
		
		<br>
		
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
