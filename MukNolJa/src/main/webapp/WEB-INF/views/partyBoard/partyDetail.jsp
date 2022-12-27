<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
<style>
	@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  	*{font-family: 'Noto Sans KR', sans-serif;}
	h3{font-weight: bold;}
	.title{height: 300px; margin-bottom: 10px; margin-top: 30px;}
	.title button{background: #6BB6EC; border-color: #6BB6EC;}
	.title button:hover{background: white; color: #6BB6EC; border-color: #6BB6EC;}
	#location1, #location2{border: 1px solid lightgray; border-radius: 5px;}
	#location1{padding-left: 10px; padding-top: 15px; padding-right: 20px; height: 180px; margin-bottom: 30px;}
	#location2{height: 400px;}
	#location1 button{float: right;}
	#profile img{border-radius: 50%; width: 50px; height: 50px; margin-bottom: 10px;}
	#location2{overflow-x: auto;}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px;}
	.content{height: 250px; margin-bottom: 30px;}
	.content textarea{border: none;}
	
 	
 	ol.numbered {
	  list-style: none;
	  border-left: 3px solid RGB(107, 182, 236,0.7);
	  counter-reset: numbered-list;
	  margin-left: 50px;
	  margin-top: 25px;
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
	
	#travelReply{margin-top: 30px;}
	#button-addon2{background: #6BB6EC; border-color: lightgray; color: white;}
	#button-addon2:hover{background: white; border-color: lightgray; color: #6BB6EC;}
	
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>

	<div class="container">
	
		<br><br><br><br><br><br>
	
		<img src="${ contextPath }/resources/uploadFiles/${p.thumbnail}" id="thumbnail">
		
		
		<div class="title row">
			<div class="col-lg-8">
				<!-- 제목 -->
				<h3>${ p.partyTitle }</h3>
				
				<!-- 선택목록 -->
				<div id="location1">
					<table>
						<tr>
							<td width="30px;" style="text-align: center"><i class="fa-solid fa-location-dot"></i></td>
							<td>${ p.partyArea }</td>
						</tr>
						<tr>
							<td style="text-align: center"><i class="fa-solid fa-users"></i></td>
							<td>0/${ p.maxParticipate }</td>
						</tr>
						<tr>
							<td style="text-align: center"><i class="fa-solid fa-heart"></i></td>
							<td>${ p.gender }</td>
						</tr>
						<tr>
							<td style="text-align: center"><i class="fa-solid fa-calendar-days"></i></td>
							<td>${ p.partyStartDate }~${ p.partyEndDate }</td>
						</tr>
					</table>
					<button type="button" class="btn btn-primary btn-lg">동행참여하기</button>
				</div>
				
				<!-- 내용 -->
				<div class="content input-group">
				  <textarea class="form-control" aria-label="With textarea" style="resize: none;">${ p.partyContent }</textarea>
				</div>
			</div>
			
			<div class="col">
				<div id="profile">
					<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
 					<label style="font-weight: bold;">${ p.nickName }</label>
				</div>
				<div id="location2">
					 <ol class="numbered">
					 <c:set var="courseList" value="${fn:split(p.partyCourse,'/')}" />
						<c:forEach items="${ courseList }" var="course">
							<li>${ course }</li>
						</c:forEach>
					</ol>
				</div>
			</div>
			
			<div id="partyReply">
				<h4 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>0</span></h4>
				<div class="input-group mb-3">
					<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
					<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
				</div>
			</div>
		</div>
		
		

		<br><br>
		
		
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>