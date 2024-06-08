<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String pw = request.getParameter("pw");

    String dbURL = "jdbc:mysql://localhost:3306/pajama"; // 데이터베이스 URL 
    String dbUser = "root"; // 데이터베이스 사용자명 
    String dbPassword = "4708"; // 데이터베이스 비밀번호 

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

        String sql = "SELECT * FROM login WHERE id=? AND pw=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            String nn = rs.getString("nn"); // 닉네임 가져오기
            String sn = rs.getString("sn");

            // 세션에 id와 nn과 sn 저장
            session.setAttribute("userId", id); // 'id'를 userId로 저장
            session.setAttribute("nickname", nn); // 'nn'을 nickname으로 저장
            session.setAttribute("sn", sn);

            response.sendRedirect("Home.jsp"); //홈 창으로 이동
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
</body>
</html>
