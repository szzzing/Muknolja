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
    	 #room_modal, #createroom_modal, #invite_modal{
                display: none;
                width: 300px;
                height: 400px;
                padding: 20px 20px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }
            
            #success_modal,#loginCheck_modal{
            	display: none;
                width: 300px;
                height: 200px;
                padding: 20px 20px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }
            
            #chat_modal{
            	display: none;
                width: 300px;
                height: 400px;
                background-color: #fefefe;
                border: 1px solid #888;
                border-radius: 3px;
            }

            .modal_close_btn{
                position: absolute;
                top: 10px;
                right: 10px;
                text-decoration: none;
                color: black;
            }
            #chatList{
            	max-height: 300px;
            	overflow: auto;
            }
            #chatList::-webkit-scrollbar{
            	width: 8px;
            }
            .friends{
            	display: none;
            }
            .chatRoom:hover{
            	cursor: pointer;
            	background: lightgray;
            }
            #chatBoxs{
            	max-height: 300px;
            	overflow: auto;
            }
            #chatBoxs::-webkit-scrollbar{
            	width: 8px;
            }
            .chatBox{
           		display: inline-block;
            	background: #6BB6EC;
            	border-radius: 6px;
            	width: auto;
            	height: auto;
            	padding: 8px;
            	margin: 10px;
            }
            .message{
            	display: inline-block;
            	margin: 0px;
            }
            .myChat{
            	background: lightgray;
            	float: right;
            	text-align: right;
            }
            #sendMessage{
            	position: fixed;
            	bottom: 0px;
            }
            .messageCheck{
            	display: inline-block;
  				float: right;
  				margin-top: 10px;
  				margin-right: 20px;
            }
            .createRoom{
            	margin-right: 20px;
            	float: right;
            }
            .nick{
            	margin-left: 10px;
            }
            .chatNcik{
            	font-size: 5px;
            }
            #invite:hover, #createRoom:hover{
            	text-decoration: underline;
            	cursor: pointer;
            }
            .ba{
            width:200px;font-size:30px; margin-top:15px; color:#6BB6EC; font-weight: 900;
            }
            @media (max-width: 840px) {
			  .ba{
			  	margin-top:30px;
			    width: 80px;
			    font-size:15px;
			    
			  }
}
			
		.ch{font-size:30px;}
		 @media (max-width: 840px) {
			  .ch{
			  	font-size:15px;
			  	margin-top:13px;
			  	
			  }
}
			.coco{width:70px; font-size:15px; margin-top:32px;}
			 @media (max-width: 840px) {
			  .coco{
			  width:45px;
			   font-size:9px;
			   margin-top:35px;
			  }
			  }
    </style>
  </head>
  <body>
	
    
   	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
   	 <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  	 <header id="header"  style="top:0; left:0; position:fixed; z-index:99999">
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style="min-width: 100vw; height:80px; background: white;">
            <div class="col-9 " style=" height:80px; font-family: 'HSYuji-Regular';  ">
            	<div  style=" height:80px; "> 
            		<div class="row row-cols-9" style=height:80px;>
            		<div onclick= "location.href='${contextPath }/home.do'" class="col-5 ba"style=" ">MUKNOLJA</div>
            		<div class="col-1 coco" style=" font-weight:600; "><div class="dropdown">
						  <button class="" style="background:none; margin-left:-15px;width:70px;padding-top:0px; padding-left:-10px;font-align:center;font-weight:600; border: none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						   여행
						  </button>
						  <ul class="dropdown-menu" >
						    <li><a class="dropdown-item iv" style="font-size:14px;font-weight:600;  href="#">관광지</a></li>
						    <li><a class="dropdown-item iv" style="font-size:14px;font-weight:600; href="#">맛집</a></li>
						    <li><a class="dropdown-item iv" style="font-size:14px;font-weight:600; href="#">축제</a></li>
						  </ul>
						</div>				
					</div>
            		<div class="col-1 coco" style="  font-weight:600;">호텔</div>
            		<div class="col-1 coco" style="  font-weight:600;">동행</div>
            		<a href="${ contextPath }/reviewList.re"class="col-1 coco" style="  font-weight:600;">후기</a>
            		<div class="col d-none d-sm-block"></div>
            		<div class="col-1 co" style="font-size:25px; margin-top:22px; ">
            			<h3 id="popup_open_btn" class="ch"style="color:#6BB6EC; "><i class="fa-solid fa-comments ic"></i></h3>
            		</div>
            		<div class="col-1 co" style=" font-size:15px; margin-top:22px; margin-right:20px;">
            		 <c:if test="${ empty loginUser }">
					     <a class="nav-link" style="color:#6BB6EC; font-size: 15px;" href="${contextPath }/loginView.me"><h3 class="ch"style=""><i class="fa-solid fa-circle-user ic"></i></h3></a>
					</c:if>		
					<c:if test="${ !empty loginUser }">
	            		<button class="buu" style="background:white;color:#6BB6EC; width:50px; font-size:15px;padding-top:0px;font-weight:600; border: none" type="button" data-bs-toggle="dropdown" aria-expanded="false">
							   <h3 class="ch"style=""><i class="bi bi-person-lines-fill ic" style="color:#6BB6EC;"></i></h3>
							  </button>
							  <ul class="dropdown-menu">
							    <li><a class="dropdown-item" style="font-size:15px;font-weight:600;"  href="${ contextPath  }/myInfo.me">마이페이지</a></li>
							    <li><a class="dropdown-item" style="font-size:15px;font-weight:600;" href="${ contextPath  }/logout.me">로그아웃</a></li>
							  </ul>
					</c:if>
							</div>	
							
            		</div>
            		</div>
            	</div>
    		</div>
    	</div>
   
    </header>
    
    
    
