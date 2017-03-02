<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>Board</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="/resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<style>
.board {
	position: relative;
}

.board:hover {
	background: #006071;
}

.board_name, .boardTitle {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	word-break: break-all;
}

.boardDelBtn {
	display: block;
	position: absolute;
	right: 5px;
	top: 5px;
}

.heading {
	border-bottom: 3px solid #749ab1;
	padding-bottom: 9px;
	position: relative;
}

.heading span {
	background: #104e73 none repeat scroll 0 0;
	bottom: -3px;
	height: 8px;
	left: 0;
	position: absolute;
	width: 100px;
}

strong {
	font-size: medium;
	color: white;
	font-weight: bold;
}
</style>
<script>
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	}

	var sessionId = '${sessionScope.id}';
	var createDiv = '';
	var webSocket = new WebSocket('ws://211.183.8.14/board');
	webSocket.onopen = function(event) {
		onOpen(event)

	};
	webSocket.onclose = function() {
		onClose()
	};
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)

	};
	function onMessage(event) {
		var spMsg = event.data;
		var arrMsg = spMsg.split("::");
		var id = arrMsg[0];
		var msg = arrMsg[1];
		var access = arrMsg[2];

		if ("boardCreate" == access) {
			if (id != sessionId) {
				createDiv += msg;
				$('#' + id).html(createDiv);
			}
		}
	}
	function onOpen(event) {

	}
	function onError(event) {
		alert(event.data);
	}

	function onClose() {

	}

	function send(message, acc, id) {
		var msg = {
			"userId" : id,
			"msg" : message,
			"access" : acc,
			"create" : 'board'
		}

		if ("boardCreate" == acc) {
			var jsonStr = JSON.stringify(msg);
			webSocket.send(jsonStr);
		}
	}
	window.onload = function() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {
			
			myBoard();
			$.ajax({
				url : '/main/searchBoard',
				method : 'post'
			}).done(function(msg) {
				sessionChk();
				var jArr = JSON.parse(msg);
				$.each(jArr, function(i) {
					searchBoard(jArr[i].b_num, jArr[i].title, 'board',
							'viewBoard');
				});
	
			});
		}
	};

	function addBoard(title) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {
			
			$.ajax({
				method : 'post',
				url : '/main/createBoard',
				data : {
					id : '${sessionScope.id}',
					title : title
				}
	
			}).done(function(msg) {
				console.log(msg);
				var arrBoard = JSON.parse(msg);
	
				var div = document.createElement('div');
				div.id = 'board' + arrBoard.b_num;
				div.className = 'board';
	
				var boardTitle = document.createElement('div');
				boardTitle.className = "boardTitle";
	
				var aTag = document.createElement('a');
				var createAText = document.createTextNode(title);
	
				aTag.setAttribute('href', '/main/list?b_num=' + arrBoard.b_num);
				aTag.appendChild(createAText);
	
				boardTitle.appendChild(aTag);
	
				div.appendChild(boardTitle);
	
				document.getElementById('createBoard').appendChild(div);
				document.getElementById('myBoard').appendChild(div);
	
				var boardHtml = $('#board' + arrBoard.b_num)[0].outerHTML;
				send(boardHtml, 'boardCreate', 'createBoard');
	
			});
		}
	}

	//hs
	$(function() {
		$('#CBContainer').css('display', 'none');

		$('#addBoard').click(function() {
			if (sessionChk()) {
				alert('로그아웃되었습니다.');
				location.href = '/';
			} else {
				
				$('#CBContainer').toggle();
				$('#CBTitle').focus();
				$('#CBTitle').val('');
			}
		});
		//70 35
		$('#CBSubmit').click(function() {
			if (sessionChk()) {
				alert('로그아웃되었습니다.');
				location.href = '/';
			} else {
				
				var boardTitle = $('#CBTitle').val();
				var lengthOfBoardTitle = byteCalc(boardTitle);
				console.log('boardLength: ' + lengthOfBoardTitle);
				if (lengthOfBoardTitle > 70) {
					alert('보드 이름은 영문 70자, 한글 35자를 넘을 수 없습니다');
					$('#CBTitle').val('');
				} else {
					sessionChk();
					if ($('#CBTitle').val()) {
						addBoard($('#CBTitle').val());
					}
				}
			}
		});

	});

	function deleteBoard(b_num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {
				
			var result = confirm('보드를 삭제 하시겠습니까?');
	
			if (result) {
			
				alert('삭제로직.');
				 $.ajax({
					method : 'post',
					url : '/main/deleteBoard',
					data : {
						b_num : b_num
					}
				}).done(function(msg) {
	
					console.log(msg);
	
					if (msg == 0) {
						$('#board' + b_num).remove();
						$('#myBoard' + b_num).remove();
					}
				});
				
			}else{
				if(sessionChk()){
					alert('로그아웃되었습니다.');
					location.href='/';
				}
			}
		}
	}
	

	function byteCalc(str) // str은 inputbox에 입력된 문자열이고,lengths는 제한할 문자수 이다.
	{
		var len = 0;
		// 	      var newStr = '';

		for (var i = 0; i < str.length; i++) {
			var n = str.charCodeAt(i); // charCodeAt : String개체에서 지정한 인덱스에 있는 문자의 unicode값을 나타내는 수를 리턴한다.
			// 값의 범위는 0과 65535사이이여 첫 128 unicode값은 ascii문자set과 일치한다.지정한 인덱스에 문자가 없다면 NaN을 리턴한다.

			var nv = str.charAt(i); // charAt : string 개체로부터 지정한 위치에 있는 문자를 꺼낸다.

			if ((n >= 0) && (n < 256))
				len++; // ASCII 문자코드 set.
			else
				len += 2; // 한글이면 2byte로 계산한다.

			// 	        if (len>lengths) break; // 제한 문자수를 넘길경우.
			// 	        else newStr = newStr + nv;
		}
		return len;
	}

	function sessionChk() {
		var result = false;
		$.ajax({
			url : '/main/sessionChk'
			,method : 'post'
			,async: false
		}).done(function(msg) {
			console.log('sessionChk : '+msg);
			if ('1' == msg) {
				result = true;
			}
		});
		return result;
	}

	function logout() {
		var result = confirm('로그아웃 하시겠습니까?');

		if (result) { //yes 
			location.replace('/main/logOut');
		}
	}

	function profile(id) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {
			
			window.open('profile?profileId=' + id, '',
					'width=400, height=300, left=500, top=300');
		}
	}
	function myBoard() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {
			
			$.ajax({
				url : '/main/myBoard',
				method : 'post',
				data : {
					m_id : '${sessionScope.id}'
				}
	
			}).done(function(msg) {
				var jArr = JSON.parse(msg);
				console.log(jArr);

				$.each(jArr, function(i) {
					searchBoard(jArr[i].b_num, jArr[i].title, 'myBoard',
							'myBoard');
				});
			});
		}
	}

	function searchBoard(b_num, title, divId, parentDiv) {
		var div = document.createElement('div');
		var text = '';
		div.id = divId + b_num;
		div.className = 'board';

		var boardTitle = document.createElement('div');
		boardTitle.className = 'boardTitle';

		var aTag = document.createElement('a');
		var createAText = document.createTextNode(title);

		aTag.setAttribute('href', '/main/list?b_num=' + b_num);
		aTag.appendChild(createAText);

		boardTitle.appendChild(aTag);
		div.appendChild(boardTitle);

		//hs
		var aTagDelBtn = document.createElement('a');
		aTagDelBtn.className = 'boardDelBtn';
		var aTagDelBtnText = document.createTextNode('x');
		aTagDelBtn.appendChild(aTagDelBtnText);
		//aTagDelBtn.setAttribute('href', '/main/deleteBoard?b_num=' + b_num);
		aTagDelBtn.setAttribute('href', '#');
		aTagDelBtn.setAttribute('onclick', 'deleteBoard(' + b_num + ');');
		div.appendChild(aTagDelBtn);

		document.getElementById(parentDiv).appendChild(div);

	}

	/* $('#id').text(id); */
</script>
</head>
<body>
	<!-- 상단바 -->
	<header id="header" class="clearfix">
		<a href="/main/board"><h1>PROJECT 321</h1></a> <a href="#" onclick="profile('${id}')" class="btn_board"><span>${id}</span></a> <a href="#" onclick="logout()" class="btn_logout"><span>LOGOUT</span></a>
	</header>

	<div id="myBoard">
		<h4 class="heading">
			<strong> 참여 중 프로젝트 </strong> <span></span>
		</h4>
	</div>
	<div id="allBoard">
		<h4 class="heading">
			<strong> 전체 프로젝트 </strong> <span></span>
		</h4>

		<div id="viewBoard"></div>
		<div id="createBoard"></div>
		<div id="addBoard">
			<div>Create</div>
			<div id="CBContainer">
				<textarea id="CBTitle" style="width: 95%;" wrap="hard"></textarea>
				<button id="CBSubmit">SAVE</button>
			</div>
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
</body>
</html>