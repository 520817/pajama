<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>숙분의 일 - 게시글 작성</title>
    <style>
        a { text-decoration: none; color: blue; }
        a:hover { color: rgb(192, 192, 192); }
        
        .content { padding: 100px 0 20px 0; }
        
        table {
            margin: auto;
        }
        input[type="text"], input[type="number"], select, input[type="file"] {
            border: 1.5px rgb(68, 136, 244) solid;
            width: 500px;
            height: 30px;
            border-radius: 5px;
            padding-left: 10px;
            margin-bottom: 10px;
        }
        textarea {
            border: 1.5px rgb(68, 136, 244) solid;
            width: 500px;
            height: 100px;
            border-radius: 5px;
            padding-left: 10px;
            padding-top: 10px;
            resize: none;
            margin-bottom: 10px;
        }
        .checkbox-group {
            border: 1.5px rgb(68, 136, 244) solid;
            width: 500px;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 10px;
        }
        .checkbox-group label {
            display: block;
            margin-bottom: 5px;
        }
        .header {
            height: 30px;
        }
        input[type="submit"], button {
            width: 100px;
            height: 40px;
            font-size: 15px;
            border: 0;
            outline: 1.5px rgb(68, 136, 244) solid;
            border-radius: 5px;
            padding-left: 10px;
            background-color: rgb(164, 199, 255);
            cursor: pointer;
            margin-top: 10px;
        }
        input[type="submit"]:active, button:active {
            outline: 1.5px rgb(27, 76, 155) solid;
            background-color: rgb(68, 136, 244);
        }

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
			        <a href="listPosts2">식사</a>
			        <ul class="submenu">
			          <li><a href="#">배달</a></li>
			          <li><a href="#">식재료</a></li>
			          <li><a href="#">인스턴트</a></li>
			        </ul>
			      </li>
			      <li>
			        <a href="listPosts">생필품</a>
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
    <div class="content">
        <form action="submitPost" method="post" enctype="multipart/form-data">
            <table>
                <tr><td><h2>글쓰기</h2></td></tr>
                <tr><td class="header">제목</td></tr>
                <tr><td><input type="text" placeholder="제목을 입력하세요" name="title" required></td></tr>
                <tr><td class="header">카테고리</td></tr>
                <tr><td>
                    <select name="category" required>
                        <option value="생필품">생필품</option>
                        <option value="식사">식사</option>
                    </select>
                </td></tr>
                <tr><td class="header">하위 카테고리</td></tr>
                <tr><td>
                    <select name="l_category" required>
                        <option value="생활용품">생활용품</option>
                        <option value="주방용품">주방용품</option>
                        <option value="청소용품">청소용품</option>
                        <option value="나눔">나눔</option>
                        <option value="배달">배달</option>
                        <option value="식재료">식재료</option>
                        <option value="인스턴트">인스턴트</option>
                        
                    </select>
                </td></tr>
                <tr><td class="header">기한</td></tr>
                <tr><td><input type="datetime-local" name="deadline" required></td></tr>
                <tr><td class="header">구하는 인원</td></tr>
                <tr><td><input type="number" placeholder="인원을 입력하세요" name="people" required></td></tr>
                <tr><td class="header">선호장소</td></tr>
                <tr><td>
                    <div class="checkbox-group">
                        <label><input type="checkbox" name="location" value="도서관"> 도서관</label>
                        <label><input type="checkbox" name="location" value="명재관"> 명재관</label>
                        <label><input type="checkbox" name="location" value="정문"> 정문</label>
                        <label><input type="checkbox" name="location" value="명신관"> 명신관</label>
                        <label><input type="checkbox" name="location" value="순헌관"> 순헌관</label>
                        <label><input type="checkbox" name="location" value="학생회관"> 학생회관</label>
                        <label><input type="checkbox" name="location" value="프라임관"> 프라임관</label>
                    </div>
                </td></tr>
                <tr><td class="header">첨부된 파일</td></tr>
                <tr><td><input type="file" name="filename"></td></tr>
                <tr><td class="header">내용</td></tr>
                <tr><td><textarea placeholder="내용을 입력하세요" name="content" required></textarea></td></tr>
                <tr><td><input type="submit" value="등록"></td></tr>
            </table>
        </form>
    </div>
</body>
</html>
