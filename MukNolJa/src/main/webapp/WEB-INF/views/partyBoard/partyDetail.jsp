<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹놀자 - ${ p.partyTitle }</title>
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
	.reReplyContent2{clear:both; margin-left: 33px; margin-top: 15px;}
	.reReplyContent2 textarea{resize:none; border: none; border-radius: 10px; padding: 10px; width: 100%; font-size: 15px; outline: none;}
	#partyReply input[readonly]{background: white;}
	.well{margin-top: 20px; padding-left: 60px;}
	.well input[readonly]{background: white;}
	.reReplyInput{color: white!important; border-top-right-radius: 5px!important; border-bottom-right-radius: 5px!important; }
	.reReplyInput:hover{color: #6BB6EC!important; border-color: lightgray; border-top-right-radius: 5px!important; border-bottom-right-radius: 5px!important;}
	#noParticipate{background: #FF6C6C; border-color: #FF6C6C;}
	#noParticipate:hover{background: white; border-color: #FF6C6C; color: #FF6C6C;}
	#boardInfo td{font-size: 12px; color: gray; text-align: center;}
	#boardInfo button{background: white !important; border: none; opacity: 0.7;}
	#boardInfo button:hover{background: white !important; border: none; color: tomato!important; font-weight: 700;}
	.mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:40px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	.mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
</style>
</head>
<body>

	<jsp:include page="../member/menubar.jsp"/>

	<div class="container">
	
		<br><br><br><br><br><br>
		
		<form id="detailForm" method="POST">
		<input type="hidden" name="partyId" value="${ p.partyId }">
		<input type="hidden" name="fileId" value="${ p.fileId }">
		<input type="hidden" name="writer" value="${ p.nickName }">
		<input type="hidden" name="nowParticipate" value="${ partyCount }">
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
							<td><span id="particiNum">${ partyCount }</span>/${ p.maxParticipate }</td>
						</tr>
						<tr>
							<td style="text-align: center"><i class="fa-solid fa-heart"></i></td>
							<td>${ p.partyGender }</td>
						</tr>
						<tr>
							<td style="text-align: center"><i class="fa-solid fa-calendar-days"></i></td>
							<td>${ p.partyStartDate }~${ p.partyEndDate }</td>
						</tr>
					</table>
					<div id="particiButton">
						<c:if test="${ loginUser.id != p.partyWriter}">
							<c:if test="${ checkParty == 0 }">
								<button type="button" class="btn btn-primary btn-lg" id="participate">동행참여하기</button>
							</c:if>
							<c:if test="${ checkParty == 1 }">
								<button type="button" class="btn btn-primary btn-lg" id="noParticipate">참여취소하기</button>
							</c:if>
						</c:if>
						<c:if test="${ loginUser.id == p.partyWriter }">
							<button type="button" class="btn btn-primary btn-lg" id="participate" style="display: none;" disabled>동행참여하기</button>
						</c:if>
					</div>
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
						<button type="button" id="updateButton">수정</button>
						<button type="button" id="deleteButton">삭제</button>
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
			
			
			
			<!-- info -->
			<div id="boardInfo" style="margin-top:40px">
				<table>
					<tr>
						<td width=" 75px;" style="text-align: left">${ p.createDate }</td>
						<td>·</td>
						<td width=" 60px;">조회수 <span>0</span></td>
						<td>·</td>
						<td width=" 65px;"><button id="reportParty" type="button">신고하기</button></td>
					</tr>
				</table>
			</div>
			
			<!-- 신고 모달 -->
			<!-- 이미 신고 -->
			<div class="modal fade" id="alreadyPaReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
			        이미 신고한 게시글입니다.
			      </div>
			      <div class="modal-footer" style="border: none!important; margin: auto;">
			        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<div class="modal fade" id="alreadyReReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
			        이미 신고한 댓글입니다.
			      </div>
			      <div class="modal-footer" style="border: none!important; margin: auto;">
			        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 진짜 글신고 -->
			<div class="modal fade" id="realReportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-body" style="border: none!important; margin-top: 10px; margin-left: 10px; margin-right: 10px; text-align: center; font-size: 20px;">
			      	<h4>신고 내용 작성</h4>
			        <input type="text" class="form-control" id="reportTitle" style="margin-bottom:20px; margin-top: 20px;" placeholder="제목">
			        <textarea class="form-control" id="reportContent" style="resize: none; height: 200px;" placeholder="내용"></textarea>
			        <input type="hidden" id="refReply">
			      </div>
			      <div class="modal-footer" style="border: none!important; margin: auto;">
			        <button type="button" class="mukButton" style="font-size: 14px; margin-bottom: 20px;" id="realReport">보내기</button>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 신고 완료 -->
			<div class="modal fade" id="endReport" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog modal-dialog-centered">
			    <div class="modal-content">
			      <div class="modal-body" style="border: none!important; margin-top: 30px; text-align: center; font-size: 20px;">
			        신고 접수가 완료되었습니다.
			      </div>
			      <div class="modal-footer" style="border: none!important; margin: auto;">
			        <button type="button" class="buttons" data-bs-dismiss="modal" style="font-size: 14px; margin-bottom: 30px;">닫기</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<!-- 댓글작성 -->
			<div id="partyReply" style="margin-top: 10px;">
				<h5 class="mb-3"><i class="fa-solid fa-pen-to-square"></i> 댓글<span id="replyCount">&nbsp;${replyCount}</span></h5>
				<div class="input-group mb-3">
					<c:if test="${ loginUser == null }">
						<input type="text" class="form-control" placeholder="로그인 후 이용해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" readonly>
						<button class="btn btn-outline-secondary" type="button" id="button-addon2" disabled><i class="bi bi-send"></i></button>
					</c:if>
					<c:if test="${ loginUser != null }">
						<input type="text" class="form-control" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2" id="replyContent">
						<button class="btn btn-outline-secondary" type="button" id="button-addon2"><i class="bi bi-send"></i></button>
					</c:if>
				</div>
			</div>
			
			<!-- 댓글내용 -->
			<div id="reply" style="margin-top: 30px;">
				<c:forEach items="${ rList }" var="r" varStatus="status">
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
								<button class="buttons deleteReply" type="button"><i class="fa-solid fa-trash-can"></i></button>
								<input type="hidden" value="${ r.replyId }" name="replyId">
							</div>
						</c:if>
						<c:if test="${ r.replyWriter != loginUser.id }">
							<div style="float:right;">
								<button class="buttons reportReply" type="button">신고</button>
								<input type="hidden" value="${ r.replyId }" name="replyId">
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
									<button class="btn btn-outline-secondary" type="button" style="border-top-right-radius: 5px!important; border-bottom-right-radius: 5px!important;" disabled><i class="bi bi-send"></i></button>
								</c:if>
								<c:if test="${ loginUser != null }">
									<input type="text" class="form-control reReplyContent" placeholder="댓글을 입력해주세요" aria-label="Recipient's username" aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary reReplyInput" type="button"><i class="bi bi-send"></i></button>
								</c:if>
								<input type="hidden" value="${ r.replyId }" class="replyId">
							</div>
							
							<div class="reReply2">
							</div>
						  </div>
						</div>
					</div>
					<hr style="margin-top: 10px; border-color: gray;">
				</c:forEach>
				
				<input type="hidden" name="realDeleteRepId">
			</div>
			
		</div>
		
		</form>
		
	</div>
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script>
		
		window.onload = () =>{
			
			<!-- 코스 상세보기 -->
			const travelLists = document.getElementsByClassName('travelList');
			for(const travelList of travelLists){
				travelList.addEventListener('click', function(){
					const contentId = travelList.querySelector('input').value;
					location.href='${contextPath}/travelDetail.tr?contentId=' + contentId;
				});
			}
			
			<!-- 글 수정 -->
			const updateButton = document.getElementById('updateButton');
			const form = document.getElementById('detailForm');
			if(updateButton != null){
				updateButton.addEventListener('click', function(){
						form.action = '${contextPath}/updateForm.pa';
						form.submit();
				});
			}
			
			<!-- 글 삭제 -->
			const realDelete = document.getElementById('realDelete');
			realDelete.addEventListener('click', function(){
				form.action = '${contextPath}/deleteParty.pa';
				form.submit();
			});
			
		
			<!-- 댓글 입력 -->
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
							var reportR = '<div style="float:right;"><button class="buttons reportReply" type="button">신고<input type="hidden" value="' + r.replyId + '" name="replyId"></button></div>';
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
						document.getElementById('replyCount').innerText = Number(document.getElementById('replyCount').innerText) + 1;
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			<!-- 대댓 list -->
			$(document).on('click', '.reReplyButton', function () {
				var collapses = $(this).parent().find('.collapse');
				collapses.collapse('show');
				var replyId = Number($(this).parent().find('.replyId').val());
				$(this).parent().find('.reReply2').html("");
				$.ajax({
					url: '${contextPath}/selectReReply.pa',
					data: {refReplyId:replyId},
					success: (data) =>{
						console.log(data);
						console.log($(this).parent().find('.reReply2'));
						$(this).parent().find('.reReply2').html("");
						for(const rr of data){
							var profileImg = '<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA4MjlfMjA1%2FMDAxNjYxNzY3NjYzMTAx.E20lmjuZ7eByN7-uB98mkxBtD6GiIZOcZG5lio7PiM4g.znLD9iljAq9HiqM0yOiwmNilcIvQUGFvzPr81S5Shegg.JPEG.lrlsco2%2FIMG_6631.JPG&type=sc960_832">';
							var profileInfo = '<table style="float:left; margin-left: 10px;"><tr><td>' + rr.nickName + '</td></tr><tr><td style="color: gray;">' + rr.replyModifyDate + '</td></tr></table>';
							var deleteR = '<div style="float:right;"><button class="buttons deleteReply" type="button"><i class="fa-solid fa-trash-can"></i></button><input type="hidden" value="' + rr.replyId + '" name="replyId"></div>';
							var reportR = '<div style="float:right;"><button class="buttons reportReply" type="button">신고</button><input type="hidden" value="' + rr.replyId + '" name="replyId"></div>';
							var replyContent = '<div class="replyContent"><textarea readonly>' + rr.replyContent +'</textarea></div>';
							var hr = '<hr style="margin-top: 10px; border-color: #4682B4; margin-bottom: 30px;">';
							var replyProfile = '';
							if(rr.replyWriter == '${loginUser.id}'){
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + deleteR + '</div>';
							}else{
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + reportR + '</div>';
							}
							$(this).parent().find('.reReply2').append(replyProfile + replyContent + hr);
						}
						
					},
					error: (data) =>{
						console.log(data)
					}
				});
			});
			
			<!-- 대댓 입력 -->
			$(document).on('click', '.reReplyInput', function(){
				var replyId = Number($(this).parent().find('.replyId').val());
			 	$.ajax({
			 		url: '${contextPath}/insertReReply.pa',
			 		data: {replyContent:$(this).parent().find('.reReplyContent').val(),
			 			   refReplyId:replyId, replyWriter:"${loginUser.id}", refBoardId:${p.partyId}},
					success: (data) =>{
						console.log(data);
						
						$(this).parent().parent().find('.reReply2').html("");
					
						for(const rr of data){
							var profileImg = '<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMjA4MjlfMjA1%2FMDAxNjYxNzY3NjYzMTAx.E20lmjuZ7eByN7-uB98mkxBtD6GiIZOcZG5lio7PiM4g.znLD9iljAq9HiqM0yOiwmNilcIvQUGFvzPr81S5Shegg.JPEG.lrlsco2%2FIMG_6631.JPG&type=sc960_832">';
							var profileInfo = '<table style="float:left; margin-left: 10px;"><tr><td>' + rr.nickName + '</td></tr><tr><td style="color: gray;">' + rr.replyModifyDate + '</td></tr></table>';
							var deleteR = '<div style="float:right;"><button class="buttons deleteReply" type="button"><i class="fa-solid fa-trash-can"></i></button><input type="hidden" value="' + rr.replyId + '" name="replyId"></div>';
							var reportR = '<div style="float:right;"><button class="buttons reportReply" type="button">신고</button><input type="hidden" value="' + rr.replyId + '" name="replyId"></div>';
							var replyContent = '<div class="replyContent"><textarea readonly>' + rr.replyContent +'</textarea></div>';
							var hr = '<hr style="margin-top: 10px; border-color: #4682B4; margin-bottom: 30px;">';
							var replyProfile = '';
							if(rr.replyWriter == '${loginUser.id}'){
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + deleteR + '</div>';
							}else{
								replyProfile = '<div class="replyProfile">' + profileImg + profileInfo + reportR + '</div>';
							}
							$(this).parent().parent().find('.reReply2').append(replyProfile + replyContent + hr);
						}
							console.log("부모찾기");
							console.log($(this).parent().parent());
						
						$(this).parent().find('.reReplyContent').val("");
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			<!-- 답글달기 close -->
			$(document).on('click', '.reReplyButton', function () {
				var collapses = $(this).parent().find('.collapse');
				collapses.collapse('hide');
				$(this).parent().find('.reReply2').html("");
			});
			
			
			<!-- 댓글 삭제 -->
			$(document).on('click', '.deleteReply', function(){
				console.log($(this));
				const ReplyId = $(this).parent().find('input').val();
				console.log(ReplyId);
				$('input[name=realDeleteRepId]').val(ReplyId);
				form.action = '${contextPath}/deleteReply.pa';
				form.submit();
			});
			
			
			if(document.getElementById('participate')){
				document.getElementById('participate').addEventListener('click', function(){
					if('${loginUser.id}' == ''){
						this.setAttribute('disabled', true);
						alert('로그인 후 참여해주세요.');
						location.href='${contextPath}/loginView.me';
					}
				});
			}
			
			
			<!-- 동행 참가 -->
			$(document).on('click', '#participate', function(){
				$.ajax({
					url: '${contextPath}/participate.pa',
					data: {boardId:${p.partyId}, memberId:"${loginUser.id}"},
					success: (data) =>{
						console.log(data);
						document.getElementById('particiNum').innerText = "";
						document.getElementById('particiNum').innerText = data;
						document.getElementById('particiButton').innerHTML = "";
						var noPartyButton = '<button type="button" class="btn btn-primary btn-lg" id="noParticipate">참여취소하기</button>';
						document.getElementById('particiButton').innerHTML += noPartyButton;
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			
			<!-- 동행 참가 취소 -->
			$(document).on('click', '#noParticipate', function(){
				$.ajax({
					url: '${contextPath}/deleteParticipate.pa',
					data: {boardId:${p.partyId}, memberId:"${loginUser.id}"},
					success: (data) =>{
						console.log(data);
						document.getElementById('particiNum').innerText = "";
						document.getElementById('particiNum').innerText = data;
						document.getElementById('particiButton').innerHTML = "";
						var partyButton = '<button type="button" class="btn btn-primary btn-lg" id="participate">동행참여하기</button>';
						document.getElementById('particiButton').innerHTML += partyButton;
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			
			<!-- 모집마감 -->
			if(${p.maxParticipate} == ${partyCount}){
				document.getElementById('particiButton').innerHTML = "";
				var endPartyButton = '<button type="button" class="btn btn-primary btn-lg" id="noParticipate" disabled>모집마감</button>';
				document.getElementById('particiButton').innerHTML += endPartyButton;
			}
			
			<!-- 글신고 모달 -->
			$(document).on('click', '#reportParty', function(){
				if('${loginUser.id}' == ''){
					$(this).attr('disabled', true);
					alert('로그인 후 신고해주세요.');
					location.href='${contextPath}/loginView.me';
				}
				
				$.ajax({
					url: '${contextPath}/checkReport.pa',
					data: {memberId: '${loginUser.id}', targetId: ${p.partyId}, reportClassification: 'B'},
					success: (data) =>{
						console.log(data);
						if(data == 0){
							$('#realReportModal').modal('show');
							
						}else if(data == 1){
							$('#alreadyPaReport').modal('show');
						}
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			<!-- 댓글신고 모달 -->
			$(document).on('click', '.reportReply', function(){
				if('${loginUser.id}' == ''){
					$(this).attr('disabled', true);
					alert('로그인 후 신고해주세요.');
					location.href='${contextPath}/loginView.me';
				}
				
				$('#reportTitle').val("")
				$('#reportContent').val("");
				
				$.ajax({
					url: '${contextPath}/checkReport.pa',
					data: {memberId: '${loginUser.id}', targetId:$(this).parent().find('input').val(), reportClassification: 'R'},
					success: (data) =>{
						console.log(data);
						if(data == 0){
							$('#refReply').val($(this).parent().find('input').val());
							$('#realReportModal').modal('show');
						}else if(data == 1){
							$('#alreadyReReport').modal('show');
						}
					},
					error: (data) =>{
						console.log(data);
					}
				});
			});
			
			<!-- 진짜 신고 -->
			$(document).on('click', '#realReport', function(){
				if($(this).parent().parent().find('#refReply').val() == ''){
					$.ajax({
						url: '${contextPath}/insertReport.pa',
						data: {memberId: '${loginUser.id}', targetId: ${p.partyId}, reportClassification: 'B',
							   reportContent:$('#reportContent').val(), reportTitle:$('#reportTitle').val()},
						success: (data) =>{
							console.log("성공");
							console.log(data);
							if(data == 1){
								$('#realReportModal').modal('hide');
								$('#endReport').modal('show');
							}
						},
						error: (data) =>{
							console.log("실패");
							console.log(data);
						}
					});
				}else{
					$.ajax({
						url: '${contextPath}/insertReport.pa',
						data: {memberId: '${loginUser.id}', targetId:$(this).parent().parent().find('#refReply').val(), reportClassification: 'R',
							   reportContent:$('#reportContent').val(), reportTitle:$('#reportTitle').val()},
						success: (data) =>{
							console.log("성공");
							console.log(data);
							if(data == 1){
								$('#realReportModal').modal('hide');
								$('#endReport').modal('show');
							}
						},
						error: (data) =>{
							console.log("실패");
							console.log(data);
						}
					});
				}
			});
		}
		
	</script>
	
</body>
</html>