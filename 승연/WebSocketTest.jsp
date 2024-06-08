<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WebSocket Basic</title>
</head>

<body>
	<h1 id = "state"></h1>
	<!-- 버튼이 눌리면 웹 소켓을 통해서 전송하는데  sendmessage함수를 이용한다. -->
	<input id=send type=text><input type="button" value="전송" id="button" onclick=sendmessage()>
	<script>
		//	소켓 연결을 위해 websocket 객체를 만든다.	 서블릿의 형태로 접속을 한다.
		var websocket = new WebSocket("ws://localhost:8081/ws");
		
		//	아래는 웹 소켓에서 사용하는 4가지 이벤트들이다.
		websocket.onopen = function(message){
			document.getElementById("state").innerHTML = "소켓 시작"; 
		}
		websocket.onclose = function(message){}
		websocket.onerror = function(message){}
		//	onmessage는 외부에서 들어온 데이터를 받아서 처리를 하는 이벤트이다.
		websocket.onmessage = function(message){
			document.getElementById("state").innerHTML = message.data; 
		}
		
		function sendmessage()
		{
			//	메시지 박스에 있는 데이터를 전송한다.
			msg = document.getElementById("send").value;
			websocket.send(msg);
		}
	</script>
</body>
</html>