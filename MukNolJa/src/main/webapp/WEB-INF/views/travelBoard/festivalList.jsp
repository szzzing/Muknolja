<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<style>
		#carouselExampleInterval{height: 350px; margin-top: 80px;}
		#carouselExampleInterval img{height:350px;}
		.travelInfo a{color: black; font-size: 25px; text-decoration: none;}
		.travelInfo p{color: gray; font-size: 15px; margin-top: 20px;}
		.pagination a{color: #6BB6EC;}
		.pagination a:hover{background: #6BB6EC; color: white;}
		hr{margin: auto;}
		#hr1, #hr2{height: 1px; color: lightgray;}
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
			 box-shadow: 0px 8px 8px 0px rgba(0,0,0,0.3);
			 padding-left:0px;
			 padding-bottom:0px;
			 margin-left:0px;
			 border-radius:10px;
			 border: 2px solid  RGB(107, 182, 236, 0.3);
			 margin-top: 30px;
			 margin-bottom: 30px;
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
		  
	</style>
	
</head>
<body>
	<jsp:include page="../member/menubar.jsp"/>
	
	<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active" data-bs-interval="10000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item" data-bs-interval="2000">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/img/adadad.png" class="d-block w-100 adimg" alt="...">
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
					<li class="ll">전체</li>
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
					<li class="ll 39">제주</li>
				</div>
			</ul>
		
			<div class="input-group" id="input" style="margin-bottom: 30px;">
				<input type="text" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2" id="searchValue" name="searchValue">
				<button class="searchButton btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
			
			<hr id="hr1">
			
			<div id="num" style="display: inline-block">
				<span>총 <span id="number">${ pi.listCount }</span>건</span>
			</div>
<!-- 			<div id="btn" style="float: right;"> -->
<!-- 				<button>최신순</button> -->
<!-- 				<button>인기순</button> -->
<!-- 			</div> -->
			
			<hr id="hr2" >
			<br>
			<div class="row row-cols-1 row-cols-sm-2 row-cols-lg-4 justify-content-start" id="travelCard">
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
		            	<c:if test="${ areaCode != null }">
		            		<c:param name="areaCode" value="${ areaCode }"/>
		            	</c:if>
		            	<c:if test="${ searchValue != null }">
		            		<c:param name="searchValue" value="${ searchValue }"/>
		            	</c:if>
		            	<c:param name="page" value="${ pi.currentPage-1 }"/>
		        	</c:url>
		        	<a class="page-link" href="${ goBack }" aria-label="Previous" style="height: 100%; padding-top: 10px;">
		        		<span aria-hidden="true"><i class="fa-solid fa-angle-left"></i></span>
		        	</a>
			    </li>
			    
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:if test="${ areaCode != null }">
		            		<c:param name="areaCode" value="${ areaCode }"/>
		            	</c:if>
		            	<c:if test="${ searchValue != null }">
		            		<c:param name="searchValue" value="${ searchValue }"/>
		            	</c:if>
			    		<c:param name="page" value="${ p }"/>
			    	</c:url>
			    	 <li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
			    		<c:if test="${ areaCode != null }">
		            		<c:param name="areaCode" value="${ areaCode }"/>
		            	</c:if>
		            	<c:if test="${ searchValue != null }">
		            		<c:param name="searchValue" value="${ searchValue }"/>
		            	</c:if>
				    	<c:param name="page" value="${ pi.currentPage+1 }"/>
			    	</c:url>
				    <a class="page-link" href="${ goNext }" aria-label="Next" style="height: 100%; padding-top: 10px;">
				        <span aria-hidden="true"><i class="fa-solid fa-angle-right"></i></span>
				    </a>
			    </li>
			  </ul>
			</nav>
		
		</div>
		<jsp:include page="../common/footer.jsp"/>
		<script>
			<!-- 상세보기 -->
			const allCards = document.getElementsByClassName('allCard');
			for(const allCard of allCards){
				allCard.addEventListener('click', function(){
					const contentId = this.querySelector('.contentId').value;
					location.href='${contextPath}/festivalDetail.tr?contentId=' + contentId + '&page=' + ${pi.currentPage};
				});
			}
			
			<!-- 카테고리선택 -->
			const categorys = document.getElementsByClassName('ll');
			for(const category of categorys){
				category.addEventListener('click', function(){
					const areaCode = category.className.substr(2);
					location.href='${contextPath}/festivalList.tr?areaCode=' + areaCode;
				});
			}
			
			<!-- 검색하기 -->
			const searchButton = document.getElementsByClassName('searchButton')[0]; 
		   	const searchValue = document.getElementById('searchValue');
		   	
		   	searchButton.addEventListener('click', function(){
		   		location.href='${contextPath}/searchFestival.tr?searchValue=' + searchValue.value;
		   	});
		   	
		   	searchValue.addEventListener('keypress', function(e){
		   		if (e.keyCode === 13) {
		   			location.href='${contextPath}/searchFestival.tr?searchValue=' + searchValue.value;
		   	    }
		   	});
		   	
		   	window.onload = () => {
				$.ajax({
		    		url: 'selectAd.me',
		    		data: {type:'V'},
		    		success: (data) => {
		    			const adimgs = document.getElementsByClassName('adimg');

		    			for(const i in data){
		    				adimgs[i].src = 'resources/uploadFiles/' + data[i];
		    			}
		    		}
		    	});
				
			}
		</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
