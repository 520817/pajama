//목록페이지 홈으로 연결

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Post" %>
<%
    String id = (String) session.getAttribute("userId");
    String nn = (String) session.getAttribute("nickname");
    String sn = (String) session.getAttribute("sn");

    if (nn == null || sn == null) {
        nn = "로그인이 필요합니다.";
        sn = "";
    }

    // Database connection settings
    String jdbcURL = "jdbc:mysql://localhost:3306/board_db00";
    String jdbcUsername = "root";
    String jdbcPassword = "1234";
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    List<Post> mealPosts = new ArrayList<>();
    List<Post> dailyPosts = new ArrayList<>();

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        // Fetch meal posts
        String mealSql = "SELECT id, user_id, title, deadline FROM posts WHERE category='식사' ORDER BY deadline ASC LIMIT 3";
        stmt = conn.createStatement();
        rs = stmt.executeQuery(mealSql);
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getInt("id"));
            post.setUserId(rs.getString("user_id"));
            post.setTitle(rs.getString("title"));
            post.setDeadline(rs.getTimestamp("deadline"));
            mealPosts.add(post);
        }
        rs.close();

        // Fetch daily posts
        String dailySql = "SELECT id, user_id, title, deadline FROM posts WHERE category='생필품' ORDER BY deadline ASC LIMIT 3";
        rs = stmt.executeQuery(dailySql);
        while (rs.next()) {
            Post post = new Post();
            post.setId(rs.getInt("id"));
            post.setUserId(rs.getString("user_id"));
            post.setTitle(rs.getString("title"));
            post.setDeadline(rs.getTimestamp("deadline"));
            dailyPosts.add(post);
        }
        rs.close();
        stmt.close();
        conn.close();
    } catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
        System.out.println("Database connection or query failed: " + e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
        if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
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
                        <td class="postdate">마감기한</td>
                    </tr>
                    <% if (mealPosts != null) { %>
                        <% for (Post post : mealPosts) { %>
                            <tr class="body">
                                <td class="posttitle"><a href="postView?id=<%= post.getId() %>"><%= post.getTitle() %></a></td>
                                <td><%= post.getUserId() %></td>
                                <td><%= post.getDeadline() %></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr class="body">
                            <td colspan="3">No posts available</td>
                        </tr>
                    <% } %>
                </table>
            </div>
            <div class="con3">
                <table class="table">
                    <tr><td colspan="2"><h2>생필품</h2></td></tr>
                    <tr class="header">             
                        <td class="posttitle">제목</td>
                        <td class="writer">작성자</td>
                        <td class="postdate">마감기한</td>
                    </tr>
                    <% if (dailyPosts != null) { %>
                        <% for (Post post : dailyPosts) { %>
                            <tr class="body">
                                <td class="posttitle"><a href="postView?id=<%= post.getId() %>"><%= post.getTitle() %></a></td>
                                <td><%= post.getUserId() %></td>
                                <td><%= post.getDeadline() %></td>
                            </tr>
                        <% } %>
                    <% } else { %>
                        <tr class="body">
                            <td colspan="3">No posts available</td>
                        </tr>
                    <% } %>
                </table>
            </div>
        </div>
     </div>
</body>
</html>
