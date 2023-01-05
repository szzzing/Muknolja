<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
	<title>Home</title>
	
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
	<style>
		#carouselExampleInterval{height: 350px; margin-top: 80px;}
		#carouselExampleInterval img{height:350px;}
		
		.ur{
		 box-shadow: 0px 15px 30px 0px rgba(0,0,0,0.3);
		 padding-left:0px;
		 padding-bottom:0px;
		 margin-left:0px;
		 border-radius:10px;
		 border: 2px solid  RGB(107, 182, 236, 0.3);
		  
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
		    
		    #39{background: #6BB6EC; color:white;}  
    
		ol.numbered {
	padding-left:10px;
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
	
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
	 <div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style=" min-height:100vh; border-radius:30px;   ">
            <div class="col-9 " style=" min-height:100vh;">
		 <br><br>
            <div class="row justify-content-center " style="  ">
            <div class="col" style="padding-left:0px; padding-right:0px;"  >
            			<ul class="ur" >
					    	<div style="display:flex;" lass="ur1">
					    		<c:url var="all" value="${ loc }">
	            				<c:param name="area" value="1"/>
	        					</c:url>
					    		<li class="ll" id="0" onclick="location.href='${ all }'">전체</li>
					    		
					    		<c:url var="se" value="${ loc }">
	            				<c:param name="area" value="2"/>
	        					</c:url>
						    	<li class="ll" id="1" onclick="location.href='${ se }'">서울</li>
						    	
	        	
	        	
		  						<c:url var="in3" value="${ loc }">
	            				<c:param name="area" value="3"/>
	        					</c:url>
	        					<c:url var="in4" value="${ loc }">
	            				<c:param name="area" value="4"/>
	        					</c:url>
	        					<c:url var="in5" value="${ loc }">
	            				<c:param name="area" value="5"/>
	        					</c:url>
	        					<c:url var="in6" value="${ loc }">
	            				<c:param name="area" value="6"/>
	        					</c:url>
	        					<c:url var="in7" value="${ loc }">
	            				<c:param name="area" value="7"/>
	        					</c:url>
	        					<c:url var="in8" value="${ loc }">
	            				<c:param name="area" value="8"/>
	        					</c:url>
	        					<c:url var="in9" value="${ loc }">
	            				<c:param name="area" value="9"/>
	        					</c:url>
	        					<c:url var="in10" value="${ loc }">
	            				<c:param name="area" value="10"/>
	        					</c:url>
	        					<c:url var="in11" value="${ loc }">
	            				<c:param name="area" value="11"/>
	        					</c:url>
	        					<c:url var="in12" value="${ loc }">
	            				<c:param name="area" value="12"/>
	        					</c:url>
	        					<c:url var="in13" value="${ loc }">
	            				<c:param name="area" value="13"/>
	        					</c:url>
	        					<c:url var="in14" value="${ loc }">
	            				<c:param name="area" value="14"/>
	        					</c:url>
	        					<c:url var="in15" value="${ loc }">
	            				<c:param name="area" value="15"/>
	        					</c:url>
	        					<c:url var="in16" value="${ loc }">
	            				<c:param name="area" value="16"/>
	        					</c:url>
	        					<c:url var="in17" value="${ loc }">
	            				<c:param name="area" value="17"/>
	        					</c:url>
	        					
	        					
	        			
						    	<li class="ll" id="2" onclick="location.href='${ in3 }'">인천</li>
						    	<li class="ll" id="3" onclick="location.href='${ in4 }'">대전</li>
						    	<li class="ll" id="4" onclick="location.href='${ in5 }'">대구</li>
						    	<li class="ll" id="5" onclick="location.href='${ in6 }'">광주</li>
						    	<li class="ll" id="6" onclick="location.href='${ in7 }'">부산</li>
						    	<li class="ll" id="7" onclick="location.href='${ in8 }'">울산</li>
						    	<li class="ll" id="8" onclick="location.href='${ in9 }'">세종</li>
						    
						    	</div>
						    	<div style="display:flex;">
						    	<li class="ll" id="31" onclick="location.href='${ in10 }'">경기</li>
						    	<li class="ll" id="32" onclick="location.href='${ in11 }'">강원</li>
						    	<li class="ll" id="33" onclick="location.href='${ in12 }'">충북</li>
						    	<li class="ll" id="34" onclick="location.href='${ in13 }'">충남</li>
						    	<li class="ll" id="35" onclick="location.href='${ in14 }'">경북</li>
						    	<li class="ll" id="36" onclick="location.href='${ in15 }'">경남</li>
						    	<li class="ll" id="37" onclick="location.href='${ in16 }'">전북</li>
						    	<li class="ll" id="38" onclick="location.href='${ in17 }'">전남</li>
						    	<li class="ll" id="39" onclick="location.href='${ in18 }'">제주</li>
						    	
						    </div>
					    </ul>
					   <br>
					   </div>
					   </div>
		 <div class="row justify-content-center " style="  ">
            <div class="col" style="padding-left:0px; padding-right:0px; display:inLine-block"  >
	
		
		
		<div class="input-group" id="input" style="">
			<input type="text" style="" class="form-control" placeholder="검색하기" aria-label="Recipient's username" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="fa-solid fa-magnifying-glass"></i></button>
			<c:if test="${ loginUser != null }">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2" style="width:200px; font-weight:600" onclick="location.href='${contextPath}/reviewWrite.re'">글쓰기</button>
			</c:if>
			<c:if test="${ loginUser == null }">
			<button class="btn btn-outline-secondary" type="button" id="button-addon2" style="width:200px; font-weight:600" onclick="location.href='${contextPath}/loginView.me'">글쓰기</button>
			</c:if>
		</div>
	
		<hr id="hr1">
		
		
		
		
		
		<br>
		<div class="row row-cols-1 row-cols-lg-2 row-cols-xl-4 justify-content-start">
			<c:forEach items="${ board }" var="b">
				<div  style="box-shadow:0px -30px 0px 0px #90C8F1 inset; margin-bottom:20px; height:315px;">
				<div  class="detail" style="box-shadow: 5px 0px 5px 5px rgba(0,0,0,0.2);background: white;  width:90%; margin-bottom:10px">
		            <img src="${ contextPath }/resources/uploadFiles/${b.fileModifyName}" width=100%; height=300px; >
		            <br>
		              
		            	<c:set var="courseList" value="${fn:split(b.boardCourse,'/')}" />
		                <div class="corseall" style="padding-left:10px; padding-top:20px; height: 270px;">
							  <ol class="numbered">
								  <c:forEach items="${ courseList }" var="course" end="4">
								  	<li style="white-space:no-wrap;height:1.2em;overflow:hidden;">${ course }</li>
								  </c:forEach>
		              			</ol>
		              		</div>
		              		<div class="id" style="display:none;">${ b.boardId }</div>
						</div>
					</div>
	         </c:forEach>
	         
	         		
	         
			
			<div>
	      
	         </div>
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
		</div>
		</div>
		</div>
		</div>
		<script>
		window.onload = () => {
			$.ajax({
	    		url: 'selectAd.me',
	    		data: {type:'R'},
	    		success: (data) => {
	    			const adimgs = document.getElementsByClassName('adimg');

	    			for(const i in data){
	    				adimgs[i].src = 'resources/uploadFiles/' + data[i];
	    			}
	    		}
	    	});
			
		}
		
		
		$('.corseall').hide();
			$('.detail').hover(function(){
				$(this).find('img').hide();
				$(this).find('.corseall').show();
			},function(){
				$(this).find('img').show();
				$(this).find('.corseall').hide();
			});
			
		$('.detail').click(function(){
			
			var boardId = $(this).find('.id').text();
			 location.href="${ contextPath }/reviewDetail.re?boardId="+boardId;
		})
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
	
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>
