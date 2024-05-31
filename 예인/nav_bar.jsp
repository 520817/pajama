<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙분의 일</title>
<style>
	* {
        	text-decoration: none;
        	list-style: none;
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
			background-color: #5778ff;
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
		
		a{font-size:14px}
		
		.menu {
			  overflow: hidden;
		}

		.menu > li {
		  width: 20%; /*20*5=100%*/
		  float: left;
		  text-align: center;
		  line-height: 40px;
		  background-color: #5778ff;
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
</body>
</html>
