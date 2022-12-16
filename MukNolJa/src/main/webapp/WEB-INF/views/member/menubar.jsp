<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	
   <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
     <script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <style>
    	 @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    	 .menul{
    	 font-size: 10px;}
    	 .menud{
    	 font-size: 15px;
    	 margin-left:50px;
    	 color:#65647C;}
    	 #my_modal {
                display: none;
                width: 300px;
                height: 400px;
                padding: 20px 60px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            #my_modal .modal_close_btn {
                position: absolute;
                top: 10px;
                right: 10px;
                text-decoration: none;
                color: black;
            }
            #chatList{
            	width: 170px;
            	max-height: 300px;
            	overflow: auto;
            }
            #chatList::-webkit-scrollbar{
            	width: 8px;
            }
    </style>
  </head>
  <body>
	
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
   	 <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  	 <header id="header"  style="top:0; left:0; position:fixed; ">
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center" style="width: 100vw; height:80px; background: white; box-shadow: 0px 10px 20px 0px rgba(0,0,0,0.3);">
            <div class="col" style="width:1200px; height:80px; ">
            	<div style=" width:1200px; height:80px; display:inLine-block; " >
            		<div style="display:flex; float:left; width:1200px;">
            		<div style="font-size:30px; margin-top:15px; color:#6BB6EC; font-weight: 900; ">MUKNOLJA</div>
            			<div class="menum" style="margin-top: 35px; display:flex">
	            		 <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:#65647C; margin-left:30px;font-size: 15px;  font-family: 'HSYuji-Regular'; ">
			           	 여행
			          	</a>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item menul" href="#">관광지</a></li>
				            <li><a class="dropdown-item menul" href="#">맛집</a></li>
				            <li><a class="dropdown-item menul" href="#">축제</a></li>
				          </ul>
		            		<div class="menud" style="margin-left:40px;">호텔</div>
		            		<div class="menud">후기</div>
		            		<div class="menud">동행</div>sdfjgkldfsjgklsjgjs
	            			<div style="float:right; margin-left:650px; margin-top:-8px; display:flex">
	            				<h3 id="popup_open_btn" style="color:#6BB6EC; margin-left:-40px;"><i class="fa-solid fa-comments"></i></h3>
	            			<c:if test="${ empty loginUser }">
		         <li class="nav-item" style="margin-right:3%; width:40%" > -->
		         </li> 
					           <a class="nav-link " style="color:#6BB6EC; margin-left:40px;" href="${contextPath }/loginView.me" style="font-size: 1.4vw; "><h3><i class="fa-solid fa-circle-user"></i></h3></a>
					        </c:if>	
	            			<c:if test="${ !empty loginUser }">	
	            				<a href="${ contextPath  }/myInfo.me"><h3><i class="bi bi-person-lines-fill" style="color:#6BB6EC;"></i></h3></a>
	            				<a href="${ contextPath  }/logout.me"><h3><i class="bi bi-box-arrow-right" style="color:#6BB6EC;"></i></h3></a>
	            			</c:if>
		     				    
	            			</div>
	            		</div>
            		</div>
            	</div>
    		</div>
    	</div>
    </div>
    </header>
	 <div id="my_modal">
		<div class="container" id="chatList" style="width: 170px;">
			<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
			<div class="row text-center" style="border-bottom: 1px solid black;">
				<div class="col" id="roomBtn"><h4><i class="bi bi-chat-dots"></i></h4></div>
				<div class="col" id="frndBtn"><h4><i class="bi bi-person-plus"></i></h4></div>
			</div>
			<c:forEach begin="0" end="10">
				<div class="row chatRoom" style="border-bottom: 1px solid black;">
					<div class="col">
						<b>채팅방 이름</b><br>
						<small>3분전</small>
					</div>
				</div>
			</c:forEach>
		</div>
     </div>

         <script>
            function chatModal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 모달 div 뒤에 희끄무레한 레이어
                var bg = document.createElement('div');
                bg.setStyle({
                    position: 'fixed',
                    zIndex: zIndex,
                    left: '0px',
                    top: '0px',
                    width: '100%',
                    height: '100%',
                    overflow: 'auto',
                    // 레이어 색갈은 여기서 바꾸면 됨
                    backgroundColor: 'rgba(0,0,0,0.4)'
                });
                document.body.append(bg);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    bg.remove();
                    modal.style.display = 'none';
                });

                modal.setStyle({
                    position: 'fixed',
                    display: 'block',
                    boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

                    // 시꺼먼 레이어 보다 한칸 위에 보이기
                    zIndex: zIndex + 1,

                    // div center 정렬
                    top: '50%',
                    left: '50%',
                    transform: 'translate(-50%, -50%)',
                    msTransform: 'translate(-50%, -50%)',
                    webkitTransform: 'translate(-50%, -50%)'
                });
            }

            // Element 에 style 한번에 오브젝트로 설정하는 함수 추가
            Element.prototype.setStyle = function(styles) {
                for (var k in styles) this.style[k] = styles[k];
                return this;
            };

            document.getElementById('popup_open_btn').addEventListener('click', function() {
                // 모달창 띄우기
                chatModal('my_modal');
            });
        </script>
  </body>
</html>