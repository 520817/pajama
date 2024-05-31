<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>숙분의 일</title>
<style>
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
    }
    input[type="text"] {
        border: 1.5px rgb(68, 136, 244) solid;
        width: 500px;
        height: 30px;
        border-radius: 5px;
        padding-left: 10px;
    }
    textarea {
        border: 1.5px rgb(68, 136, 244) solid;
        width: 500px;
        height: 400px;
        border-radius: 5px;
        padding-left: 10px;
        padding-top: 10px;
        resize: none;
    }
    .header {
        height: 30px;
    }
    input[type="submit"] {
        width: 100px;
        height: 40px;
        font-size: 15px;
        border: 0;
        outline: 1.5px rgb(68, 136, 244) solid;
        border-radius: 5px;
        padding-left: 10px;
        background-color: rgb(164, 199, 255);
    }
    input[type="submit"]:active {
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
		<form action="Board.jsp" method="post">
		<table> 
		    <tr><td><h2>글쓰기</h2></td></tr>
		    <tr><td class="header">Title</td></tr>
		    <tr><td><input type="text" placeholder="제목을 입력하세요" name="title"></td></tr>
		    <tr><td class="header">Comment</td></tr>
		    <tr><td><textarea placeholder="내용을 입력하세요" name="detail"></textarea></td></tr>
		    <tr><td><input type="submit" value="등록" onclick="alert('작성 완료!')"></td></tr>
		</table>
		</form>
	</div>
</body>
</html>
