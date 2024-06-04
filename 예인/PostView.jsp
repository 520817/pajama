<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙분의 일</title>
<style>
		@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
		
		* {
        	text-decoration: none;
        	list-style: none;
        	font-family: "Jua", sans-serif;
        }
		
		body {
			margin:0;
		}
		
		.head {
			width: 100%;
			height: 100%;
			position: relative;
		}
		
		/* 상단바 */
		.section {
			width: 100%;
			height: 70px;
			background-color: #004fff;
			margin : 0;
			position: relative;
			display: flex;
			justify-content: space-between;
		}
		
		.title {
			font-size: 50px;
			margin-left: 30px;
		}
		
		.title a {
			color: white;
			font-size: 14px;
		}
		
		.nav > ul > li {
			width: 100px;
			margin: 0 15px;
			text-align: center;
			
		}
		
		.mypage ul {
			display: flex;
		}
		
		.mypage ul li {
			margin-right: 30px;
			font-size: 16px;
		}
		
		.mypage a {
			color: lightgray;
		}
		
		.menu {
			  overflow: hidden;
		}

		.menu > li {
		  width: 20%; /*20*5=100%*/
		  float: left;
		  text-align: center;
		  line-height: 40px;
		  background-color: #004fff;
		  font-size: 18px;
		}
		
		.menu a {
		  color: #fff;
		}
		
		.submenu > li {
		  
		  line-height: 50px;
		  background-color: #94a9ff;
		}
		
		.submenu {
		  height: 0; /*ul의 높이를 안보이게 처리*/
		  overflow: hidden;
		  padding: 0;
		}
		
		.menu > li:hover {
		  background-color: #94a9ff;
		  transition-duration: 0.5s;
		}
		
		.menu > li:hover .submenu {
		  height: 100%; /*서브메뉴 li한개의 높이 50*5*/
		  transition-duration: 1s;}
		  
		.image, .info, .text {
			display: block;
		}
		.profile {
			display:flex;
		}
		.detail {
			background-color: #E6E6E6;
			border-radius: 5px;
			padding : 
		}
		.detail > h5 {
			margin : 0;
			padding : 5px 10px;
		}
		.image {
			margin: 10px auto;
			text-align : center;
		}
		.image > img {
			height: 300px;
		}
		.post {
			width: 50%;
			margin: 30px auto;
		}
		
		.pic { 
			height: 50px; 
			width: 50px; 
			margin: 0 auto; 
			border-radius: 50%; 
			flex:1;
		}
		.nickname {
			margin-left: 10px;
			flex: 18;
		}
		.chatdiv {
			text-align : center;
			margin-bottom : 20px;
		}
		.chat {
			width:120px;
			height: 40px;
			color:#fff;
			background: #004fff;
			font-size: 16px;
			border:none;
			border-radius: 20px;
			box-shadow: 0 4px 16px rgba(0,79,255,0.3);
			transition:0.3s;
		}
		.chat:hover{
			background: rgba(0,79,255,0.9);
			cursor: pointer;
			box-shadow: 0 2px 4px rgba(0,79,255,0.6);
		}
</style>
</head>
<body>
	<div class="head">
    	<div class="section">
    		<div class="title">
				<a href="#"><h1>숙분의 일</h1></a>
			</div>
    	
			<div class="nav">
		        <ul class="menu">
			      <li>
			        <a href="#">공지/신고</a>
			        <ul class="submenu">
			          <li><a href="#">공지사항</a></li>
			          <li><a href="#">신고</a></li>
			        </ul>
			      </li>
			      <li>
			        <a href="#">식사</a>
			        <ul class="submenu">
			          <li><a href="#">배달</a></li>
			          <li><a href="#">식재료</a></li>
			          <li><a href="#">인스턴트</a></li>
			        </ul>
			      </li>
			      <li>
			        <a href="#">생필품</a>
			        <ul class="submenu">
			          <li><a href="#">생활용품</a></li>
			          <li><a href="#">주방용품</a></li>
			          <li><a href="#">청소용품</a></li>
			          <li><a href="#">나눔</a></li>
			        </ul>
			      </li>			      
			    </ul>
		    </div>
		    <div class="mypage">
		    	<ul>
		    		<li><a href="#">채팅</a></li>
		    		<li><a href="#">로그인</a></li>
		    	</ul>
		    </div>
	    </div>
    </div>
    
    <div class="post">
    	<div class="profile">
    		<div><img class="pic" src="profile.jpg"></div>
    		<div class="nickname"><p>눈송이</p></div>
    	</div>
    	<hr>
    	<div class="info">
    		<h2 class="posttitle">섬유유연제 같이 시키실 분</h2>
    		<div class="detail">
    			<h5 class="category">카테고리 생활/세탁</h5>
	    		<h5 class="numpeople">인원 3명</h5>
	    		<h5 class="location">선호장소 명신관</h5>
    		</div>
    	</div>
    	<div class="image">
    		<img src="downy.jpg">
    	</div>
    	<div class="text">
    		<p>안녕하세요<br>
    		다우니 섬유유연제 나누어 사실 분 구합니다<br>
    		향은 아무거나 상관없어요~
    		</p>
    	</div>
    	<div class="chatdiv">
    		<button class="chat">채팅 보내기</button>
    	</div>
    	<hr>
    </div>
</body>
</html>