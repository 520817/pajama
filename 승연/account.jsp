<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css">
<style>
.login-wrapper{
    width: 450px; /* 원하는 너비로 변경 */
    height: 600px; /* 원하는 높이로 변경 */
}
</style>
</head>
<body>
<br><br><br><br><br><br>
	<div align="center">
		<h1 class="blue-font" style="font-size: 50px;">숙분의일</h1>
    <div class="login-wrapper">
        <h2>회원가입</h2>
        <form method="post" action="joinAction.jsp" id="login-form">
           아이디 <input type="text" name="id" style="font-size:17px; width:150px; " placeholder="Email" required>
            <input type="text" name="domain" style="font-size:15px; width:150px;" value="@sookmyung.ac.kr" readonly/>
           비밀번호  <input type="password" name="pw" style="font-size:17px; width:280px;" placeholder="Password" required>
          학번 &nbsp; &nbsp;&nbsp;&nbsp; <input type="text" name="sn" style="font-size:17px; width:280px; " placeholder="Student number" required>
          &nbsp;닉네임 &nbsp;&nbsp;&nbsp; <input type="text" name="nn" style="font-size:17px; width:280px; " placeholder="Nickname" required> 
           
            <input type="submit" style="width:100%;" value="가입하기">
        </form>
    </div></div>
</body>
</html>