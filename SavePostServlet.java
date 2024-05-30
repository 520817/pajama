package com.example.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
// import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

// @WebServlet("/savePost")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
public class SavePostServlet extends HttpServlet {
    private static final String SAVE_DIR = "uploadFiles";
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/webdb?useUnicode=true&characterEncoding=UTF-8";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASS = "1234";  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // JDBC 드라이버 로드
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new ServletException("JDBC 드라이버 로드 실패", e);
        }

        String title = request.getParameter("title");
        String category = request.getParameter("category");
        String people = request.getParameter("people");
        String[] locations = request.getParameterValues("location");
        String content = request.getParameter("content");

        String savePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        String fileName = "";
        for (Part part : request.getParts()) {
            fileName = extractFileName(part);
            if (!fileName.isEmpty()) {
                part.write(savePath + File.separator + fileName);
            }
        }

        String locationsJoined = String.join(", ", locations);

        try (Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASS)) {
            String sql = "INSERT INTO Posts (title, category, people, location, file, content) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, title);
            statement.setString(2, category);
            statement.setInt(3, Integer.parseInt(people));
            statement.setString(4, locationsJoined);
            statement.setString(5, fileName);
            statement.setString(6, content);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("데이터베이스 연결 실패", e);
        }

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Post Saved</h1>");
        out.println("<p>Title: " + title + "</p>");
        out.println("<p>Category: " + category + "</p>");
        out.println("<p>People Needed: " + people + "</p>");
        out.println("<p>Locations: " + locationsJoined + "</p>");
        out.println("<p>Content: " + content + "</p>");
        if (!fileName.isEmpty()) {
            out.println("<p>File Uploaded: " + fileName + "</p>");
        } else {
            out.println("<p>No File Uploaded</p>");
        }
        out.println("</body></html>");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
