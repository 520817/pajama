package com.example;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class SubmitPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        String nickname = (String) session.getAttribute("nickname");

        if (nickname == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        System.out.println("Nickname: " + nickname);

        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String l_category = request.getParameter("l_category");
        String deadlineStr = request.getParameter("deadline");
        int people = Integer.parseInt(request.getParameter("people"));
        String[] locationsArray = request.getParameterValues("location");
        String location = (locationsArray != null) ? String.join(",", locationsArray) : "";
        Part filePart = request.getPart("filename");
        String content = request.getParameter("content");

        // deadline 파싱
        LocalDateTime deadline = LocalDateTime.parse(deadlineStr, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
        Timestamp deadlineTimestamp = Timestamp.valueOf(deadline);

        // 파일 업로드 처리
        String uploadDir = getServletContext().getRealPath("/") + "upload/";
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

        String url = "jdbc:mysql://localhost:3306/pajama";
        String username = "root";
        String password = "4708";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO posts (user_id, title, category, l_category, deadline, people, location, filename, content) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nickname); // 닉네임을 user_id로 저장
            stmt.setString(2, title);
            stmt.setString(3, category);
            stmt.setString(4, l_category);
            stmt.setTimestamp(5, deadlineTimestamp);
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