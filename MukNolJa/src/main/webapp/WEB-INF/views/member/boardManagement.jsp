<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">

<script src="https://kit.fontawesome.com/203ce9d742.js" crossorigin="anonymous"></script>
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
      a{
      	text-decoration: none;
      	color: black;
      }
      .cate{
      	width: 88px;
      }
      #logout{
      	position: fixed;
      	bottom: 30px;
      	font-size: 12px;
      }
      #report_modal, #reply_modal{
      	display: none;
		width: 350px;
		height: 500px;
		padding: 20px 20px;
		background-color: #fefefe;
		border: 1px solid #888;
		border-radius: 3px;
      }
      #reportContent{
		width: 100%;
		height: 250px;
 		resize: none;
	}
	#replyContent{
		width: 100%;
		height: 300px;
 		resize: none;
	}
	input, textarea{
		text-align: center;
	}
	#replyReportContent{
		display: none;
	}
      .mukButton {transition: all 0.3s; background: #6BB6EC; color:white; height:30px; border-radius: 8px; padding:0px 10px; border: 1px solid #6BB6EC; cursor:pointer;}
	  .mukButton:hover {background: white; color: #6BB6EC; border: 1px solid #6BB6EC;}
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
        <h1 class="h2">게시글 관리</h1>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2 style="display: inline-block;">게시글 목록</h2>
      <div style="float:right; margin: 10px;">
      	<div class="btn-group btn-group-sm" role="group" aria-label="Basic outlined example">
		  <button type="button" class="btn btn-outline-dark cate" id="party">동행</button>
		  <button type="button" class="btn btn-outline-dark cate" id="review">후기</button>
		  <button type="button" class="btn btn-outline-dark cate" id="report">신고</button>
		</div>
      	<form action="boardManagement.me">
      		<div class = "input-group input-group-sm" style="margin-top: 10px;">
      			<input type="hidden" name="category" value="${ category }">
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
            	<c:if test="${ category != 2 }">
	            	<th scope="col">번호</th>
	            	<th scope="col">제목</th>
	            	<th scope="col">작성자</th>
	            	<th scope="col">신고</th>
	            	<th scope="col">작성일</th>
            	</c:if>
            	<c:if test="${ category == 2 }">
            		<th scope="col">번호</th>
            		<th scope="col">제목</th>
	            	<th scope="col">신고자</th>
	            	<th scope="col">분류</th>
	            	<th scope="col">신고일</th>
	            	<th scope="col">처리여부</th>
            	</c:if>
            </tr>
          </thead>
          <tbody>
          	<c:if test="${ category != 2 }">
	          	<c:forEach items="${ bList }" var="b">
		            <tr>
		              <td>${ b.boardId }</td>
		              <td>${ b.boardTitle }</td>
		              <td>${ b.boardWriter }</td>
		              <td>${ b.reportCount }</td>
		              <td>${ b.createDate }</td>
		              <td width="100"><button class="mukButton boardDelete">삭제</button></td>
			          <td width="100"><button class="mukButton boardDetail">상세</button></td>
		            </tr>
	            </c:forEach>
            </c:if>
            <c:if test="${ category == 2 }">
	            <c:forEach items="${ bList }" var="b">
		            <tr>
		              <td>${ b.targetId }</td>
		              <td>${ b.reportTitle }</td>
		              <td>${ b.memberId }</td>
		              <td>${ b.reportClassification }</td>
		              <td>${ b.createDate }</td>
		              <td>${ b.processing }</td>
		              <input type="hidden" value="${ b.reportId }">
		              <input type="hidden" value="${ b.reportContent }">
		              <input type="hidden" value="${ b.reportReply }">
		              <input type="hidden" value="${ b.replyContent }">
			          <td width="100"><button class="mukButton reportDetailBtn">상세</button></td>
		            </tr>
	            </c:forEach>
            </c:if>
          </tbody>
        </table>
      </div>
      <!-- 페이징 -->
			<nav aria-label="Page navigation example">
			  <ul class="pagination d-flex justify-content-center">
			    <li class="page-item">
			    	<c:url var="goBack" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage-1 }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
			    	</c:url>
			      	<a class="page-link" href="${ goBack }" aria-label="Previous">
			        	<span aria-hidden="true"><i class="fa-solid fa-angle-left"></i></span>
			      	</a>
			    </li>
			    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
			    	<c:url var="goNum" value="${ loc }">
			    		<c:param name="page" value="${ p }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
			    	</c:url>
				    <li class="page-item"><a class="page-link num" href="${ goNum }">${ p }</a></li>
			    </c:forEach>
			    <li class="page-item">
			    	<c:url var="goNext" value="${ loc }">
			    		<c:param name="page" value="${ pi.currentPage+1 }"/>
			    		<c:param name="category" value="${ category }"/>
			    		<c:if test="${ search != null }">
			    			<c:param name="search" value="${ search }"/>
			    		</c:if>
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

<div id="report_modal">
	<div class="row">
		<div class="col-8 text-center">
			<label>제목</label><br>
			<input type="text" class="form-control reportDetail" id="reportTitle" readonly>
		</div>
		<div class="col-4 text-center">
			<label>작성자</label><br>
			<input type="text" class="form-control reportDetail" id="reportWriter" readonly>
		</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<label>내용</label><br>
			<textarea class="form-control reportDetail" id="reportContent" readonly></textarea>
		</div>
	</div>
	<div class="row" id="replyReportContent">
		<div class="col text-center">
			<label>댓글 내용</label><br>
			<input type="text" class="form-control reportDetail" readonly>
		</div>
	</div>
	<div class="row text-center" style="margin-top: 20px;">
		<div class="col">
			<button type="button" class="mukButton" id="reportBoardDetail_btn">상세</button>
			<button type="button" class="mukButton" id="reply_btn">답장</button>
			<button type="button" class="mukButton modal_close_btn">닫기</button>
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
			<button type="button" class="mukButton" id="reply_btn2">답장</button>
			<button type="button" class="mukButton modal_close_btn">닫기</button>
		</div>
	</div>
</div>

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
                    	'${ bCount[6].CREATE_DATE }','${ bCount[5].CREATE_DATE }','${ bCount[4].CREATE_DATE }','${ bCount[3].CREATE_DATE }','${ bCount[2].CREATE_DATE }','${ bCount[1].CREATE_DATE }','${ bCount[0].CREATE_DATE }'
                    ],
                    datasets: [
                        { //데이터
                            label: '게시글 작성', //차트 제목
                            fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	'${ bCount[6].COUNT }','${ bCount[5].COUNT }','${ bCount[4].COUNT }','${ bCount[3].COUNT }','${ bCount[2].COUNT }','${ bCount[1].COUNT }','${ bCount[0].COUNT }'
                            ],
                            backgroundColor: [
                                //색상
                                'rgba(107, 182, 236, 0.2)',
                                'rgba(54, 162, 235, 0.2)',
                                'rgba(255, 206, 86, 0.2)',
                                'rgba(75, 192, 192, 0.2)',
                                'rgba(153, 102, 255, 0.2)',
                                'rgba(255, 159, 64, 0.2)'
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(107, 182, 236, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }/* ,
                        {
                            label: 'test2',
                            fill: false,
                            data: [
                                8, 34, 12, 24
                            ],
                            backgroundColor: 'rgb(157, 109, 12)',
                            borderColor: 'rgb(157, 109, 12)'
                        } */
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
            
            document.getElementById('party').addEventListener('click', function(){
				location.href = 'boardManagement.me?category=0';
           	});
           	
           	document.getElementById('review').addEventListener('click', function(){
				location.href = 'boardManagement.me?category=1';
           	});
           	
           	document.getElementById('report').addEventListener('click', function(){
				location.href = 'boardManagement.me?category=2';
           	});
           	
           	const boardDetails = document.getElementsByClassName('boardDetail');
           	for(const boardDetail of boardDetails){
           		boardDetail.addEventListener('click', function(){
	           		const tr = this.parentNode.parentNode;
	           		const id = tr.querySelectorAll('td')[0].innerText;
	           		
	           		location.href = 'reportDetail.me?id=' + id;
           		});
           	}
           	
           	const reportDetailBtns = document.getElementsByClassName('reportDetailBtn');
           	for(const reportDetailBtn of reportDetailBtns){
           		reportDetailBtn.addEventListener('click', function(){
           			const tr = this.parentNode.parentNode;
           			const id = tr.querySelectorAll('input[type="hidden"]')[0].value;
           			const content = tr.querySelectorAll('input[type="hidden"]')[1].value;
           			const reply = tr.querySelectorAll('input[type="hidden"]')[2].value;
           			const replyContent = tr.querySelectorAll('input[type="hidden"]')[3].value;
           			const title = tr.querySelectorAll('td')[1].innerText;
           			const writer = tr.querySelectorAll('td')[2].innerText;
           			const rId = tr.querySelectorAll('td')[0].innerText;
           			const r = document.getElementsByClassName('reportDetail');
           			const type = tr.querySelectorAll('td')[3].innerText;
           			
           			r[0].value = title;
           			r[1].value = writer;
           			r[2].value = content;
           			r[3].value = replyContent;
           			
           			if(type == '댓글'){
           				document.getElementById('replyReportContent').style.display = 'block';
           			} else {
           				document.getElementById('replyReportContent').style.display = 'none';
           			}

           			Modal('report_modal');
           			
           			document.getElementById('reportBoardDetail_btn').addEventListener('click', function(){
    	           		location.href = 'reportDetail.me?id=' + rId + '&type=' + type;
           			});
           			
           			document.getElementById('reply_btn').addEventListener('click', function(){
           				document.getElementById('replyContent').value = reply;
           				Modal('reply_modal');
           				
           				document.getElementById('reply_btn2').addEventListener('click', function(){
           					const replyContent = document.getElementById('replyContent').value;
               				location.href = 'reportReply.me?id=' + id + '&content=' + replyContent;
           				});
           			});
           			
           		});
           	}
           	
           	const processings = document.getElementsByClassName('processing');
           	for(const processing of processings){
           		processing.addEventListener('click', function(){
           			const id = this.parentNode.parentNode.querySelector('input[type="hidden"]').value;
           			location.href = 'processing.me?id=' + id;
           		});
           	}
           	
           	const boardDeletes = document.getElementsByClassName('boardDelete');
           	for(const boardDelete of boardDeletes){
           		boardDelete.addEventListener('click', function(){
           			const tr = this.parentNode.parentNode;
           			const id = tr.querySelectorAll('td')[0].innerText;
           			
           			if(confirm('정말 삭제하시겠습니까?')){
           				if(${ category == 0 }){
           					location.href = 'pBoardDelete.me?id=' + id;
           				} else if(${ category == 1}){
           					location.href = 'rBoardDelete.me?id=' + id;
           				}
           			}
           		})
           	}
        </script>
</body>
</html>