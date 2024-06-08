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
        String id = request.getParameter("id") + "@sookmyung.ac.kr";
        String pw = request.getParameter("pw");
        String sn = request.getParameter("sn");
        String nn = request.getParameter("nn");
        
        

        String dbURL = "jdbc:mysql://localhost:3306/"; // 데이터베이스 URL 
        String dbUser = "root"; // 데이터베이스 사용자명 
        String dbPassword = "4708"; // 데이터베이스 비밀번호 

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql = "INSERT INTO pajama.login (id, pw, sn, nn) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, pw);
            pstmt.setString(3, sn);
            pstmt.setString(4, nn);
            pstmt.executeUpdate();
%>
            <script>
			alert("회원가입에 성공하셨습니다.");
			window.location.href = 'login.jsp';
		</script>
		<%
      
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error closing Connection: " + e.getMessage());
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error closing Connection: " + e.getMessage());
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("Error closing Connection: " + e.getMessage());
                }
            } 
        }
    %>
</body>
</html>