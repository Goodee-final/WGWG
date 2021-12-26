<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅화면</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	/* 웹 소켓 객체 생성 및 이벤트 처리 */
	/* 역스크롤 검색하기 */
	/* autoscroll을 역방향으로 해야 최신의 메시지가 맨 밑에 뜸 */

	var ws = null; //웹소켓 객체
	var url = null;		//웹소켓 주소
	var nick = null;	// 웹소켓 대화명
	
	$(document).ready(function(){
		console.log("웹소켓 작동 화면 시작");
		$("#nickName").focus();		//처음화면시 대화명을 입력 받기 위함
		
		$("#join_room").bind("click", function(){
			console.log("대화 입장버튼 클릭");
			if($("#nickName").val() == ""){
				alert("닉네임을 입력해주세요.");
				$("#nickName").focus();
				return;		// propagation을 동작시켜 하위에 있는 websocket 생성 기능을 실행하지 못하도록 함
			}
			
			// 1) 대화창에서 사용할 닉네임을 가져옴 -> serverSide에 전송이 되면 Map {webSocketSession : nickName}이 들어감
			nick = $("#nickName").val();
			console.log("1. 채팅에서 사용할 닉네임 : ", nick);
			
			// 2) 화면을 처리 : 닉넥임 입력 화면을 hide 시키고, 글 입력 화면을 block 처리, 입력창으로 focus 이동
			$("#receive_msg").html("");
			$("#chat_div").show();
			$("#chat").focus();
			console.log("2. 화면 변경 ");
			
			// 3) javascript WebSocket 객체를 생성하고 Spring path(/wsChat.do)를 호출하여 객체를 전달함
			// handshake 걸기
			// MySocketHandler의 afterConnectionEstablished -> ArrayList<WebSocketSession> 에 참여자를 담아줌
			/* ws = new WebSocket("ws://192.168.7.69:8096/20211215_Spring_Chatting/wsChat.do"); */
			ws = new WebSocket("ws://192.168.0.9:8096/20211203_WGWG/wsChat.do");
			console.log("생성된 웹소켓 객체 : ", typeof ws);
			
			// 4) 웹소켓을 open해줌 => 참여 nickName을 서버로 전송
			ws.onopen = function(){
				console.log("웹소켓 객체 open");
				ws.send("#$nick_"+nick);
			}
			
			// 5) server로부터 broadcast된 메시지를 받아서 화면 창에 출력해줌
			ws.onmessage = function(event){
				$("#receive_msg").append(event.data+"<br>");
			}
			
			// 6) client가 websocket을 닫아 서버에 afterConnectionClosed를 호출
			// session이 종료될 때 사용
			ws.onclose = function(){
				alert("서버와 연결이 종료되었습니다.");
			}
			
		});
		
		$("#chat_btn").bind("click", function(){
			console.log("대화내용 전달");
			if($("#chat").val() == ""){
				alert("대화내용을 입력해주세요.");
				return;		// propagation
			}else{
				ws.send("["+nick+"]"+$("#chat").val());
				$("#chat").val('');
				$("#chat").focus();
			}
		});
		
	});
	//닫기 버튼
	function disconnection(){
		ws.close();
		// 내 객체가 null이 됨
		// 서버가 null되는 거 아님
		ws = null;
		window.close();
	}
</script>
</head>
<body>

	<button onclick="disconnection()">연결종료</button>
	<table border="1">
		<tr>
			<td width="500px" height="500px" align="center">
				<div id="receive_msg" style="border: 1px solid skyblue;">
					<!-- onkeypress : 키가 눌러졌을 때 작동(채팅내용치고 엔터 누를때) -->
					<input type="text" id="nickName"
						style="width: 200px; height: 30px;"
						onkeypress="if(event.keyCode == 13)$('#join_room').click();">
					<input type="button" value="대화입장" id="join_room">
				</div>
			</td>
		</tr>
	</table>

	<hr>
	<div id="chat_div" style="display: none;">
		<input type="text" id="chat" style="width: 500px;"
			onkeypress="if(event.keyCode == 13)$('#chat_btn').click();">
		<input type="button" id="chat_btn" value="대화전송">
	</div>

</body>
</html>