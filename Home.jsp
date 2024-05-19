<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>숙분의 일</title>
<meta charset="UTF-8">
<style>
        .title { float: left; margin-left: 50px; font-family: Courier; color:blue;}

        body {position:relative; min-height: 100%; margin: 0;}

        .nav { top: 0; left: 0; right: 0; position: fixed;}
        .nav-bar { float: right; }
        .nav-bar > li {float: left; display: inline; margin:10px; font-size: 20px; font-family:Courier; text-shadow: 1px 1px 0px lightgray}
        .nav-me { margin-right: 30px; }
        .nav-home {font-weight: bold;}

        a { text-decoration: none; color: blue; }
        a:hover {color:rgb(192, 192, 192)}

        .content {padding: 100px 0 20px 0; }
        .page {margin-bottom: 30px;}

        #p_home {padding: 30px 70px 70px 70px;}
        .pic { height: 150px; width: 150px; margin: 25px auto; border-radius: 50%; display: block; }
        .profile {height: 100%; text-align: center; font-family: Courier;}
        .profile > h3 {font-family: Courier; font-size:20px; font-weight: bold;}
        .profile > p {font-family: Courier; font-weight: bold; margin:5px; }
        .homemenu {width:100px; height:100px; margin:20px; border: 2px solid rgb(219, 219, 219); border-radius: 30px; display:inline-block;}
        .homemenu:hover {box-shadow: 0 0 20px gray;}

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
        <div class="page">
                <div id="p_home">
                    <div class="profile">
                        <img class="pic" src="profile.jpg">
                        <h3>240024</h3>
                        <p>눈송이</p>
                        <button onclick="location='Board.jsp'" class="homemenu">식사</button>
                        <button onclick="location='Board.jsp'" class="homemenu">생필품</button>
                        <button onclick="location='Board.jsp'" class="homemenu">신고해요</button>
                        <!--<div class="homemenu">식사</div>
                        <div class="homemenu">생필품</div>
                        <div class="homemenu">신고해요</div>-->
                    </div>
                </div>
            </div>     
        </div>
</body>
</html>