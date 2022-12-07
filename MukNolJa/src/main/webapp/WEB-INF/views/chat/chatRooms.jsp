<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#chatRoomList{
		min-height: 400px;
		width: 300px;
		border: 1px solid black;
		margin-top: 150px;
		box-shadow: 0 0 4px rgba(0,0,0,.14),0 4px 8px rgba(0,0,0,.28);
		font-family: sans-serif;
		background-color: #6e6e6e;
		color: white;
	}
	#title{
		height: 50px;
		margin-top: 20px;
		border-bottom: 1px solid gray;
	}
	.rooms{
		border-bottom: 1px solid gray;
	}
	.rooms:hover{
		background: lightgray;
		cursor: pointer;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
</head>
<body>
	<div class="container" id="chatRoomList">
		<div class="row text-center" id="title">
			<div class="col">
				<b>채팅방</b>
			</div>
		</div>
		<c:forEach var="c" items="${ list }">
			<div class="row">
				<div class="col rooms">
						<b>&nbsp;&nbsp;&nbsp;&nbsp;${ c.roomName }</b>
						<br>
						<small>&nbsp;&nbsp;&nbsp;&nbsp;2022-11-11</small>
						<input type="hidden" value="${ c.roomCode }">
				</div>
			</div>
		</c:forEach>
	</div>
</body>
<script>
	window.onload = () => {
		const rooms = document.getElementsByClassName('rooms');
		
		for(const room of rooms){
			room.addEventListener('click', function() {
				const roomCode = this.querySelector('input[type="hidden"]').value;
				const roomName = this.querySelector('b').value;
				location.href = '${contextPath}/chatRoom.ch?roomCode=' + roomCode;
			});
		}
	}
</script>
</html>