<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style>
		#carouselExampleInterval{height: 550px; margin-top: 80px;}
		#carouselExampleInterval img{height:550px;}
		.page-link:focus, .page-link:hover {color: #fff; background-color: #6BB6EC;}
		.travelInfo a{color: black; font-size: 25px; text-decoration: none;}
		.travelInfo p{color: gray; font-size: 15px; margin-top: 20px;}
		hr{margin: auto;}
		#hr1{height: 2px;}
		#num{margin: auto;}
		#num td:first-child{text-align:right;}
		#num td:nth-child(2){text-align:right;}
		#num button::after{content: "|"}
		#number{color: #6BB6EC;}
		#btn button{border: none; background: #fff; color: gray;}
		#btn button:hover{color: black; font-weight: 700;}
		.allCard{margin-bottom: 35px; cursor: pointer;}
		.card-text{font-size: 13px;}
		#input{width: 400px;}
		#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
		#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
		
		
		
		.ur{
		  margin-top:5%;
		  box-shadow: 0px 10px 10px 0px rgba(0,0,0,0.3);
		  margin-left:0px;
		  margin-top: 50px;
	      margin-bottom: 50px;
	      margin-left:auto; 
	      margin-right:auto;
	      cursor: pointer;
		}
		li{list-style:none;}
		
		  .ll{
		  font-size: 18px;
		  font-weight: 600;
		  width:100%;
		  background: white;
		  color: #575757;
		  text-align: center;
		  height: 60px;
		  float:left;
		  vertical-align: middle;
		  line-height: 3em;
		  border-bottom: 1px solid skyblue;
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
	</style>
	
</head>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
		<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item active" data-bs-interval="10000">
		      <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=c7497830-2689-4247-aa32-23861352d422" class="d-block w-100" alt="...">
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
			<ul id="category" class="ur" >
				<div style="display:flex;" lass="ur1">
					<li class="ll">서울</li>
					<li class="ll">인천</li>
					<li class="ll">대전</li>
					<li class="ll">대구</li>
					<li class="ll">광주</li>
					<li class="ll">부산</li>
					<li class="ll">울산</li>
					<li class="ll">세종</li>
					<li class="ll">경기</li>
				</div>
				<div style="display:flex;">
					<li class="ll">강원</li>
					<li class="ll">충북</li>
					<li class="ll">충남</li>
					<li class="ll">경북</li>
					<li class="ll">경남</li>
					<li class="ll">전북</li>
					<li class="ll">전남</li>
					<li class="ll">제주</li>
					<li class="ll">전체</li>
				</div>
			</ul>
		
			<div class="input-group" id="input">
				<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
				<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
			
			<hr id="hr1">
			
			<div id="num">
				<span>총 <span id="number">${ pi.listCount }</span>건</span>
			</div>
			<div id="btn">
				<button>최신순</button>
				<button>인기순</button>
			</div>
			
			<hr id="hr2" >
			<br>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start">
				<c:forEach items="${ list }" var="t">
					 <div class="allCard col">
			            <div class="card card-cover h-100 overflow-hidden\">
			               <c:if test="${ t.firstImage == '' }">
			               	  <img class="card-img-top"  style="height:300px;"  src="${ contextPath }/resources/img/basicImage.png">
			               </c:if>
			               <c:if test="${ t.firstImage != '' }">
			               <img class="card-img-top"  style="height:300px;"  src="${ t.firstImage }">
			               </c:if>
			               <div class="card-body p-4 mb-auto">
			                  <h5 class="card-title lh-1 fw-bold">${ t.title }</h5>
			                  <div class="card-text text-muted">${ t.addr }</div>
			               </div>
			            </div>
			            <input class="contentId" type="hidden" name="contentId" value="${ t.contentId }">
			            <input class="mapx" type="hidden" name="mapx" value="${ t.mapx }">
			            <input class="mapy" type="hidden" name="mapy" value="${ t.mapy }">
			         </div>
		         </c:forEach>
		      </div>
		         
			
			<br>
			
			<nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			    	<c:url var="goBack" value="${ loc }">
		            	<c:param name="page" value="${ pi.currentPage-1 }"/>
		        	</c:url>
		        	<a class="page-link" href="${ goBack }" aria-label="Previous">
		        		<span aria-hidden="true">&laquo;</span>
		        	</a>
			    </li>
			    
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    	</c:url>
			    	 <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
				    	<c:param name="page" value="${ pi.currentPage+1 }"/>
			    	</c:url>
				    <a class="page-link" href="${ goNext }" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				    </a>
			    </li>
			  </ul>
			</nav>
		
		</div>
		
		<script>
			const allCards = document.getElementsByClassName('allCard');
			for(const allCard of allCards){
				allCard.addEventListener('click', function(){
					const contentId = this.querySelector('.contentId').value;
					const mapx = this.querySelector('.mapx').value;
					const mapy = this.querySelector('.mapy').value;
					
					location.href='${contextPath}/travelDetail.tr?contentId=' + contentId + '&mapx=' + mapx + '&mapy=' + mapy + '&page=' + ${pi.currentPage};
				});
			}
			
// 			const categorys = document.getElementsByClassName('ll');
// 			for(const category of categorys){
// 				category.addEventListener('click', function(){
// 					if()
// 					category.innerText
// 				});
// 			}
		</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
