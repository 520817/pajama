<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
 		request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        String dbURL = "jdbc:mysql://localhost:3306/pajama"; // 데이터베이스 URL 
        String dbUser = "root"; // 데이터베이스 사용자명 
        String dbPassword = ""; // 데이터베이스 비밀번호 
        
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "SELECT * FROM pajama.login WHERE id=? AND pw=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            rs = pstmt.executeQuery();

            if (rs.next()) {
            	String nn = rs.getString("nn");
                String sn = rs.getString("sn");

                // 세션에 id와 nn과 sn 저장
                session.setAttribute("id", id);
                session.setAttribute("nn", nn);
                session.setAttribute("sn", sn);
                
            	response.sendRedirect("Home.jsp"); //홈 창으로 가게끔 할거임
            } else {
            	response.sendRedirect("login.jsp?error=1");
                
            }
        } catch (Exception e) {
            e.printStackTrace(); //예외를 출력하는 메서드
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>

</body>
</html>