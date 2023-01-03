<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    	#album{
    		margin: 5% auto;
    		
    		height:750px;
    		}
    		.d1{
    		background-size:100% 100%;}
    		
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
	.tx{
	background: linear-gradient(#89C4E1 0% 0%, #0096FF 100% 100%);
	background-clip: text;
	-webkit-background-clip: text;
	color: transparent;
	
	}
	
	
	
	
    </style>
  </head>
  <body style="background:RGB(242, 242, 242, 0.5)">
  	<jsp:include page="../member/menubar.jsp"/>
   
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   	
     
		<br><br><br>
		<div class="container-fluid text-center " style="">
	  		<div class="row justify-content-center" style="  border-radius:30px;  ">
	            <div class="col-12 col-lg-9" style="" >
	            <div class="tx" style="font-size:70px; position:absolute; font-weight:900; margin-top:18%; margin-left: 8%;">MUKNOLJA<br>
	            	</div>
	     			
	     			<div id ="album">
     				<div style="width: 100%; height:100%;   float:left;  font-size: 40px; font-weight:1000; background: white; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); "><div  style="color: white; margin:15px; background: radial-gradient(ellipse at bottom, #C0DEFF 0%, #89C4E1 100%);  ">${board.boardTitle }</div><br>
     				<div style="text-align:right;font-size: 20px; margin-right:7%">닉네임: ${ board.boardWriter }</div>
     					<div style="padding-left: 10%; align-items:center; text-align: left; float:left; margin-top: 50px;">
     						
     						<div style="margin-left:3% ;text-align:left">순서</div>
     						<c:set var="courseList" value="${fn:split(board.boardCourse,'/')}" />
     						<c:set var="contentcourse" value="${fn:split(board.contentCourse,'/')}" />
				                <div class="corseall" style="padding-left:10px; margin-top: 10px;padding-top:20px;">
									  <ol class="numbered" style="float:left; height:235px;">
										  <c:forEach items="${ courseList }" var="course" end="4" varStatus="status">
										  	<li class="firstE"style="float:left; white-space:no-wrap;height:1.2em;overflow:hidden;" >${ course }	<div class="firstC" style="display:none">${ contentcourse[status.index] }</div></li><br>
										  
										  </c:forEach>
				              		  </ol>
				              		  
				              	</div>
		     					<div style="font-size:10px; margin-top:280px; margin-left:10px;">클릭시 상세보기로 이동합니다</div>
		     				</div>
		     				<h6 style="margin-top: 530px;"> 모서리 부분을 클릭해주세요</h5>
		     			</div>
					<c:set var="contents" value="${fn:split(board.boardContent,'!@#$')}" />
					<c:forEach items="${ contents }" var="content" varStatus="status" >
					 
					
					<div class="d1" style="background-image: url('${contextPath}/resources/uploadFiles/${ img[status.index].fileModifyName }');"><div style="font-size:30px; text-shadow: 1px 5px 5px rgba(0,0,0,0.3); color:none; padding-top:20px; font-weight:700">${ courseList[status.index] }</div></div>
		 			<div style="background: white;"><div style="width: 100%; height:100%;   float:left;  font-size: 40px; font-weight:1000; background: white; box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); "><div  style="color: white; margin:15px; background: radial-gradient(ellipse at bottom, #C0DEFF 0%, #89C4E1 100%); ">${board.boardTitle }</div>
		 			
		 			<div style="padding:15px; ">
		 			<div style="text-align: left; padding: 10px; font-size: 20px; border: 1px solid #9CCDEB; width:100%; height: 590px;">${content}</div></div></div></div>
					 </c:forEach>
				
	  			</div>
	  	</div>	
        </div>
		</div>
		
		<div class="container-fluid" style="">
	  		<div class="row justify-content-center" style="   border-radius:30px;  ">
	            <div class="col-12 col-lg-9" style="" >
	            	<div id="partyReply" style="margin-top:40px">
				<h5 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>${ replyCount }개</span></h5>
				<div class="input-group mb-3">
					<c:if test="${ loginUser == null }">
						<input type="text" class="form-control" placeholder="로그인 후 이용해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
						<button class="btn btn-outline-secondary" type="button" disabled><i class="bi bi-send"></i></button>
					</c:if>
					<c:if test="${ loginUser != null }">
						<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="replyContent">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
					</c:if>
				</div>
			</div>
		</div>
			<div class="row justify-content-center">
			<div class="col-9"  style=" box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.3); ">
			<div id="rep" style="disply:flex; ">
			
			<div class="row">
			<c:forEach items="${ reply }" var="r">
			<div class="selectRe">
			<div style="margin-top:10px; display:flex;  border-bottom: 1px solid #F2F2F2" >
				<div class="col-2 col-lg-1 sele" style="background:black; height:60px;" >11</div>
					
				 	<div class="replyId" style="display:none">${r.replyId}</div>
				 	<div class="replyContent col-8 col-lg-7" style="height:90px; padding-left:10px;"><div class="sele">
				 	<div style="width:100%; height:60px;display:flex;">${ r.replyWriter }님<div style="margin-left:2%">${r.replyContent}</div></div></div>
				 	<div>${r.replyModifyDate }<Button type="button" class="refReply" style="background:none; border:none">댓글달기</Button>
				 	</div>
				 	</div>
				 	<div class="col-2 col-lg-4" style="float:right"><button type="button" class="sin" style="border:none; float:right;background:none"  data-bs-toggle="modal" data-bs-target="#exampleModal">신고</button></div>
				 	
				 	</div>
				 	<div class= "ref"></div>
				 </div>
				 </c:forEach>
				 	  
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5 title" id="exampleModalLabel" >신고하기</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <textarea class="modal-body mbody" style="text-align:left; float:left; border:none;height:200px;border-bottom:1px solid #DEE2E6">
								       
								      </textarea>
								       
								      <div class="modal-footer foot">
								        <button type="button" class="btn btn-secondary" id="see">신고</button>
								        <button type="button" class="btn btn-primary" id="dro" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>
				 	
				 </div>
				 </div>
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
		</nav>		</div>
	            </div>
	        </div>
	    </div>
		<div id="id" style="display: none">${ loginUser.id }</div>

	<br><br><br><br><br><br><br>
	
	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
	<script src="${contextPath }/resources/turn.js"></script>
	
	<script>
	$('#album').turn({gradients: true, acceleration: true});
	
	
	$('.refReply').click(function(){
		
	})
	
	//신고
	$('.sin').click(function(){
		
		console.log("지금");
		
	});
	$('#see').click(function(){
		var tet = $('.mbody').val();
		var id = $(this).parent().parent().parent().find(".replyId").text();
		console.log(id);
		
	});
	//대댓글
	
	$('.sele').click(function(){
		var replyId = $(this).parent().parent().find('.replyId').text();
		var ref = $(this).parent().parent().parent().find('.ref');
		console.log(ref);
		console.log(ref.text());
		console.log(replyId);
		if( ref.text() == ""){
			console.log(ref.text());
		$.ajax({
		 url: "${ contextPath}/selectRe.re",
		 data: { replyId : replyId },
			success: (data)=>{
				console.log(data);
				var list = data;
					for(var i =0; i<list.length; i++){
						 var Html = '<div style="display:flex"><div class="col-2 col-lg-1" style=" height:60px; padding-left:30px;" ><i style=" font-size: 40px;"class="bi bi-arrow-return-right"></i></div>'+
								    '<div class="col-2 col-lg-1" style=" height:60px; background:black;" >11</div>'+
								   '<div class=" col-6 col-lg-6" style="height:90px; padding-left:10px;">'+
								   '<div style="width:100%; height:60px;display:flex;">'+list[i].replyWriter+'님<div style="margin-left:2%">'+list[i].replyContent+'</div></div>'+
								   '<div>'+list[i].replyModifyDate+'</div></div>'+
								 	'<div class="col-2 col-lg-4" style="float:right"><button type="button" class="sin" style="border:none; float:right;background:none">신고</button></div>'+
								 	'</div></div>';
								$(ref).empty();
						 		$(ref).append(Html);
						 	}
						 	
							
			},
			error: (data)=>{
				
			}
		});
		}else{
			console.log("안돼");
			$(ref).empty();
		}
	});
	

	//관광지 이동
	$(".firstE").click(function(){
		var contentId = $(this).find('.firstC').text();
		
		console.log(contentId);
		location.href="${contextPath}/travelDetail.tr?contentId=" +contentId
	});
	const searchButton = document.getElementById('button-addon2');  
	const replyEnter = document.getElementById('replyContent');
	
	//댓글
	replyEnter.addEventListener('keypress', function(e){
		if(e.keyCode == 13){
	 	replyContent = $(this).val();
	 	console.log(replyContent);
	 	var nickName = "${ loginUser.id }";
	 $.ajax({
		 
		 url: "${ contextPath}/insertReply.re",
		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			data: { replyContent: replyContent,
					writer : nickName,
					boardId: ${ board.boardId},
					
					},
			success: (data)=>{
				$(replyContent).empty();
				
			},
			error: (data)=>{
				
			}
		});
		}
	 
	});
	</script>
  </body>
</html>

    