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
            <a class="nav-link" href="adStats.me">
              <i class="bi bi-bar-chart-line"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              광고 통계
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="adManagement.me">
              <i class="bi bi-camera-video"></i>
              <span data-feather="users" class="align-text-bottom"></span>
              광고 관리
            </a>
          </li>
        </ul>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">방문자 통계</h1>
      </div>

      <canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>

      <h2>방문 멤버</h2>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr>
              <th scope="col">아이디</th>
              <th scope="col">닉네임</th>
              <th scope="col">이름</th>
              <th scope="col">전화번호</th>
              <th scope="col">가입일</th>
            </tr>
          </thead>
          <tbody>
          	
          	<c:forEach items="${ today }" var="m">
	            <tr>
	              <td>${ m.id }</td>
	              <td>${ m.nickName }</td>
	              <td>${ m.name }</td>
	              <td>${ m.phone }</td>
	              <td>${ m.enrollDate }</td>
	            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </main>
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
                    	'${ visitList[6].VISIT_DATE }','${ visitList[5].VISIT_DATE }','${ visitList[4].VISIT_DATE }','${ visitList[3].VISIT_DATE }','${ visitList[2].VISIT_DATE }','${ visitList[1].VISIT_DATE }','${ visitList[0].VISIT_DATE }'
                    ],
                    datasets: [
                        { //데이터
                            label: '방문 멤버', //차트 제목
                            fill: true, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                            data: [
                            	'${ visitList[6].VISIT_COUNT }','${ visitList[5].VISIT_COUNT }','${ visitList[4].VISIT_COUNT }','${ visitList[3].VISIT_COUNT }','${ visitList[2].VISIT_COUNT }','${ visitList[1].VISIT_COUNT }','${ visitList[0].VISIT_COUNT }'
                            ],
                            // 색상
                            backgroundColor: 'rgba(255, 0, 255, 0.2)',
                            // 경계선 색상
                            borderColor: 'rgba(255, 0, 255, 1)',
                            borderWidth: 1 //경계선 굵기
                        },
                        {
                            label: '방문자',
                            fill: true,
                            data: [
                            	'${ vsitAllList[6].VISIT_COUNT }','${ vsitAllList[5].VISIT_COUNT }','${ vsitAllList[4].VISIT_COUNT }','${ vsitAllList[3].VISIT_COUNT }','${ vsitAllList[2].VISIT_COUNT }','${ vsitAllList[1].VISIT_COUNT }','${ vsitAllList[0].VISIT_COUNT }'
                            ],
                            backgroundColor: 'rgba(107, 182, 236, 0.2)',
                            borderColor: 'rgba(107, 182, 236, 1)',
                            borderWidth: 1
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
        </script>
</body>
</html>