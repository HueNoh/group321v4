<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>login</title>


<link rel="stylesheet" href="/resources/css/login.css">
<style>
</style>
<script>
	var err = '000';
	window.onload = function() {
		err = '${err}';
		if ('001' == err) {
			var isOk = confirm('접속중인 아이디입니다. 접속하시겠습니까?');
			if(isOk){
				$('#logCho').val('001');
				
				console.log($('#logCho'));
				/* $('#log').submit(); */
			}
		} else if ('002' == err) {
			var createAText = document.createTextNode('로그인에 실패하였습니다.');
			$('#err').append(createAText);
		}
	};
</script>

</head>
<body>

	<div class="box">
		<form action="/login" id="log" method="post">

			<h1>project321</h1>
			<input type="hidden" name="logCho" value="000">
			<input type="text" name="id" placeholder="아이디" onFocus="field_focus(this, 'email');" onblur="field_blur(this, 'email');" class="email" /> <input type="password" name="pw" placeholder="비밀번호" onFocus="field_focus(this, 'email');" onblur="field_blur(this, 'email');" class="email" /> <a href="login" onclick="document.getElementById('log').submit();"><div class="btn">로그인</div></a>
			<!-- End Btn -->

		</form>

		<form action="/insertForm" id="ins" method="post">

			<a href="ins" onclick="document.getElementById('ins').submit();"><div id="btn2">회원가입</div></a>
			<!-- End Btn2 -->

		</form>

	</div>
	<!-- End Box -->




	<div id="err"></div>
	<!--  <p>비밀번호를 잊어먹으셨나요? <u style="color:#f1c40f;">Click Here!</u></p>-->


	<script src="/resources/js/login1.js" type="text/javascript"></script>
	<script src="/resources/js/login2.js"></script>

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>



	<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
	<script src="/resources/js/login3.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>