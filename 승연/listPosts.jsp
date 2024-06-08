<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Post" %>
<%
	String id = (String) session.getAttribute("userId");
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        background-color: #076AD5;
        font-size: 18px;
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
        background-color: #076AD5;
        transition-duration: 0.5s;
    }
    
    .menu > li:hover .submenu {
        height: 100%; /*서브메뉴 li한개의 높이 50*5*/
        transition-duration: 1s;
    }
    
    .content {
        padding: 100px 0 20px 0;
    }
    
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
        cursor: pointer;
    }
    button:active {
        outline: 1.5px rgb(27, 76, 155) solid;
        background-color: rgb(68, 136, 244);
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
  <div class="content">
        <table class="table">
            <tr><td colspan="4"><h2>생필품 숙분의 일</h2></td></tr>
            <tr class="header">
                <td class="num">번호</td>
                <td class="posttitle">제목</td>
                <td class="writer">작성자</td>
                <td class="postdate">마감기한</td>
            </tr>
 			<%
 			 if(id!=null){
    @SuppressWarnings("unchecked")
    List<Post> posts = (List<Post>) request.getAttribute("posts");
    if (posts != null && !posts.isEmpty()) {
        int index = posts.size();
        for (int i = posts.size() - 1; i >= 0; i--) {
            Post post = posts.get(i);
%>

<tr class="body">
    <td><%= index-- %></td>
                <td><a href="postView?id=<%= post.getId() %>" style="color:black"><%= post.getTitle() %></a></td>
                <td><%= post.getUserId() %></td>
                <td><%= post.getDeadline() %></td>

            </tr>
      		<%
                    }
                } else {
            %>
            <tr>
                <td colspan="4">게시물이 없습니다.</td>
            </tr>
            <%
                }} else {%> <td colspan="4">로그인이 필요합니다.</td>
                
                <td></td>
                <td></td>
            <% }
            %>


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