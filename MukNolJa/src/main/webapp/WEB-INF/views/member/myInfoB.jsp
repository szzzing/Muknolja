<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
    		.my{
    		position: 'fixed';
                    display: block;
                    boxShadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);

                   
                    zIndex: 1;

                    
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    msTransform: translate(-50%, -50%);
                    webkitTransform: translate(-50%, -50%);
                   }
   			 .my_modal{
                display: none;
                width: 300px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            .my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
            }
            
    .inbu{height:70px;
          width:25%; 
          background:none;
          border:none;
          border-right: 1px solid RGB(107, 182, 236, 0.3);
          font-weight:600;
          padding-left:0px;
           }
         #bu3{
         border-bottom: 10px solid RGB(107, 182, 236);}
         
         
         #bu1:hover, #bu2:hover, #bu3:hover, #bu4:hover, #bu5:hover{
         border-bottom: 10px solid RGB(107, 182, 236);
         
         }
         
         
		.container.CloseModal{
         display:none;
      }

    </style>
  </head>
  <body style="">
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    
    <jsp:include page="../member/menubar.jsp"/>
   	
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center " style="  ">
            <div class="col-9 " style="">
		<br><br><br>
	  	
	  		
            <br><br>
	            <div class="row justify-content-center " style="  ">
	            	<div class="col" style="padding-left:0px; padding-right:0px; height:100%"  >
	    				<div style="display:flex;float:left; font-size:40px; font-weight:300;">
	    					마이페이지
	    					<div style="font-size:30px; margin-top:15px; margin-left:25px;">${ loginUser.name}님 
	    					<button onclick="location.href='${contextPath}/myInfo1.me'"style="border: 1px solid RGB(107, 182, 236); font-size:20px; margin-top:-10px; border-radius:10px; background:none ">내정보</button></a></div>
	    				</div>
					</div>
				</div>
			</div>
		</div>
			<br>
				<div class="row justify-content-center " style="  ">
	            	<div class="col " style="padding-left:0px; padding-right:0px; height:70px; border:1px solid lightgrey"  >
	            		<div class="row justify-content-center " style="padding-left:0px; padding-right:0px; height:70px; ">
	            			<div class="col-xs-12; col-sm-9" style="padding-left:0px; padding-right:0px; ">
	            				<div style="display:flex; padding-left:0px; padding-right:0px; ">
			            		<button class="inbu" type="button" id="bu1" onclick= "location.href='${contextPath }/myInfo.me'"style="padding-left:0px;border-left: 1px solid RGB(107, 182, 236, 0.3);">내가 쓴글</button>
			            		<button class="inbu" type="button" id="bu2" onclick= "location.href='${contextPath }/myInfoA.me'">찜목록</button>
			            		<button class="inbu" type="button" id="bu3" onclick= "location.href='${contextPath }/myInfoB.me'">문의 내역</button>
			            		<button class="inbu" type="button" id="bu4" onclick= "location.href='${contextPath }/myInfoC.me'">동행 확인</button>
			            		<button class="inbu" type="button" id="bu5" onclick= "location.href='${contextPath }/myInfoD.me'">예약 확인</button>
			            		</div>
			            	</div>
			      </div>
			      <div class="row justify-content-center " style="padding-left:0px; padding-right:0px; height:70px; margin-top:30px; ">
	            		<div class="col-9" style="box-shadow: 0px 30px 60px 0px rgba(0,0,0,0.1); height:500px;">
	            				
	            				<table class="table">
								  <thead>
								    <tr data-bs-toggle="modal" data-bs-target="#exampleModal">
								      <th scope="col">번호</th>
								      <th scope="col">상대방</th>
								      <th scope="col">제목</th>
								      <th scope="col">날짜</th>
								      <th scope="col">읽음</th>
								    </tr>
								  </thead>
								  
								  
								  <tbody id="QAboard">
								  
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5 title" id="exampleModalLabel" >Modal title</h1>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      <div class="modal-body body" style="border-bottom:1px solid #DEE2E6">
								        ...
								      </div>
								       <div class="modal-body body2">
								        ...
								      </div>
								      <div class="modal-footer foot">
								        <button type="button" class="btn btn-secondary" id="de">삭제</button>
								        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
								      </div>
								    </div>
								  </div>
								</div>




	            					
	            						
	            					
								      </tbody>
								      
								     
	            				</table>
	           						
							
	            		</div>
	           <nav aria-label="Page navigation example" style="background: white" class="col-9">
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
	<script>
		$(document).ready(function(){
			var page = ${ pi.currentPage };
			$.ajax({
				url: "${contextPath}/myInfoBB.me",
				traditional : true,
				data: {
					page: page
				},
				success: (data)=>{
					const qa = data.qa;
					
					
					for(var i=0;i<qa.length;i++) {
						var id = qa[i].qaId;
						var title = qa[i].qaTitle;
						var re = qa[i].qaReceever;
						var date = qa[i].qaCreateDate;
						var content = qa[i].qaContent;
						var Yn = qa[i].qaYn;
						var reContent = qa[i].qaReplyContent;
						
						var qaHtml = '<tr id='+i+' data-bs-toggle="modal" data-bs-target="#exampleModal" class="qaTr">'+
    						'<th scope="row" class="id">'+id+'</th>'+
    						'<td class="re">'+re+'</td>'+
    						'<td class="">'+title+'</td>'+
    						'<td class="date">'+date+'</td>'+
    						'<td class="yn">'+Yn+'</td></tr>';
    						
    														    
						$("#QAboard").append(qaHtml);
// 						
					}
					
					$('.qaTr').click(function(){
						$(".title").empty();
						$(".body").empty();
						$(".body2").empty();
						var idNum = $(this).attr('id');
						
						$(".title").append(qa[idNum].qaTitle);
						$(".body").append(qa[idNum].qaContent);
						$(".body2").append(qa[idNum].qaReplyContent);
						console.log(qa[idNum].qaReplyContent);
						if(qa[idNum].qaReplyContent == null){
							$(".body2").append('좀 더 기다려주시면 감사하겠습니다.');
						}
						var id = qa[idNum].qaId;
						$('#de').click(function(){
							console.log(id);
							$.ajax({
								url: "${contextPath}/deleteBB.me",
								traditional : true,
								data: {
									id : id
								},
								success: (data)=>{
									location.href = "${ contextPath }/myInfoB.me"
								},
								error: (data)=>{
									console.log(data);
								}
							});
						});
					});
					
				},
				error: (data)=>{
					console.log(data);
				}
			});
		});
	</script>
  </body>
</html>

    
