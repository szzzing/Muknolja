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
    @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
  		*{font-family: 'Noto Sans KR', sans-serif;}
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
      #cate>.nav-item{
      	margin: 0px 30px;
      	font-size: 20px;
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
        </ul>
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">광고 관리</h1>
      </div>

      <div class="cotainer">
      	<div class="row" style="margin: 20px 0px;">
      		<nav class="navbar navbar-expand-lg bg-light">
			  <div class="container-fluid ">
			    <div class="collapse navbar-collapse justify-content-center" id="navbarNavDropdown">
			      <ul class="navbar-nav" id="cate">
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">메인</a>
			        </li>
			        <li class="nav-item dropdown">
			          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			            여행
			          </a>
			          <ul class="dropdown-menu">
			            <li><a class="dropdown-item" href="#">관광지</a></li>
			            <li><a class="dropdown-item" href="#">맛집</a></li>
			            <li><a class="dropdown-item" href="#">축제</a></li>
			          </ul>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">호텔</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">동행</a>
			        </li>
			        <li class="nav-item">
			          <a class="nav-link active" aria-current="page" href="#">후기</a>
			        </li>
			      </ul>
			    </div>
			  </div>
			</nav>
      	</div>
      	<div class="row">
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
	            <tr>
	              <td>1</td>
	              <td>2</td>
	              <td>3</td>
	              <td>4</td>
	              <td>5</td>
	            </tr>
          </tbody>
        </table>
      </div>
      	</div>
      </div>
      
    </main>
  </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>