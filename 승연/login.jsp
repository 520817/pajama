<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>로그인</title>
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
      <h1 class="blue-font" style="font-size: 50px;">숙분의일</h1><br>
      <img style="border-radius: 50%;" src="<%=request.getContextPath()%>/login.png" width="200" height="200" alt="눈송이"/>
      
      
    <div class="login-wrapper">
        <h2>Login</h2>
        <form method="post" action="loginAction.jsp" id="login-form">
            <input type="text" name="id" style="font-size:17px;" placeholder="Email" required>
            <input type="password" name="pw" style="font-size:17px;" placeholder="Password" required>
            <label for="remember-check">
                <input type="checkbox" id="remember-check"> 아이디 저장
            </label> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="account.jsp" style="color: #999999; text-decoration: none;">회원가입</a>
            
            <input type="submit" value="로그인">
            
<%
    String error = request.getParameter("error");
    if (error != null && error.equals("1")) {
%>
    <div class="error-message">
    <script>
               alert("로그인이 실패했습니다. 아이디와 비밀번호를 확인하세요.");
            </script></div>
<%
    }
%>
        </form>
       </div>
    </div>
</body>
</html>