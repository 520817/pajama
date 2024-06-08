<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>숙분의 일</title>
	<meta charset="UTF-8">
	<meta .name="viewport" content="width=device-width, initial-scale=1.0">
	<style type="text/css">
		.title { float: left; margin-left: 50px; font-family: Courier; color:blue;}
	    
	    body {position:relative; min-height: 100%; margin: 0;}
	    
	    .nav { top: 0; left: 0; right: 0; position: pixed;}
        .nav-bar { float: right; }
        .nav-bar > li {float: left; display: inline; margin:10px; font-size: 20px; font-family:Courier; text-shadow: 1px 1px 0px lightgray}
        .nav-me { margin-right: 30px; }
        .nav-home {font-weight: bold;}
        
        a { text-decoration: none; color: blue; }
        a:hover {color:rgb(192, 192, 192)}
        
        .content {padding: 100px 0 20px 0; }
        
	    table {
        margin: auto;
        width: 700px;
        border-radius: 5px;
        border-collapse: collapse;
        border-top: none;
	    }
	    .header {
	        background-color: rgb(218, 231, 255);
	        text-align: center;
	    }
	    .table td, .table th {
	        border-bottom: 1px lightgray solid; 
	        height: 30px;
	        font-size: 14px;
	    }
	    .num {
	        width: 50px;
	    }
	    .posttitle {
	        width: 500px;
	    }
	    .body {
	        text-align: center;
	    }
	    .body .posttitle {
	        text-align: left;
	    }
	    button {
	        width: 100px;
	        height: 40px;
	        font-size: 15px;
	        border: 0;
	        outline: 1.5px rgb(68, 136, 244) solid;
	        border-radius: 5px;
	        padding-left: 10px;
	        background-color: rgb(164, 199, 255);
	    }
	    button:active {
	        width: 100px;
	        height: 40px;
	        font-size: 15px;
	        border: 0;
	        border-radius: 5px;
	        outline: 1.5px rgb(27, 76, 155) solid;
	        padding-left: 10px;
	        background-color: rgb(68, 136, 244);
	    }
	</style>
</head>
<body>
	<div class="nav">
        <h2 class="title">숙분의 일</h2>
        <ul class="nav-bar">
            <li><a class="nav-home" href="#home">홈</a></li>
            <li><a class="nav-fav" href="#favorite">채팅</a></li>
            <li><a class="nav-me" href="#aboutme">마이페이지</a></li>
        </ul>
    </div>
    <div class="content">
    	<table class="table">
	    <tr><td colspan="2"><h2>게시판</h2></td></tr>
	    <tr class="header">
	        <td class="num">번호</td>
	        <td class="posttitle">제목</td>
	        <td class="writer">작성자</td>
	        <td class="postdate">작성날짜</td>
	    </tr>
	    <script>
		        var i, day = 20;
		        for (i = 10; i > 0; i--) {
		            document.write("<tr class='body'>");
		            document.write("<td>" + i +"</td>");
		            document.write("<td class='posttitle'>제목입니다.</td>"); 
		            document.write("<td>작성자</td>"); 
		            document.write("<td>24-01-" + day-- + "</td>");
		            document.write("</tr>");
	        }
	       </script>
		</table>
		<br>
		<table>
	 	   <tr>
	 	       <td><button onclick="location='write.jsp'">글쓰기</button></td>
	    	</tr>
		</table>
    </div>
</body>
</html>