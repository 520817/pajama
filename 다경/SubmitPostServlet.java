package com.example;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

//@WebServlet("/submitPost")
@MultipartConfig
public class SubmitPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        
        //폼 데이터 수신
        String userId = request.getParameter("user_id");
        //로그인 연동 시 삭제
        if (userId == null || userId.isEmpty()) {
            userId = "anonymous"; // 기본값 설정
        }
       
        System.out.println("User ID: " + userId);
       
        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String l_category = request.getParameter("l_category");
        String deadline = request.getParameter("deadline");
        int people = Integer.parseInt(request.getParameter("people"));
        String[] locationsArray = request.getParameterValues("location");
        String location = (locationsArray != null) ? String.join(",", locationsArray) : "";
        Part filePart = request.getPart("filename");
        String content = request.getParameter("content");
        
        //파일 업로드 처리
        String uploadDir = "C:\\upload\\";
        File uploadDirectory = new File(uploadDir);
        if (!uploadDirectory.exists()) {
            if (uploadDirectory.mkdirs()) {
                System.out.println("Upload directory created: " + uploadDir);
            } else {
                System.out.println("Failed to create upload directory: " + uploadDir);
                response.getWriter().write("Failed to create upload directory.");
                return;
            }
        }

        String fileName = null;
        if (filePart != null && filePart.getSize() > 0) {
            fileName = filePart.getSubmittedFileName();
            filePart.write(uploadDir + fileName);
        }

        String url = "jdbc:mysql://localhost:3306/board_db00";
        String username = "root";
        String password = "1234";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO posts (user_id, title, category, l_category, deadline, people, location, filename, content) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, userId);
            stmt.setString(2, title);
            stmt.setString(3, category);
            stmt.setString(4, l_category);
            stmt.setString(5, deadline);
            stmt.setInt(6, people);
            stmt.setString(7, location);
            stmt.setString(8, fileName);
            stmt.setString(9, content);
            
            

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("A new post was inserted successfully!");
            }

            stmt.close();
            conn.close();

            // 카테고리에 따라 적절한 페이지로 리디렉션
            if (category.equals("생필품")) {
                response.sendRedirect("listPosts");
            } else if (category.equals("식사")) {
                response.sendRedirect("listPosts2");
            } else {
                response.getWriter().write("Invalid category specified.");
            }


        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
