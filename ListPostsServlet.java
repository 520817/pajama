package com.example.web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// @WebServlet("/listPosts") 
public class ListPostsServlet extends HttpServlet {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=UTF-8";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "1234";  // 설정한 MySQL 루트 비밀번호

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        List<Post> posts = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS);
            String sql = "SELECT * FROM Posts";
            PreparedStatement statement = conn.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String category = rs.getString("category");
                int people = rs.getInt("people");
                String location = rs.getString("location");
                String file = rs.getString("file");
                String content = rs.getString("content");

                Post post = new Post(id, title, category, people, location, file, content);
                posts.add(post);
            }
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new ServletException("데이터베이스 조회 실패", e);
        }

        request.setAttribute("posts", posts);
        request.getRequestDispatcher("/listPosts.jsp").forward(request, response);
    }
}
