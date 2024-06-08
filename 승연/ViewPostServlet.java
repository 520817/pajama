package com.example;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class ViewPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postId = request.getParameter("id");
        Post post = getPostById(postId);
        
        if (post != null) {
            request.setAttribute("post", post);
            RequestDispatcher dispatcher = request.getRequestDispatcher("postView.jsp");
            dispatcher.forward(request, response);
        } else {
            response.sendRedirect("listPosts.jsp");
        }
    }

    private Post getPostById(String postId) {
        // Fetch the post from the database
        Post post = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/pajama", "root", "4708");
            String sql = "SELECT * FROM posts WHERE id = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, postId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                post = new Post();
                post.setId(resultSet.getInt("id"));
                post.setTitle(resultSet.getString("title"));
                post.setUserId(resultSet.getString("user_id"));
                post.setContent(resultSet.getString("content"));
                post.setCategory(resultSet.getString("category"));
                post.setLCategory(resultSet.getString("l_category"));
                post.setNumPeople(resultSet.getInt("people"));
                post.setLocation(resultSet.getString("location"));
                post.setDeadline(resultSet.getTimestamp("deadline"));
                post.setImageUrl(resultSet.getString("filename"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (resultSet != null) resultSet.close();
                if (preparedStatement != null) preparedStatement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return post;
    }
}