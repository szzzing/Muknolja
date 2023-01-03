<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<meta name="theme-color" content="#712cf9">

<title>AdminPage</title>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      .nav-link{
      	color: black;
      }
      tr, th, td{
      	text-align: center;
      }
      #logout{
      	position: fixed;
      	bottom: 30px;
      	font-size: 12px;
      }
      a{
      	text-decoration: none;
      	color: black;
      }
      .mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:30px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	  .mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
	  #notice_modal, #noticeDetail_modal, #noticeModify_modal{
      	display: none;
		width: 450px;
		height: 500px;
		padding: 20px 20px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
      }
      textarea {
      	width: 100%;
		height: 150px;
 		resize: none;
      }
      .cn{
		position: absolute;
		top: 10px;
		right: 10px;
		text-decoration: none;
		color: black;
	  }
    </style>
   
</head>
<body>

<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position-sticky pt-3 sidebar-sticky">
        <ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="adminPage.me">
              <i class="bi bi-house-door"></i>
              <span data-feather="home" class="align-text-bottom"></span>
              방문자 통계
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="memberManagement.me">
              <i class="bi bi-people"></i>
              <span data-feather="file" class="align-text-bottom"></span>
              회원 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="boardManagement.me">
              <i class="bi bi-clipboard-data"></i>
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              게시글 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adManagement.me">
              <i class="bi bi-camera-video"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              광고 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="QA.me">
              <i class="bi bi-question-circle"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              문의 내역
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="notice.me">
              <i class="bi bi-exclamation-octagon"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              공지 관리
            </a>
          </li>
        </ul>
        <a href="${ contextPath }/logout.me" id="logout"><i class="bi bi-box-arrow-right"></i> 로그아웃</a>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">공지 관리</h1>
        <button type="button" class="mukButton" style="margin-right: 30px;" id="writeNotice">공지 작성</button>
      </div>
	  
	  <div style="float:right; margin: 10px;">
      	<form action="notice.me">
      		<div class = "input-group input-group-sm" style="margin-top: 10px;">
	            <input type = "text" class = "form-control" id="search" name="search" placeholder = "제목">
		        <div class = "input-group-btn">
		            <button class="btn btn-outline-secondary" type="submit"><i class="bi bi-search"></i></button>
		  		</div>
     	 	</div>
     	 </form>
      </div>
	  
      <div class="table-responsive" style="clear: both;">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일</th>
              <th scope="col">수정일</th>
            </tr>
          </thead>
          <tbody>
          	
          	<c:forEach items="${ nList }" var="n">
	            <tr>
	              <td>${ n.boardTitle }</td>
	              <td>${ n.boardWriter }</td>
	              <td>${ n.createDate }</td>
	              <td>${ n.modifyDate }</td>
	              <input type="hidden" value="${ n.boardId }">
	              <input type="hidden" value="${ n.boardContent }">
	              <td width="80"><button type="button" class="mukButton noticeDetail">상세</button></td>
	              <td width="80"><button type="button" class="mukButton noticeModify">수정</button></td>
	              <td width="80"><button type="button" class="mukButton noticeDelete">삭제</button></td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>

<div id="notice_modal">
	<div class="container">
		<form action="insertNotice.me" method="post" enctype="multipart/form-data">
			<div class="row">
				<div class="col text-center">
					<label>제목</label><br>
					<input type="text" class="form-control" id="boardTitle" name="boardTitle">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col text-center">
					<label>내용</label><br>
					<textarea class="form-control" id="boardContent" name="boardContent"></textarea>
				</div>
			</div>
			<div class="row text-center" style="margin: 20px 0px;">
				<div class="col">
					<img src="resources/img/noImage.png" class="img-fluid" alt="..." id="noImage">
					<input id="myFile" type="file" accept="image/*" style="display:none;" name="file">
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<button type="submit" class="mukButton" id="qa_btn">작성</button>
					<button type="button" class="mukButton close_btn">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div id="noticeDetail_modal">
	<a class="close_btn cn"><i class="bi bi-x-circle"></i></a>
	<div class="container">
		<div class="row text-center">
			<div class="col"><h1 id="noticeTitleDiv"></h1></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col" id="noticeContentDiv"></div>
		</div>
		<br>
		<div class="row text-center">
			<div class="col">
				<img id="noticeImg" alt="..." src="" style="display:none; max-width: 100%">
			</div>
		</div>
	</div>
</div>

