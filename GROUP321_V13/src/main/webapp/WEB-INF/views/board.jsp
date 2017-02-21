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
.board_name{
	overflow: hidden;
	word-break: break-all;
}
.boardDelBtn {
	display: block;
	position: absolute;
	right: 5px;
	top: 5px;
}
</style>
<script>
	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	}

	var sessionId = '${sessionScope.id}';
	var createDiv = '';
	var webSocket = new WebSocket('ws://211.183.8.20/board');
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
		console.log(access);

		if ("boardCreate" == access) {
			if (id != sessionId) {
				createDiv += msg;
				$('#' + id).html(createDiv);
			}
		} else if ("dupLog" == access) {
			console.log('dup1');
			if (msg == '${sessionScope.ip}') {
				$.ajax({
					url : '/main/dupLog',
					method : 'post',
					dataType : 'json'
										
				}).done(function(msg){
					alert(msg);
					location.href = '/';
				});
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
		console.log('efsef: ' + message);
		var msg = {
			"userId" : id,
			"msg" : message,
			"access" : acc,
			"create" : 'board'
		}

		if ("boardCreate" == acc) {
			var jsonStr = JSON.stringify(msg);
			webSocket.send(jsonStr);
		}else if ("dupLog" == acc) {
			var jsonStr = JSON.stringify(msg);
			webSocket.send(jsonStr);
		}
	}
	window.onload = function() {
		console.log('${sessionScope.ip}');
		var err = '${err}';
		if ('001' == err) {
			var dupLogIp = '${dupLogIp}';
			send(dupLogIp, 'dupLog', '${sessionScope.id}');

		}

		$.ajax({
			url : '/main/searchBoard',
			method : 'post',
		}).done(
				function(msg) {
					var jArr = JSON.parse(msg);
					$.each(jArr, function(i) {
						var b_num = jArr[i].b_num;
						var div = document.createElement('div');
						var text = '';
						div.id = 'board' + b_num;
						div.className = 'board';

						var aTag = document.createElement('a');
						var createAText = document.createTextNode(jArr[i].title
								+ '_' + b_num);
						
						aTag.className = 'board_name';

						aTag.setAttribute('href', '/main/list?b_num=' + b_num);
						aTag.appendChild(createAText);
						div.appendChild(aTag);

						//hs
						var aTagDelBtn = document.createElement('a');
						aTagDelBtn.className = 'boardDelBtn';
						var aTagDelBtnText = document.createTextNode('x');
						aTagDelBtn.appendChild(aTagDelBtnText);
						//aTagDelBtn.setAttribute('href', '/main/deleteBoard?b_num=' + b_num);
						aTagDelBtn.setAttribute('href', '#');
						aTagDelBtn.setAttribute('onclick', 'deleteBoard('
								+ b_num + ');');
						div.appendChild(aTagDelBtn);

						document.getElementById('viewBoard').appendChild(div);

					});

				});

	};

	function addBoard(title) {
		$.ajax({
			method : 'post',
			url : '/main/createBoard',
			data : {
				id : '${sessionScope.id}',
				title : title
			}

		}).done(
				function(msg) {

					var arrBoard = JSON.parse(msg);

					var div = document.createElement('div');
					div.id = 'board' + arrBoard.b_num;
					div.className = 'board';

					var aTag = document.createElement('a');
					var createAText = document.createTextNode(arrBoard.title
							+ '_' + arrBoard.b_num);
					
					aTag.className = 'board_name';

					aTag.setAttribute('href', '/main/list?b_num='
							+ arrBoard.b_num);
					aTag.appendChild(createAText);
					div.appendChild(aTag);
					
					document.getElementById('createBoard').appendChild(div);

					var boardHtml = $('#board' + arrBoard.b_num)[0].outerHTML;
					send(boardHtml, 'boardCreate', 'createBoard');

				});
	};

	//hs
	$(function() {
		$('#CBContainer').css('display', 'none');

		$('#addBoard').click(function() {
			$('#CBContainer').toggle();
			$('#CBTitle').focus();
			$('#CBTitle').val('');
		});
//70 35
		$('#CBSubmit').click(function() {
			var boardTitle = $('#CBTitle').val();
			var lengthOfBoardTitle = byteCalc(boardTitle);
			console.log('boardLength: '+lengthOfBoardTitle);
			if(lengthOfBoardTitle > 70) {
				alert('보드 이름은 영문 70자, 한글 35자를 넘을 수 없습니다');
				$('#CBTitle').val('');
			} else {
				if ($('#CBTitle').val()) {
					addBoard($('#CBTitle').val());
				}
			}
		});

	});

	function deleteBoard(b_num) {
		var result = confirm('보드를 삭제 하시겠습니까?'); 
		
		if(result) {
			$.ajax({
				method : 'post',
				url : '/main/deleteBoard',
				data : {
					b_num : b_num
				}
			}).done(function(msg) {
				//alert(msg);
				var tmp = '#board' + b_num;
	
				if (msg == 0) {
					$(tmp).remove();
				}
			});
		}
	};
	
	function byteCalc(str) // str은 inputbox에 입력된 문자열이고,lengths는 제한할 문자수 이다.
	{
	      var len = 0;
// 	      var newStr = '';
	  
	      for (var i=0;i<str.length; i++) 
	      {
	        var n = str.charCodeAt(i); // charCodeAt : String개체에서 지정한 인덱스에 있는 문자의 unicode값을 나타내는 수를 리턴한다.
	        // 값의 범위는 0과 65535사이이여 첫 128 unicode값은 ascii문자set과 일치한다.지정한 인덱스에 문자가 없다면 NaN을 리턴한다.
	        
	       var nv = str.charAt(i); // charAt : string 개체로부터 지정한 위치에 있는 문자를 꺼낸다.
	        

	        if ((n>= 0)&&(n<256)) len ++; // ASCII 문자코드 set.
	        else len += 2; // 한글이면 2byte로 계산한다.
	        
// 	        if (len>lengths) break; // 제한 문자수를 넘길경우.
// 	        else newStr = newStr + nv;
	      }
	      return len;
	}
	
</script>
</head>
<body>
	<!-- 상단바 -->
	<header id="header" class="clearfix">
		<a href="/main/board"><h1>PROJECT 321</h1></a> <a href="#" class="btn_board"><span>Boards</span></a>
		<form action="#" method="post" id="sch_main_wrap">
			<fieldset>
				<input type="text" name="sch_main" id="sch_main">
			</fieldset>
			<a href="#"><span class="btn_ico_sch"></span></a>
		</form>
	</header>
	<!-- 타이틀바 -->
	<div class="title-bar">
		<span class="title-main">Board</span>
	</div>
	<!-- 보드 -->
	<div id="content">
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