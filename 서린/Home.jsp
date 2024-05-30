<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String) session.getAttribute("id");
	String nn = (String) session.getAttribute("nn");
	String sn = (String) session.getAttribute("sn");
	
	if (nn == null || sn == null) {
        nn = "로그인이 필요합니다.";
        sn = "";
    }
	
%>
<!DOCTYPE html>
<html>
<head>
<title>숙분의 일</title>
<meta charset="UTF-8">
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
		
		.section {
			width: 100%;
			height: 70px;
			background-color: #076AD5;
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
		
		.login ul {
			display: flex;
		}
		
		.login ul li {
			margin-right: 30px;
			font-size: 16px;
		}
		
		.login a {
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
		  background-color: #076AD5;
		}
		
		.menu a {
		  color: #fff;
		}
		
		.submenu > li {
		  
		  line-height: 50px;
		  background-color: #076AD5;
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
  
		.sidebar {
			width:270px; 
			height:1000px; 
			float:left; 
			margin:100px 30px 30px 100px;
		}
		
		.pic { 
			height: 150px; 
			width: 150px; 
			margin: 25px auto; 
			border-radius: 50%; 
			display: block; 
		}
        .profile {
        	height: 320px; 
        	text-align: center; 
        	font-family: Courier;
        	border: 2px black solid;
        	border-radius: 5px;
        }
        .profile > h3 {
        	font-family: Courier; 
        	font-size:20px; 
        	font-weight: bold;
        }
        .profile > p {
        	font-family: Courier; 
        	font-weight: bold; 
        	margin:5px; 
        }
		
        .content {padding: 20px 0 20px 0; }
        .page {margin-bottom: 30px;}

        table {
        margin: 20px 100px 0 400px;
        width: 700px;
        border-radius: 5px;
        border-collapse: collapse;
        border-top: none;
	    }
	    
	    .header {
	        text-align: center;
	    }
	    .table td, .table tr {
	        border-bottom: 1px lightgray solid; 
	        height: 30px;
	        font-size: 14px;
	    }
	    
	    .posttitle {
	        width: 550px;
	    }
	    
	    .body {
		    text-align: center;
		}
		.body .posttitle {
		    text-align: left;
		}

    </style>

</head>

<body>
    <div class="head">
    	<div class="section">
    		<div class="title">
				<a href="Home.jsp"><h1>숙분의 일</h1></a>
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
		    <div class="login">
		    	<ul>
		    	<% 
		    	if(id == null) {%>
		    		<li><a href="login.jsp">로그인</a></li>
		    		<li><a href="#">채팅</a></li> 
		    		<%} else { %>
		    		<li><a href="logout.jsp">로그아웃</a></li>
		    		<li><a href="#">채팅</a></li> 
		    		<%} %>
		    	</ul>
		    </div>
	    </div>
    </div>
    
    <!-- 프로필 -->
	<div class="sidebar">
	     <div class="profile">
	        <img style="border-radius: 50%;" src="<%=request.getContextPath()%>/image/login.png" width="170" height="170" alt="눈송이"/>
	        <h2><%= nn %></h2>
	       	<p><%= sn %></p> 

	     </div>
	</div>
	
    <div class="content">
        <div class="page">
        	<div class="con1">
        		<table class="table">
				    <tr><td colspan="2"><h2>공지사항</h2></td></tr>
				    <tr class="header">		     
				        <td class="posttitle">제목</td>
				        <td class="writer">작성자</td>
				        <td class="postdate">작성날짜</td>
				    </tr>
				    <script>
					        var i, day = 20;
					        for (i = 2; i > 0; i--) {
					            document.write("<tr class='body'>");
					            document.write("<td class='posttitle'>제목입니다.</td>"); 
					            document.write("<td>작성자</td>"); 
					            document.write("<td>24.01." + day-- + "</td>");
					            document.write("</tr>");
				        }
				     </script>
				</table>
        	</div>
        	<div class="con2">
        		<table class="table">
				    <tr><td colspan="2" class="category"><h2>식사</h2></td></tr>
				    <tr class="header">
				        <td class="posttitle">제목</td>
				        <td class="writer">작성자</td>
				        <td class="postdate">작성날짜</td>
				    </tr>
				    <script>
					        var i, day = 20;
					        for (i = 5; i > 0; i--) {
					            document.write("<tr class='body'>");
					            document.write("<td class='posttitle'>제목입니다.</td>"); 
					            document.write("<td>작성자</td>"); 
					            document.write("<td>24.01." + day-- + "</td>");
					            document.write("</tr>");
				        }
				     </script>
				</table>
        	</div>
        	<div class="con3">
        		<table class="table">
				    <tr><td colspan="2"><h2>생필품</h2></td></tr>
				    <tr class="header">		     
				        <td class="posttitle">제목</td>
				        <td class="writer">작성자</td>
				        <td class="postdate">작성날짜</td>
				    </tr>
				    <script>
					        var i, day = 20;
					        for (i = 5; i > 0; i--) {
					            document.write("<tr class='body'>");
					            document.write("<td class='posttitle'>제목입니다.</td>"); 
					            document.write("<td>작성자</td>"); 
					            document.write("<td>24.01." + day-- + "</td>");
					            document.write("</tr>");
				        }
				     </script>
				</table>
        	</div>
        </div>
     </div>
</body>
</html>