<div id="noticeModify_modal">
	<div class="container">
		<form action="modifyNotice.me" method="post" enctype="multipart/form-data">
			<input type="hidden" id="boardIdM" name="boardId">
			<input type="hidden" id="beforeFileName" name="beforeFileName">
			<input type="hidden" id="beforeFileId" name="beforeFileId">
			<div class="row">
				<div class="col text-center">
					<label>제목</label><br>
					<input type="text" class="form-control" id="boardTitleM" name="boardTitle">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col text-center">
					<label>내용</label><br>
					<textarea class="form-control" id="boardContentM" name="boardContent"></textarea>
				</div>
			</div>
			<div class="row text-center" style="margin: 20px 0px;">
				<div class="col">
					<img src="resources/img/noImage.png" class="img-fluid" alt="..." id="noImageM">
					<input id="myFileM" type="file" accept="image/*" style="display:none;" name="file">
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<button type="submit" class="mukButton" id="qa_btn">작성</button>
					<button type="button" class="mukButton close_btn">닫기</button>
				</div>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	function Modal(id) {
	    var zIndex = 9999;
	    var modal = document.getElementById(id);
	
	    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
	    modal.querySelector('.close_btn').addEventListener('click', function() {
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
	
	document.getElementById('writeNotice').addEventListener('click', function(){
		Modal('notice_modal');
	});
	
	<!-- 첨부파일 -->
    $("#noImage").click(function(){
    	$('#myFile').click();
    });

    const myFile = document.querySelector('#myFile');
    const noImage = document.querySelector('#noImage');
    
	    myFile.addEventListener('change', ()=>{
			const reader = new FileReader();
			reader.onload = function(e){	    		
			noImage.src = e.target.result;
		};
		reader.readAsDataURL(myFile.files[0]);
	});
	    
	$("#noImageM").click(function(){
		$('#myFileM').click();
	});

	const myFileM = document.querySelector('#myFileM');
	const noImageM = document.querySelector('#noImageM');
	    
		myFileM.addEventListener('change', ()=>{
			const reader = new FileReader();
			reader.onload = function(e){	    		
			noImageM.src = e.target.result;
		};
		reader.readAsDataURL(myFileM.files[0]);
	});
	
	    
	const noticeDetails = document.getElementsByClassName('noticeDetail');
	for(const noticeDetail of noticeDetails){
		noticeDetail.addEventListener('click', function(){
			const hiddens = this.parentNode.parentNode.querySelectorAll('input[type="hidden"]');
			const title = this.parentNode.parentNode.querySelector('td').innerText;
			const content = hiddens[1].value;
			const id = hiddens[0].value;
			
			$.ajax({
				url: 'selectNAttm.me',
				data: {id:id},
				success: (data) => {
					document.getElementById('noticeImg').style.display = 'none';
					
					document.getElementById('noticeTitleDiv').innerText = title;
					document.getElementById('noticeContentDiv').innerText = content;
					
					if(data != null){
						console.log(data);
						document.getElementById('noticeImg').src = 'resources/uploadFiles/' + data.fileModifyName;
						document.getElementById('noticeImg').style.display = 'block';
					}
					Modal('noticeDetail_modal');
				},
				error: (data) => {
					console.log(data);
				}
			});
		});
	}
	
	const noticeModifys = document.getElementsByClassName('noticeModify');
	for(const noticeModify of noticeModifys){
		noticeModify.addEventListener('click', function(){
			const hiddens = this.parentNode.parentNode.querySelectorAll('input[type="hidden"]');
			const title = this.parentNode.parentNode.querySelector('td').innerText;
			const content = hiddens[1].value;
			const id = hiddens[0].value;
			
			$.ajax({
				url: 'selectNAttm.me',
				data: {id:id},
				success: (data) => {
					document.getElementById('boardIdM').value = id;
					document.getElementById('boardTitleM').value = title;
					document.getElementById('boardContentM').value = content;
					
					document.getElementById('noImageM').src = 'resources/img/noImage.png';
					document.getElementById('myFileM').value = '';
					
					if(data != null){
						document.getElementById('beforeFileName').value = data.fileModifyName;
						document.getElementById('beforeFileId').value = data.fileId;
						document.getElementById('noImageM').src = 'resources/uploadFiles/' + data.fileModifyName;
					}
					
					Modal('noticeModify_modal');
				},
				error: (data) => {
					console.log(data);
				}
			});
		});
	}
	
	const noticeDeletes = document.getElementsByClassName('noticeDelete');
	for(const noticeDelete of noticeDeletes){
		noticeDelete.addEventListener('click', function(){
			const hiddens = this.parentNode.parentNode.querySelectorAll('input[type="hidden"]');
			const id = hiddens[0].value;
			if(confirm('정말 삭제 하시겠습니까?')){
				location.href = 'deleteNotice.me?id=' + id;
			}
		});
	}
	
</script>
</body>
</html>