<!--     채팅 모달 -->
	 <div id="room_modal">
		<div id="chatList">
			<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
			<div class="row text-center" style="border-bottom: 1px solid black;">
				<div class="col" id="roomBtn"><h4><i class="bi bi-chat-dots"></i></h4></div>
				<div class="col" id="frndBtn"><h4><i class="bi bi-people"></i></h4></div>
			</div>
			<div id="rooms"></div>
			<div class="row friends" style="padding: 10px 0px;">
           		<div class="col text-center" id="createRoom">채팅방 만들기</div>
				<div class="col text-center" style="border-bottom: 1px solid black"><h4><i class="bi bi-envelope-plus"></i></h4></div>
				<div id="inviteList">
				</div>
			</div>
		</div>
     </div>
     
     <div id="chat_modal">
     	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
     	<div class="row">
     		<div class="col text-center" style="border-bottom: 1px solid black; padding: 10px;">
     			<b id="chatTitle">채팅방 이름</b>
     		</div>
     	</div>
     	<div id="chatBoxs">
     		<div id="chat">
     		</div>
     		<div class = "input-group input-group-sm" id="sendMessage">
            	<input type = "text" class = "form-control" id="message" placeholder = "message" onkeyup="onKeyUp()">
	            <div class = "input-group-btn">
	               	<button class="btn btn-outline-secondary" type="button" id="send"><i class="bi bi-chat-square-text"></i></button>
	               	<button class="btn btn-outline-secondary" type="button" id="inviteBtn"><i class="bi bi-person-plus"></i></button>
	           	</div>
            </div>
     	</div>
     </div>
     
     <div id="createroom_modal">
     	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
     	<div class="row">
     		<div class="col text-center">
     			<label for="chatRoomName">채팅방 이름</label><br>
     			<input type = "text" class = "form-control" id="chatRoomName" name="chatRoomName">
	            <div class = "input-group-btn">
	               	<button class="btn btn-outline-secondary" type="button" id="chatRoomBtn">채팅방 생성</button>
	           	</div>
     		</div>
     	</div>
     </div>
     
    <div id="loginCheck_modal">
    	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
    	<div class="row">
    		<div class="col text-center">
    			로그인 후 이용해 주세요.
    		</div>
    	</div>
    </div>
    
    <div id="invite_modal">
    	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
    	<div class="row">
    		<div class="col">
    			<div class = "input-group input-group-sm">
    				<input type = "text" class = "form-control" id="searchNick" placeholder = "닉네임">
	  				<div class = "input-group-btn">
	  		  			<button class="btn btn-outline-secondary" type="button" id="searchNickBtn"><i class="bi bi-search"></i></button>
	  				</div>
	    		</div>
	    	</div>
	    </div>
	    <div id="friends"></div>
    </div>
    
    <div id="success_modal">
    	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
    	<div class="row">
    		<div class="col text-center" id="text">
    		</div>
    	</div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script>
        	 let stomp = '';
        	 let roomCode ='';
        	 let sockJs = '';
        	 
            function Modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
                    modal.style.display = 'none';
                    if(sockJs != '' && id != 'invite_modal'){
                    	sockJs.close();
                    }
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
            	
            	if(${loginUser != null}){
            	// 모달창 띄우기
                Modal('room_modal');
                chat();
            	} else{
            		Modal("loginCheck_modal");
            	}
            });
            
            // send 버튼 클릭시
			document.getElementById('send').addEventListener('click', function() {
				send();
			});
            
			// send버튼 엔터
	         function onKeyUp(){
				if (window.event.keyCode == 13){
					send();
				}
			}
            
			function send(){
				const message = document.getElementById('message');
				
				if(message.value != ''){
					stomp.send('/pub/chat/message', {}, JSON.stringify({senderId: '${loginUser.id}', chatContent: message.value, roomCode: roomCode, nickName: '${loginUser.nickName}'}));
					message.value = '';
				}
			}
            
            $("#roomBtn").click(function() {
            	$(".friends").hide();
            	$(".nicks").hide();
            	$(".chatRoom").show();
            	
            	chat();
            });
            
            $("#frndBtn").click(function() {
            	$(".chatRoom").hide();
            	$(".friends").show();
            	
            	$.ajax({
            		url: 'selectInvite.ch',
            		success: (data) => {
            			document.getElementById('inviteList').innerHTML = '';
            			for(const i of data){
            				let str = '<div class="row text-center invite" style="border-bottom: 1px solid black;">';
         					str += '<div class="col invites"><b style="margin-right: 10px;">' + i.roomName + '</b> <small>참가</small> <small>거절</small></div>';
         					str += '</div>';
         					document.getElementById('inviteList').innerHTML += str;
            			}
            			
            			const invites = document.getElementsByClassName('invites');

            			for(const i in data){
            				const invite = invites[i];
            				
            				const smalls = invite.querySelectorAll('small');
            				
            				for(const small of smalls){
	            				small.addEventListener('mouseover', function(){
	            					small.style.cursor = 'pointer';
	            					small.style.textDecoration = 'underline';
	            				});
	            				small.addEventListener('mouseout', function(){
	            					small.style.textDecoration = 'none';
	            				});
            				}
            				
            				smalls[0].addEventListener('click', function(){
            					$.ajax({
            						url: 'participate.ch',
            						data: {roomCode: data[i].roomCode},
            						success: (data) => {
            							Modal("success_modal");
            							document.getElementById('text').innerText = '채팅에 참가하셨습니다.';
            							
            							$(".friends").hide();
            			            	$(".nicks").hide();
            			            	$(".chatRoom").show();
            			            	
            			            	chat();
            						}
            					});
            				});
            				
            				smalls[1].addEventListener('click', function(){
            					$.ajax({
            						url: 'refusalInvite.ch',
            						data: {roomCode: data[i].roomCode},
            						success: (data) => {
            							Modal("success_modal");
            							document.getElementById('text').innerText = '초대를 거절하셨습니다.';
            							
            							$(".friends").hide();
            			            	$(".nicks").hide();
            			            	$(".chatRoom").show();
            			            	
            			            	chat();
            						}
            					})
            				});
            			}
            		}
            	});
            });      

	        // 채팅방 생성
	        document.getElementById('createRoom').addEventListener('click', function(){
	            Modal('createroom_modal');
	        });
	        
	        document.getElementById('chatRoomBtn').addEventListener('click', function(){
    			const roomName = document.getElementById('chatRoomName').value;
    			$.ajax({
        			url: 'createRoom.ch',
        			data: {roomName: roomName, hostId: '${loginUser.id}'},
        			success: (data) => {
        				Modal('success_modal');
        				document.getElementById('text').innerText = '채팅방 생성 완료.';
        				
        				document.getElementById('chatRoomName').value = '';
        				document.getElementById('createroom_modal').style.display = 'none';
        			}
        		});
    		});
	        
	        function chat(){
	        	// 채팅방 리스트 불러오기
      			$.ajax({
      				url: '${contextPath}/chatRoomList.ch',
      				success: (data) => {
      					document.getElementById('rooms').innerHTML = '';
      					for(const c of data){
      						let str = '<div class="row chatRoom" style="border-bottom: 1px solid black;">';
      						str += '<div class="col">';
      						str += '<b style="padding-left:10px;">' + c.roomName + '</b>';
      						str += '<div class="messageCheck"><i class="bi bi-chat-dots"></i></div><br>';
      						str += '<small style="padding-left:10px;">' + c.maxTransferTime +'</small>';
      						str += '<input type="hidden" value="' + c.roomCode + '">';
      						str += '</div></div>';

      						document.getElementById('rooms').innerHTML += str;
      					}
						const chatrooms = document.getElementsByClassName('chatRoom');
						
						for(const room of chatrooms){
							// 채팅방 선택시
					        room.addEventListener('click', function() {
					            Modal('chat_modal');
					            roomCode = this.querySelector('input[type="hidden"]').value;
								
					            // 과거 채팅 불러오기
								$.ajax({
									url: 'chatRoom.ch',
									data: {roomCode:roomCode},
									success: (data) => {
										document.getElementById('chat').innerHTML = '';
										document.getElementById('chatTitle').innerText = data.room.roomName;
										
										for(const c of data.list){							
											if(c.senderId != '${ loginUser.id }'){
												let str = '<div style="clear: both;">';
												str += '<div class="chatBox">';
												str += '<p class="message">' + c.chatContent + '</p><br>';
												str += '<small class="chatNcik" style="clear: both;">' + c.nickName + '</samll>';
												str += '</div></div>';
												
												document.getElementById('chat').innerHTML += str;
											} else{
												let str = '<div style="clear: both;">';
												str += '<div class="chatBox myChat">';
												str += '<p class="message myChat">' + c.chatContent + '</p>';
												str += '<small class="chatNcik myChat" style="clear: both;">' + c.nickName + '</samll>';
												str += '</div></div>';
												
												document.getElementById('chat').innerHTML += str;
											}
										}
										
										// 채팅 스크롤 아래로 고정
										$('#chatBoxs').scrollTop($('#chatBoxs')[0].scrollHeight);
										
										 // webSocket connect
							    		sockJs = new SockJS("${contextPath}/stomp/chat");
							    		stomp = Stomp.over(sockJs);
							         	
							    		if(stomp != ''){
								         	// connect 시
									        stomp.connect({}, function (){
									            // subscribe 시
									    		stomp.subscribe("/sub/chat/room/" + roomCode, function (chat) {
									    			const content = JSON.parse(chat.body);
									    			const chatDiv = document.getElementById('chat');
									    			
									    			if(content.senderId != '${ loginUser.id }'){
									    				let str = '<div style="clear: both;">';
														str += '<div class="chatBox">';
														str += '<p class="message">' + content.chatContent + '</p><br>';
														str += '<small class="chatNcik" style="clear: both;">' + content.nickName + '</samll>';
														str += '</div></div>';
														
														chatDiv.innerHTML += str;
									    			} else{
									    				let str = '<div style="clear: both;">';
														str += '<div class="chatBox myChat">';
														str += '<p class="message myChat">' + content.chatContent + '</p>';
														str += '<small class="chatNcik myChat" style="clear: both;">' + content.nickName + '</samll>';
														str += '</div></div>';
														
														chatDiv.innerHTML += str;
									    			}
									    			
									    			$('#chatBoxs').scrollTop($('#chatBoxs')[0].scrollHeight);
									    		});
									        });
							    		}
							    		
							    		document.getElementById('inviteBtn').addEventListener('click', function(){
							    			Modal('invite_modal');
							    		});
							    		
							    		document.getElementById('searchNickBtn').addEventListener('click', function() {
							            	const nick = document.getElementById('searchNick').value;
							            	
							            	if(nick != '${loginUser.nickName}'){
							            	$.ajax({
							            		url: 'searchNick.ch',
							            		data: {nick:nick},
							            		success: (data) => {
							            			document.getElementById('friends').innerHTML = '';
							            			if(data != ''){

							            				let str = '<div class="row nicks" style="border-bottom: 1px solid black;">';
							            				str += '<div class="col">';
							            				str += '<b class="nick">' + data.nickName + '</b> <small id="invite">초대하기</small>';
							            				str += '</div></div>';
							            				
							            				document.getElementById('friends').innerHTML += str;
							            				
							            				const invite = document.getElementById('invite');
							            				
							            				invite.addEventListener('click', () => {

							                        		const roomName = document.getElementById('chatRoomName').value;
							                        		$.ajax({
							                            		url: 'inviteChat.ch',
							                            		data: {roomCode: roomCode, recipentId: data.id},
							                            		success: (data) => {
							                            			Modal('success_modal');
							                            			document.getElementById('text').innerText = '초대 성공';
							                            			
							                            			document.getElementById('friends').innerHTML = '';
							                            			document.getElementById('searchNick').value = '';
							                            		}
							                            	});

							                        	});
							            			}
							            		}
							            	});
							            	}
							            });
									},
									error: (data) => {
										
									}
								});
					        });	
					    }
      				}
      			});
	        }


   </script>
  </body>
</html>