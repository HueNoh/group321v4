<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Profile</title>

<style>
html, body {
	background: #F1F3FA;
	width: 350px;
	height: 250px;
}

/* Profile container */
.profile {
	margin: 20px 0;
}

/* Profile sidebar */
.profile-sidebar {
	padding: 20px 0 10px 0;
	background: #fff;
}

.col-md-3 {
	padding: 0 0 0 15px;
}

.profile-userpic img {
	float: none;
	margin: 0 auto;
	width: 50%;
	height: 50%;
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	border-radius: 50% !important;
}

.profile-usertitle {
	text-align: center;
	margin-top: 20px;
}

.profile-usertitle-name {
	color: #5a7391;
	font-size: 16px;
	font-weight: 600;
	margin-bottom: 7px;
}

.profile-usertitle-job {
	text-transform: uppercase;
	color: #5b9bd1;
	font-size: 12px;
	font-weight: 600;
	margin-bottom: 15px;
}

.profile-usermenu {
	margin-top: 30px;
	padding: 0px !important;
}

.profile-usermenu ul li {
	border-bottom: 1px solid #f0f4f7;
}

.profile-usermenu ul li:last-child {
	border-bottom: none;
}

.profile-usermenu ul li a {
	color: #93a3b5;
	font-size: 14px;
	font-weight: 400;
}

.profile-usermenu ul li a i {
	margin-right: 8px;
	font-size: 14px;
}

.profile-usermenu ul li a:hover {
	background-color: #fafcfd;
	color: #5b9bd1;
}

.profile-usermenu ul li.active {
	border-bottom: none;
}

.profile-usermenu ul li.active a {
	color: #5b9bd1;
	background-color: #f6f9fb;
	border-left: 2px solid #5b9bd1;
	margin-left: -2px;
}

/* order Content */
.order-content {
	padding: 20px;
	background: #F6F9FB;
	width: 100%;
	height: 100%;
	
}

.form_main {
	width: 100%;
}

.form_main h4 {
	font-family: roboto;
	font-size: 20px;
	font-weight: 300;
	margin-bottom: 15px;
	margin-top: 20px;
	text-transform: uppercase;
}

.heading {
	border-bottom: 1px solid #A9A59F;
	padding-bottom: 9px;
	position: relative;
}

.heading span {
	background: #6D6C6A none repeat scroll 0 0;
	bottom: -2px;
	height: 3px;
	left: 0;
	position: absolute;
	width: 75px;
}

.form {
	border-radius: 7px;
	padding: 6px;
}

.txt[type="text"] {
    border: 1px solid #ccc;
    margin: 5px 0;
    padding: 4px 0 4px 5px;
	border-radius:5px;
    width: 50%;
}

.txt[type="tit"] {
	border: 1px solid #ccc;
	margin: 5px 0;
	padding: 4px 0 4px 5px;
	border-radius: 5px;
	width: 20%;
}
/*.txt2[type="submit"] {
    background: #949390 none repeat scroll 0 0;
    border: 1px solid #949390;
    border-radius: 10px;
    color: #fff;
    font-size: 16px;
    font-style: normal;
    line-height: 35px;
    margin: 10px 0;
    padding: 0;
    
    width: 12%;
}*/
.txt2:hover {
	background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
	color: #949390;
	transition: all 0.5s ease 0s;
}
</style>
<script>
	function logout() {
		var result = confirm('로그아웃 하시겠습니까?');

		if (result) { //yes 
			location.replace('/main/logOut');
		}
	}
</script>
</head>
<body>

	<div class="col-md-9 order-content">

		<div class="form_main col-md-4 col-sm-5 col-xs-7">
			<h4 class="heading">
				<strong>PROFILE </strong> <span></span>
			</h4>
			<div class="form">
				<form action="" method="" id="contactFrm" name="contactFrm">
					<input type="tit" value="아이디" class="txt" readonly> <input type="text" value="${id}" class="txt" readonly><br> <input type="tit" value="이름" class="txt" readonly> <input type="text" value="${name}" class="txt" readonly><br> <input type="tit" value="등록일자" class="txt" readonly> <input type="text" value="${regdate}" class="txt" readonly><br>

				</form>
			</div>
		</div>

	</div>


	</div>
	</div>


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="/resources/js/bootstrap.min.js"></script>
</body>
</html>