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

<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
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
      #qa_modal, #reply_modal{
		display: none;
		width: 350px;
		height: 450px;
		padding: 20px 20px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
	}
	.mukButton {
		transition: all 0.3s;
		background: #6BB6EC;
		color:white;
		height:30px;
		border-radius: 8px;
		padding:0px 10px;
		border: 1px solid #6BB6EC;
		cursor:pointer;
	}
	 .mukButton:hover{
	 	background: white;
	 	color: #6BB6EC;
	 	border: 1px solid #6BB6EC;
	}
	#qaContent{
		width: 100%;
		height: 250px;
 		resize: none;
	}
	#replyContent{
		width: 100%;
		height: 300px;
 		resize: none;
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
        <h1 class="h2">문의</h1>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>문의 내역</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">문의자</th>
              <th scope="col">제목</th>
              <th scope="col">문의일</th>
              <th scope="col">답변여부</th>
            </tr>
          </thead>
          <tbody>
          	
          	<c:forEach items="${ qList }" var="q">
	            <tr>
	              <td>${ q.qaId }</td>
	              <td>${ q.qaWriter }</td>
	              <td>${ q.qaTitle }</td>
	              <td>${ q.qaCreateDate }</td>
	              <td>${ q.qaYn }</td>
	              <td><button class="mukButton" id="qaDetail">상세</button></td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      
      <nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			    	<c:url var="goBack" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage-1 }"/>
			    	</c:url>
			      	<a class="page-link" href="${ goBack }" aria-label="Previous">
			        	<span aria-hidden="true"><i class="fa-solid fa-angle-left"></i></span>
			      	</a>
			    </li>
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    	</c:url>
				    <li class="page-item"><a class="page-link num" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage+1 }"/>
			    	</c:url>
				    <a class="page-link" href="${ goNext }" aria-label="Next">
				    	<span aria-hidden="true"><i class="fa-solid fa-angle-right"></i></span>
				    </a>
			    </li>
			  </ul>
			</nav>
    </main>
  </div>
</div>

<div id="qa_modal">
	<div class="row">
		<div class="col text-center">
			<label>제목</label><br>
			<input type="text" class="form-control" id="qaTitle" readonly>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col text-center">
			<label>내용</label><br>
			<textarea class="form-control" id="qaContent" readonly></textarea>
		</div>
	</div>
	<div class="row text-center" style="margin-top: 20px;">
		<div class="col">
			<button type="button" class="mukButton" id="qa_btn">답장</button>
			<button type="button" class="mukButton" id="close_btn">닫기</button>
		</div>
	</div>
</div>

<div id="reply_modal">
	<div class="row">
		<div class="col text-center">
			<label>답장</label><br>
			<textarea class="form-control" id="replyContent"></textarea>
		</div>
	</div>
	<div class="row text-center" style="margin-top: 20px;">
		<div class="col">
			<button type="button" class="mukButton" id="reply_btn">답장</button>
			<button type="button" class="mukButton" id="close_btn">닫기</button>
		</div>
	</div>
</div>
<input type="hidden">

<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script>
<script type="text/javascript">

            var context = document
                .getElementById('myChart')
                .getContext('2d');
            var myChart = new Chart(context, {
                type: 'line', // 차트의 형태
                data: { // 차트에 들어갈 데이터
                    labels: [
                        //x 축
                    	'${ qCountList[6].QA_DATE }','${ qCountList[5].QA_DATE }','${ qCountList[4].QA_DATE }','${ qCountList[3].QA_DATE }','${ qCountList[2].QA_DATE }','${ qCountList[1].QA_DATE }','${ qCountList[0].QA_DATE }'
                    ],
                    datasets: [
                        { //데이터
                            label: '문의', //차트 제목
                            fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	'${ qCountList[6].COUNT }','${ qCountList[5].COUNT }','${ qCountList[4].COUNT }','${ qCountList[3].COUNT }','${ qCountList[2].COUNT }','${ qCountList[1].COUNT }','${ qCountList[0].COUNT }'
                            	],
                            // 색상
                            backgroundColor: 'rgba(107, 182, 236, 0.2)',
                            // 경계선 색상
                            borderColor: 'rgba(107, 182, 236, 1)',
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    beginAtZero: true
                                }
                            }
                        ]
                    }
                }
            });
            
            const pageItems = document.getElementsByClassName('num');
            pageItems['${pi.currentPage}'-1].style.backgroundColor = 'lightgray';
            
            function Modal(id) {
    	        var zIndex = 9999;
    	        var modal = document.getElementById(id);
    	
    	        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    	        modal.querySelector('#close_btn').addEventListener('click', function() {
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
    	    
    	    document.getElementById('qaDetail').addEventListener('click', function(){
    	    	const id = this.parentNode.parentNode.querySelector('td').innerText;
    	    	
    	    	$.ajax({
    	    		url: 'selectQA.me',
    	    		data: {id:id},
    	    		success: (data) => {
    	    			document.getElementById('qaTitle').value = data.qaTitle;
    	    			document.getElementById('qaContent').value = data.qaContent;
    	    			
    	    			const hidden = document.querySelector('input[type="hidden"]');
    	    			
    	    			hidden.value = data.qaId;
    	    			
    	    			Modal('qa_modal');
    	    		},
    	    		error: (data) => {
    	    			console.log(data);
    	    		}
    	    		
    	    	});
    	    	console.log(id);
    	    });
    	    
    	    document.getElementById('qa_btn').addEventListener('click', function(){
    	    	Modal('reply_modal');
    	    	
    	    	document.getElementById('reply_btn').addEventListener('click', function(){
    	    		const hidden = document.querySelectorAll('input[type="hidden"]');
    	    		const qaId = hidden[0].value;
    	    		const qaReplyContent = document.getElementById('replyContent').value;
    	    		
    	    		$.ajax({
    	    			url: 'qaReply.me',
    	    			data: {qaId:qaId, qaReplyContent:qaReplyContent},
    	    			success: (data) => {
    	    				document.getElementById('reply_modal').style.display = 'none';
    	    				document.getElementById('qa_modal').style.display = 'none';
    	    				alert('문의 답장 완료');
    	    			}
    	    		});
    	    	});
    	    });
        </script>
</body>
</html>