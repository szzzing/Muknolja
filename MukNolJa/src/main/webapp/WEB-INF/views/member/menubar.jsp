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
    	 #room_modal, #loginCheck_modal, #createroom_modal, #createRoomSuccess_modal{
                display: none;
                width: 300px;
                height: 400px;
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
            	width:10px;
  				height:10px;
  				border-radius: 50%;
  				background: green;
  				float: right;
  				margin-top: 20px;
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
            #createRoom:hover{
            	text-decoration: underline;
            	cursor: pointer;
            }
    </style>
  </head>
  <body>
	
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   	 <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
   	 <c:set var="contextPath" value="${ pageContext.request.contextPath }" scope="application"/>
  	 <header id="header"  style="top:0; left:0; position:fixed; z-index:99999">
     <div class="container-fluid text-center">
	  	<div class="row justify-content-center shadow" style="width: 100vw; height:80px; background: white;">
            <div class="col" style="width:1200px; height:80px; ">
            	<div style=" width:1200px; height:80px; display:inLine-block; " >
            		<div style="display:flex; float:left; ">
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
		            		<div class="menud">동행</div>
	            			<div style="float:right; margin-left:550px; margin-top:-2px; display:flex">
	            				<h3 id="popup_open_btn"><i class="fa-solid fa-comments"></i></h3>
	            			<c:if test="${ empty loginUser }">
		        <li class="nav-item" style="margin-right:3%; width:40%" >
		          <a class="nav-link " href="${contextPath }/loginView.me" style="font-size: 1.4vw; ">로그인</a>
		        </li>
		        </c:if>	
	            			</div>
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
				<div class="row text-center invite" style="border-bottom: 1px solid black;">
					<div class="col"><b style="margin-right: 10px;">채팅방 이름</b> <small>참가</small> <small>거절</small></div>
				</div>
			</div>
			<div id="friends"></div>
		</div>
     </div>
     
     <div id="chat_modal">
     	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
     	<div class="row">
     		<div class="col text-center" style="border-bottom: 1px solid black; padding: 10px;"><b>채팅방 이름</b></div>
     	</div>
     	<div id="chatBoxs">
     		<div id="chat">
     		</div>
     		<div class = "input-group input-group-sm" id="sendMessage">
            	<input type = "text" class = "form-control" id="message" placeholder = "message">
	            <div class = "input-group-btn">
	               	<button class="btn btn-outline-secondary" type="button" id="send"><i class="bi bi-chat-square-text"></i></button>
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
    
    <div id="createRoomSuccess_modal">
    	<a class="modal_close_btn"><i class="bi bi-x-circle"></i></a>
    	<div class="row">
    		<div class="col text-center">
    			채팅방 생성 완료
    		</div>
    	</div>
    </div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
         <script>
         window.onload = () => {
        	 let stomp = '';
        	 
            function Modal(id) {
                var zIndex = 9999;
                var modal = document.getElementById(id);

                // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
                modal.querySelector('.modal_close_btn').addEventListener('click', function() {
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
            	
            	if(${loginUser != null}){
            	// 모달창 띄우기
                Modal('room_modal');
            	
      			$.ajax({
      				url: '${contextPath}/chatRoomList.ch',
      				success: (data) => {
      					document.getElementById('rooms').innerHTML = '';
      					for(const c of data){
      						let str = '<div class="row chatRoom" style="border-bottom: 1px solid black;">';
      						str += '<div class="col">';
      						str += '<b style="padding-left:10px;">' + c.roomName + '</b>';
      						str += '<div class="messageCheck"></div><br>';
      						str += '<small style="padding-left:10px;">3분</small>';
      						str += '<input type="hidden" value="' + c.roomCode + '">';
      						str += '</div></div>';

      						document.getElementById('rooms').innerHTML += str;
      					}
						const chatrooms = document.getElementsByClassName('chatRoom');
						
						for(const room of chatrooms){
					        room.addEventListener('click', function() {
					        	console.log('a');
					            Modal('chat_modal');
					            const roomCode = room.querySelector('input[type="hidden"]').value;

								$.ajax({
									url: 'chatRoom.ch',
									data: {roomCode:roomCode},
									success: (data) => {
										const roomCode = data.roomCode;
										document.getElementById('chat').innerHTML = '';
										
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
										
										$('#chatBoxs').scrollTop($('#chatBoxs')[0].scrollHeight);
										
										 // webSocket connect
							    		const sockJs = new SockJS("${contextPath}/stomp/chat");
							    		stomp = Stomp.over(sockJs);
							         	
							    		if(stomp != ''){
								         	// connect 시
									        stomp.connect({}, function (){
									            // subscribe 시
									    		stomp.subscribe("/sub/chat/room/" + roomCode, function (chat) {
									    			const content = JSON.parse(chat.body);
									    			console.log(content);
									    			
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
									            
									    		// send 버튼 클릭시
												document.getElementById('send').addEventListener('click', function() {
													const message = document.getElementById('message');
													if(message.value != ''){
														stomp.send('/pub/chat/message', {}, JSON.stringify({senderId: '${loginUser.id}', chatContent: message.value, roomCode: roomCode, nickName: '${loginUser.nickName}'}));
														message.value = '';
													}
												});
									            
									        });
							    		}
									},
									error: (data) => {
										
									}
								});
					        });	
					    }
      				}
      			});
      			chatrooms = document.getElementsByClassName('chatRoom');
            	} else{
            		Modal("loginCheck_modal");
            	}
            });
            
            $("#roomBtn").click(function() {
            	$(".friends").hide();
            	$(".nicks").hide();
            	$(".chatRoom").show();
            	
            	$.ajax({
            		url: '${contextPath}/chatRoomList.ch',
      				success: (data) => {
      					document.getElementById('rooms').innerHTML = '';
      					for(const c of data){
      						let str = '<div class="row chatRoom" style="border-bottom: 1px solid black;">';
      						str += '<div class="col">';
      						str += '<b style="padding-left:10px;">' + c.roomName + '</b>';
      						str += '<div class="messageCheck"></div><br>';
      						str += '<small style="padding-left:10px;">3분</small>';
      						str += '<input type="hidden" value="' + c.roomCode + '">';
      						str += '</div></div>';

      						document.getElementById('rooms').innerHTML += str;
      					}
      				}
            	});
            });
            
            $("#frndBtn").click(function() {
            	$(".chatRoom").hide();
            	$(".friends").show();
            });
            
//             document.getElementById('searchNickBtn').addEventListener('click', function() {
//             	const nick = document.getElementById('searchNick').value;
            	
//             	if(nick != '${loginUser.nickName}'){
//             	$.ajax({
//             		url: 'searchNick.ch',
//             		data: {nick:nick},
//             		success: (data) => {
//             			document.getElementById('friends').innerHTML = '';
//             			if(data != ''){
//             				console.log(data);
//             				let str = '<div class="row nicks" style="border-bottom: 1px solid black;">';
//             				str += '<div class="col">';
//             				str += '<b class="nick">' + data.nickName + '</b> <small id="createRoom">채팅하기</small>';
//             				str += '</div></div>';
            				
//             				document.getElementById('friends').innerHTML += str;
            				
//             				const createRoom = document.getElementById('createRoom');
            				
//             				createRoom.addEventListener('click', () => {
                        		
//                         		Modal('createroom_modal');
                        		
//                         		document.getElementById('chatRoomBtn').addEventListener('click', function(){
//                         			const roomName = document.getElementById('chatRoomName').value;
//                         			$.ajax({
//                             			url: 'createRoom.ch',
//                             			data: {roomName: roomName, participantID: data.id, hostId: '${loginUser.id}'},
//                             			success: (data) => {
//                             				Modal('createRoomSuccess_modal');
//                             			}
//                             		});
//                         		});
//                         	});
//             			}
//             		}
//             	});
//             	}
//             });
            

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
        				Modal('createRoomSuccess_modal');
        			}
        		});
    		});

         }
        </script>
  </body>
</html>