<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>글 작성하기</title>
</head>
<body>
    <h1>숙분의 일</h1>
    <form action="savePost" method="post" enctype="multipart/form-data">
        <label for="title">제목:</label>
        <input type="text" id="title" name="title" required><br><br>
        
        <label for="category">카테고리:</label>
        <select id="category" name="category" required>
            <option value="생필품">생필품</option>
            <option value="배달음식">배달음식</option>
        </select><br><br>
        
        <label for="people">구하는 인원:</label>
        <input type="number" id="people" name="people" required><br><br>
        
        <label for="location">선호장소:</label><br>
        <input type="checkbox" name="location" value="도서관"> 도서관<br>
        <input type="checkbox" name="location" value="명재관"> 명재관<br>
        <input type="checkbox" name="location" value="정문"> 정문<br>
        <input type="checkbox" name="location" value="명신관"> 명신관<br>
        <input type="checkbox" name="location" value="순헌관"> 순헌관<br>
        <input type="checkbox" name="location" value="학생회관"> 학생회관<br>
        <input type="checkbox" name="location" value="프라임관"> 프라임관<br><br>
        
        <label for="file">첨부파일:</label>
        <input type="file" id="file" name="file"><br><br>
        
        <label for="content">내용:</label><br>
        <textarea id="content" name="content" rows="10" cols="30" required></textarea><br><br>
        
        <input type="submit" value="저장하기">
    </form>
</body>
</html>
