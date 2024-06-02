package com.example;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/listPosts2")
public class ListPostsServlet2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Post> posts = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/board_db", "root", "1234");

            String sql = "SELECT id, user_id, title, category, l_category, deadline, people, location, filename, content, created_at FROM posts WHERE category='식사'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setUserId(rs.getString("user_id"));
                post.setTitle(rs.getString("title"));
                post.setCategory(rs.getString("category"));
                post.setLCategory(rs.getString("l_category"));
                post.setDeadline(rs.getDate("deadline"));
                post.setPeople(rs.getInt("people"));
                post.setLocations(rs.getString("location"));
                post.setFilename(rs.getString("filename"));
                post.setContent(rs.getString("content"));
                post.setCreatedAt(rs.getTimestamp("created_at"));
                posts.add(post);
                System.out.println("Post added: " + post.getTitle());

            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("posts", posts);
        System.out.println("Posts size: " + posts.size());
        request.getRequestDispatcher("/listPosts2.jsp").forward(request, response);
    }
}
