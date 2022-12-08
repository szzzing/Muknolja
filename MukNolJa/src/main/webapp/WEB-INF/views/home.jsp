<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <style>
   .a{
		text-decoration: none;
		color:white;
		}
		.a:hover{
			text-decoration: none;
		}
    </style>
    
  </head>
  <body style="margin-top:25vh; background-color: white">
  <jsp:include page="member/menubar.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
   <div style="color: white" >
   	<a class="a" style="color: white" href="${ contextPath }/member.me">membedsewhtwhtjkWWWWsssssdss</a>
   <a class="a"href="${ contextPath }/createRoom.ch?roomName=CHAT&BoardId=23" >채팅방 생성</a>
   <a class="a"href="${ contextPath }/chatRoomList.ch" >채팅방 목록</a>
   <a class="a"href="${ contextPath }/hotelList.ho">호텔 리스트</a>
   <a class="a"href="${ contextPath }/writeRoom.ho">객실만들기</a>
   <a class="a"href="${ contextPath }/adminPage.me" >관리자 페이지</a>
     
 
     </div>
    <script>
    	
    </script>
  </body>
</html>
