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
	#location1{padding-left: 10px; padding-top: 15px; padding-right: 20px; height: 180px; margin-bottom: 30px; margin-top: 20px;}
	#location2{height: 420px; margin-top: 20px;}
	#location1 button{float: right;}
	#profile img{border-radius: 50%; width: 50px; height: 50px; margin-bottom: 10px;}
	#location2{overflow-x: auto;}
	#location2::-webkit-scrollbar {width: 8px;}
	#location2::-webkit-scrollbar-thumb {
	    height: 30%;
	    background: lightgray;
	    border-radius: 10px;
	}
	#location2::-webkit-scrollbar-track {
	    background: rgba(176, 176, 176, .1);
	}
 	#thumbnail{width: 100%; height: 400px; border-radius: 15px; margin-bottom: 30px;}
	.content{height: 245px; margin-bottom: 30px;}
	.content textarea{border: none; outline: none;}
	
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
	#updateButton{color: #424242; border: none; background: white;}
	#updateButton:hover{color: #6BB6EC; border: none; background: white; text-decoration: underline; font-weight: 700;}
	#deleteButton{color: #424242; border: none; background: white;}
	#deleteButton:hover{color: #6BB6EC; border: none; background: white; text-decoration: underline; font-weight: 700;}
	.replyProfile img{border-radius: 50%; width: 40px; height: 40px; margin-bottom: 10px; float:left;}
	.replyProfile table{font-size: 12px; vertical-align: middle;}
	.reReplyProfile img{border-radius: 50%; width: 40px; height: 40px; margin-bottom: 10px; float:left;}
	.reReplyProfile table{font-size: 12px; vertical-align: middle;}
	.buttons{background: white !important; border: none; font-size: 13px; opacity: 0.7;}
	.buttons:hover{background: white !important; border: none; font-size: 13px; color: tomato!important; font-weight: 700;}
	.travelList{cursor: pointer;}
	.replyContent{clear:both; margin-left: 33px; margin-top: 15px;}
	.replyContent textarea{resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;}
	.reReplyContent{clear:both; margin-left: 33px; margin-top: 15px;}
	.reReplyContent textarea{resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;}
	#partyReply input[readonly]{background: white;}
	.well{margin-top: 20px; padding-left: 60px;}
	.well input[readonly]{background: white;}
	#reReplyInput{color: white;}
	#reReplyInput:hover{color: #6BB6EC; border-color: lightgray;}
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>

	<div class="container">
	
		<br><br><br><br><br><br>
		
		<form id="detailForm" method="POST">
		<input type="hidden" name="partyId" value="${ p.partyId }">
		<input type="hidden" name="fileId" value="${ p.fileId }">
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
				  <textarea style="resize: none; width: 100%;" readonly>${ p.partyContent }</textarea>
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
					 <c:set var="contentIdList" value="${fn:split(p.contentCourse,'/')}" />
						<c:forEach items="${ courseList }" var="course" varStatus="status">
							<li class="travelList">${ course }<input type="hidden" class="contentId" value="${ contentIdList[status.index] }"></li>
						</c:forEach>
					 </ol>
				</div>
				<c:if test="${ loginUser.id != p.partyWriter }">
					<div style="float: right; margin-top: 15px; display: none;">
						<button type="submit" id="updateButton">수정</button>
						<button type="submit" id="deleteButton">삭제</button>
					</div>
				</c:if>
				<c:if test="${ loginUser.id == p.partyWriter }">
					<div style="float: right; margin-top: 15px;">
						<button type="button" id="updateButton">수정</button>
						<button type="button" id="deleteButton" data-bs-toggle="modal" data-bs-target="#exampleModal">삭제</button>
					</div>
				</c:if>
				
			</div>
			
			<!-- 글 삭제 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
			        정말로 <span style="color: #DF0101">삭제</span>하시겠습니까?
			      </div>
			      <div class="modal-footer" style="border: none!important; margin: auto;">
			        <button type="button" class="buttons" style="font-size: 14px; margin-bottom: 30px;" id="realDelete">예</button>
			        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">아니오</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 댓글작성 -->
			<div id="partyReply" style="margin-top:40px">
				<h5 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span>0</span></h5>
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
			
			<!-- 댓글내용 -->
			<div id="reply" style="margin-top: 30px;">
				<c:forEach items="${ rList }" var="r">
					<div class="replyProfile">
						<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">
						<table style="float:left; margin-left: 10px;">
							<tr>
								<td>${ r.nickName }</td>
							</tr>
							<tr>
								<td style="color: gray;">${ r.replyModifyDate }</td>
							</tr>
						</table>
						<c:if test="${ r.replyWriter == loginUser.id }">
							<div style="float:right;">
								<button class="buttons deleteReply"><i class="fa-solid fa-trash-can"></i></button>
								<input type="hidden" value="${ r.replyId }" name="replyId">
							</div>
						</c:if>
						<c:if test="${ r.replyWriter != loginUser.id }">
							<div style="float:right;">
								<button class="buttons" type="button">신고하기</button>
							</div>
						</c:if>
					</div>
					<div class="replyContent">
						<textarea readonly>${ r.replyContent }</textarea>
					</div>
					
					<!-- 대댓글 -->
					<div class="reReply">
						<button class="buttons reReplyButton" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">답글달기</button>
						<div class="collapse" id="collapseExample">
						  <div class="well">
						  
						  
						  
						  	<!-- 대댓글 작성 -->
						  	<div class="input-group mb-3">
								<c:if test="${ loginUser == null }">
									<input type="text" class="form-control" placeholder="로그인 후 이용해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
									<button class="btn btn-outline-secondary" type="button" disabled><i class="bi bi-send"></i></button>
								</c:if>
								<c:if test="${ loginUser != null }">
									<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="reReplyContent">
									<button class="btn btn-outline-secondary" type="button" id="reReplyInput"><i class="bi bi-send"></i></button>
								</c:if>
							</div>
							
							<!-- 대댓글 프로필 -->
							<div class="reReplyProfile">
								<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA4MjlfMjA1%2FMDAxNjYxNzY3NjYzMTAx.E20lmjuZ7eByN7-uB98mkxBtD6GiIZOcZG5lio7PiM4g.znLD9iljAq9HiqM0yOiwmNilcIvQUGFvzPr81S5Shegg.JPEG.lrlsco2%2FIMG_6631.JPG&type=sc960_832">
								<table style="float:left; margin-left: 10px;">
									<tr>
										<td>${ r.nickName }</td>
									</tr>
									<tr>
										<td style="color: gray;">${ r.replyModifyDate }</td>
									</tr>
								</table>
								<c:if test="${ r.replyWriter == loginUser.id }">
									<div style="float:right;">
										<button class="buttons deleteReReply"><i class="fa-solid fa-trash-can"></i></button>
										<input type="hidden" value="${ r.replyId }" name="replyId">
									</div>
								</c:if>
								<c:if test="${ r.replyWriter != loginUser.id }">
									<div style="float:right;">
										<button class="buttons" type="button">신고하기</button>
									</div>
								</c:if>
							</div>
							
							<!-- 대댓글 내용 -->
							<div class="reReplyContent">
								<textarea readonly>${ r.replyContent }</textarea>
							</div>
							
							<hr style="margin-top: 10px; border-color: #4682B4; margin-bottom: 30px;">
							
							
							
							
							
							
						  </div>
						</div>
					</div>
					<hr style="margin-top: 10px; border-color: gray;">
				</c:forEach>
				
				<input type="hidden" name="realDeleteRepId">
			</div>
			
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		</div>
		
		</form>
		
	</div>
	
	
	
	<script>
		const travelLists = document.getElementsByClassName('travelList');
		for(const travelList of travelLists){
			travelList.addEventListener('click', function(){
				const contentId = travelList.querySelector('input').value;
				location.href='${contextPath}/travelDetail.tr?contentId=' + contentId;
			});
		}
		
		window.onload = () =>{
			const updateButton = document.getElementById('updateButton');
			const form = document.getElementById('detailForm');
			if(updateButton != null){
				updateButton.addEventListener('click', function(){
						form.action = '${contextPath}/updateForm.pa';
						form.submit();
				});
			}
			
			const realDelete = document.getElementById('realDelete');
			realDelete.addEventListener('click', function(){
				form.action = '${contextPath}/deleteParty.pa';
				form.submit();
			});
			
			document.getElementById('button-addon2').addEventListener('click', function(){
				$.ajax({
					url: '${contextPath}/insertReply.pa',
					data: {replyContent:document.getElementById('replyContent').value,
						   refBoardId:${p.partyId}, replyWriter:"${loginUser.id}"},
					success: (data) =>{
						console.log(data);
						
						document.getElementById('reply').innerHTML = '';
						
						for(const r of data){
							var profileImg = '<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjEwMjVfMTgz%2FMDAxNjY2NzA4NjI5ODgx.xP4DuaOg_fn_wnYQ0icZAdibPZj01TpMH-owvohB7l4g.FkOjV2Nh8vi18cE0h5A-6ItHqqBMPgxW3lRCS_9g028g.JPEG.ymtlfet%2FIMG_6191.JPG&type=sc960_832">';
							var profileInfo = '<table style="float:left; margin-left: 10px;"><tr><td>' + r.nickName + '</td></tr><tr><td style="color: gray;">' + r.replyModifyDate + '</td></tr></table>';
							var deleteR = '<div style="float:right;"><button class="buttons deleteReply" type="button"><i class="fa-solid fa-trash-can"></i></button><input type="hidden" value="' + r.replyId + '" name="replyId"></div>';
							var reportR = '<div style="float:right;"><button class="buttons" type="button">신고하기</button></div>';
							var reReply = '<div><button class="buttons" type="button">답글달기</button></div>';
							var replyContent = '<div class="replyContent"><textarea readonly>' + r.replyContent +'</textarea></div>';
							var hr = '<hr style="margin-top: 10px; border-color: gray;">';
							var realDeleteRepId = '<input type="hidden" name="realDeleteRepId">';
							var replyProfile = '';
							if(r.replyWriter == '${loginUser.id}'){
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + deleteR + '</div>';
							}else{
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + reportR + '</div>';
							}
							document.getElementById('reply').innerHTML += (replyProfile + replyContent + reReply + hr) + realDeleteRepId;
						}
						
						document.getElementById('replyContent').value = '';
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
		}
		
		$(document).on('click', '.reReplyButton', function () {
			var collapses = $(this).parent().find('.collapse');
			collapses.each(function(){
				$(this).collapse('show');
				$(this).collapse('hide');
			});
		});
		
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>