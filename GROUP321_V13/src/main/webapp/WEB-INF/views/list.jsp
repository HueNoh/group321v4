<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>List</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<script src="/resources/js/jquery-3.1.1.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/resources/js/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" href="/resources/css/slidebars.css">
<link rel="stylesheet" href="/resources/css/slidebars.atj.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/websocket.atj.css">
<!-- <link rel="stylesheet" href="/resources/css/jquery-ui.css"> -->
<style>
a:hover, #addList>div {
	cursor: pointer
}

.history {
	color: #555;
	font-weight: bold;
}

#selectHistory {
	padding: 1.5em;
}

body::-webkit-scrollbar-track {
	background-color: #257db1;
	border-radius: 5px;
}

body::-webkit-scrollbar {
	width: 6px;
	background-color: #257db1;
	border-radius: 5px;
}

body::-webkit-scrollbar-thumb {
	background-color: #193b50;
	border-radius: 5px;
	height: 5px;
}

.list::-webkit-scrollbar-track {
	background-color: #dfdfdf;
}

.list::-webkit-scrollbar {
	width: 6px;
	background-color: #dfdfdf;
}

.list::-webkit-scrollbar-thumb {
	background-color: #828181;
	border-radius: 5px;
	height: 5px;
}

.listBorder, .addListBorder {
	width: 250px;
	height: 100%;
	margin: 5px;
	float: left;
}

#addList {
	width: 250px;
	height: 35px;
	float: left;
	background-color: #006aa8;
	margin: 10px 5px;
}

#addList:hover {
	background: #064569;
	border-radius: 5px;
}

#addListText {
	color: #ccc;
	margin-right: 10px;
	font-size: medium;
}

#CBContainer {
	width: 250px;
	float: left;
	background-color: #e2e4e6;
	margin: 10px 5px;
	border-radius: 5px;
}

.viewList {
	width: 250px;
	float: left;
}

#cardReply {
	margin-top: 10px;
	max-height: 150px;
	width: 100%;
	overflow-y: auto;
	max-height: 150px;
}

#cardReply::-webkit-scrollbar-track {
	background-color: #fff;
}

#cardReply::-webkit-scrollbar {
	width: 6px;
	background-color: #fff;
}

#cardReply::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
	border-radius: 5px;
	height: 5px;
}

.list {
	width: 100%;
	min-height: 10px;
	float: left;
	overflow-y: auto;
}

.list::scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.1);
	background-color: #F5F5F5;
	border-radius: 10px;
}

.list-card:hover {
	background: #969696;
	cursor: pointer;
}

.addCard>a:hover {
	cursor: pointer;
}

.viewList .list_foot, .viewList .addCard, .viewList, .list_header {
	width: 100%;
}

#nal {
	overflow-y: auto;
}

.up_list_title {
	display: none;
}

.up_title_input, .up_list_title {
	float: left;
}

.list_title, .up_list_title {
	margin-top: 5px;
	margin-left: 10px;
	margin-right: 20px;
	word-break: break-all;
	overflow: hidden;
	border-radius: 5px;
}

.list_title:hover {
	background: #969696;
	border-radius: 5px;
}

#mainList {
	float: left;
}

.content {
	overflow: hidden;
}

#content, #mainList, .content {
	height: 100%;
	background-color: #257db1;
}

.g3-container {
	overflow-x: auto;
}

#content {
	height: 100%;
	padding-top: 100px;
}

.content_div {
	border: 1px;
}

.content_textarea {
	width: 600px;
	height: 70px;
	border-radius: 5px;
	border: 2px solid #888;
	box-shadow: 2px 2px 6px -2px lightslategrey;
}

.card-detail-main {
	height: 700px;
	width: 65%;
	float: left;
}

#filter {
	background-color: #448cb7;
}

.card-detail-main>h1 {
	font-size: 50px;
	font-weight: bold;
}

.card-detail-main>h3 {
	font-size: 20px;
	font-weight: bold;
}

.card-detail-main>a:hover {
	text-decoration: underline;
	font-weight: bold;
}

.card-detail-sidebar {
	height: 600px;
	margin-top: 100px;
	float: right;
	margin-right: 10px;
}

.card-detail-sidebar>button {
	text-align: left;
	width: 200px;
	height: 40px;
	font-weight: bold;
	font-size: 20px;
	background-color: white;
	border-radius: 10px 10px;
	outline: 0;
}

.card-detail-sidebar>button>span {
	margin-left: 10px;
	margin-bottom: 3px;
	color: black;
}

.cardView {
	overflow: hidden;
}

.btn-label {
	margin-right: 15px;
	margin-bottom: 5px;
}

.btn-attachment {
	margin-right: 15px;
	margin-bottom: 4px;
}

.btn-delete {
	margin-right: 15px;
	margin-bottom: 4px;
}

.submenu_hidden {
	display: none;
}

.label_name {
	height: 40px;
	margin-top: 10px;
	display: block;
}

.submenu {
	position: relative;
	width: 230px;
	float: right;
	margin-top: 20px;
	border: 1px solid lightgray;
	box-shadow: 0px 0px 3px 3px lightslategrey;
	border-radius: 5px;
	background-color: white;
}

.submenu>li {
	margin: 0 7px 0 7px;
	border-radius: 5px;
	margin-bottom: 5px;
	width: 188px;
	height: 30px;
	cursor: pointer;
	display: inline-block;
}

.submenu>li>span {
	font-size: 15px;
	margin-top: 5px;
	font-weight: bold;
	color: black;
	z-index: 3;
	display: inline-block;
}

.submenu:first-child {
	text-align: center;
}
/* id=label_name */
#label_name {
	border-radius: 5px;
	margin-bottom: 5px;
	width: 188px;
	height: 30px;
	margin-right: 23px;
}

.btn_label_setting {
	margin-bottom: 5px;
	width: 16px;
	height: 16px;
}

.labels {
	width: 100px;
	margin-top: 10px;
}

#label1 {
	background-color: #CD3861;
}

#label2 {
	background-color: #E56D29;
}

#label3 {
	background-color: #FFE641;
}

#label4 {
	background-color: #68D168;
}

#label5 {
	background-color: #52E4DC;
}

#label6 {
	background-color: #3296FF;
}

#label7 {
	background-color: #6A5ACD;
}

.label_div {
	width: 100%;
}

.label_div>input {
	display: none;
	width: 40px;
	height: 30px;
	border-radius: 5px;
	margin-bottom: 5px;
	border: 1px;
	font-size: 15px;
	font-weight: bold;
	color: black;
	box-shadow: 2px 2px 1px lightslategrey;
}

#invite {
	min-height: 50%;
	overflow-y: aute;
	background-color: #448cb7;
}

#searchUser {
	height: 5%;
	width: 100%;
}

#inUser, #resultUser {
	height: 40%;
	width: 100%;
	overflow-y: auto;
}

.user-inUsers, .user-searchUsers {
	height: 30px;
	width: calc(100% -20px);
	margin-left: 20px;
}

.searchUsers, .inUsers {
	float: left;
	width: 80%;
	float: left;
}

.inviteButton, .inUsersButton {
	float: right;
	width: 20%;
}

.list-card {
	height: 30px;
}

.labelDiv {
	height: 5px;
	width: 100%;
	float: left;
	margin-bottom: -2px;
	margin-top: -4px;
}

.cardTitle {
	height: 20px;
	width: 100%;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	float: right;
}

.list>.list-card>.labelDiv>div {
	display: none;
	float: left;
	width: 18px;
	height: 3px;
	margin-right: 4px;
}

#commentArea {
	border-radius: 5px;
	border: 2px solid #888;
	box-shadow: 2px 2px 6px -2px lightslategrey
}

.comment_writer {
	font-weight: bold;
	color: #D2691E;
}

.comment_writer:hover {
	cursor: pointer;
}

.comment_content {
	word-break: break-all;
	width: 95%;
}

.update_delete {
	float: right;
}

.input_update {
	width: 400px;
}

.input_cancle_div {
	display: none;
}

#popup_layer {
	width: 400px;
	height: 100px;
	padding: 2em;
	margin-bottom: 30px;
	background: #fff;
	border: solid 1px #ccc;
	position: absolute;
	top: 260px;
	left: 50%;
	margin-left: -200px;
	box-shadow: 0px 1px 20px #333;
	z-index: 999;
	display: none;
}

#attachLink {
	height: 100px;
	border-radius: 5px;
	margin-top: 10px;
	overflow-y: scroll;
	border: 2px solid grey;
	width: 100%;
}

#attachLink::-webkit-scrollbar-track {
	background-color: #fff;
	border-radius: 5px;
}

#attachLink::-webkit-scrollbar {
	width: 6px;
	background-color: #fff;
	border-radius: 5px;
}

#attachLink::-webkit-scrollbar-thumb {
	background-color: #c1c1c1;
	border-radius: 5px;
	height: 5px;
}

.addCardContainer {
	display: none;
}

.up_list_title {
	font-weight: bold;
	text-align: left;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
	height: 20px;
	padding-left: 5px;
	padding-right: 45px;
}

.list_title {
	font-weight: bold;
	text-align: left;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	height: 20px;
	padding-left: 5px;
	padding-right: 45px;
	cursor: pointer;
}

.listDelBtn {
	position: absolute;
	top: 0px;
	right: 10px;
	display: block;
	font-weight: bold;
}

.cardDelBtn {
	top: 0px;
	display: block;
}

#CBTitle, .addCardTitle {
	width: 90%;
	height: 90%;
	float: left;
	margin: 10px;
}

#CBTitle_btn {
	width: 100%;
}

#CBSubmit, #CBCancel {
	margin: 5px;
}

#up_title_input {
	z-index: 999;
}

#up_board_Title {
	width: 100%;
}

#board_Title:hover {
	background: #1f6086;
	border-radius: 5px;
}

#up_board_input {
	background: #4286af;
	border-radius: 5px;
	border: 1px solid #4286af;
}

.comment_regdate {
	float: right;
	font-size: xx-small;
}
</style>
<script>
	document.onkeydown = refl;
	function refl() {
		if (event.keyCode == 116) {
			unConnect();
			location.href = '/main/board';
			return false;
		}
	}

	history.pushState(null, null, location.href);
	window.onpopstate = function(event) {
		history.go(1);
	}

	var chatOnOff = false;

	var b_num = '${b_num}';
	var webSocket = new WebSocket('ws://211.183.8.20/list');
	var firstSeq = 0;
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

	var numOfList = 0; // 전체 리스트 갯수
	var cardl_num = 0;
	var cardId = 0;
	window.onload = function() {


		var users = ${users};

		beforeMsg();
		userConnection(users);
		$('#mainList').sortable(
				{
					update : function(ev, ui) {
						if (sessionChk()) {
							alert('로그아웃되었습니다.');
							location.href = '/';
						} else {

							var result = $('#mainList').sortable('toArray');
							console.log(result);

							var moveData = new Object();
							var msg = '';
							for (var i = 0; i < result.length; i++) {
								if (i < (result.length - 1)) {
									msg += result[i] + ',';
								} else {
									msg += result[i];
								}

							}

							moveData = result;

							var data = JSON.stringify(moveData);
							if (sessionChk()) {
								alert('로그아웃되었습니다.');
								location.href = '/';
							} else {

								$.ajax({
									url : '/main/moveList',
									method : 'post',
									data : {
										data : msg,
										length : result.length,
										b_num : b_num
									}

								}).done(
										function(msg) {
											send('mainList', 'listMove',
													'${sessionScope.id}',
													'${sessionScope.b_num}',
													'0', '0');
										});
							}
						}
					}

				});

		listSearch(b_num);

		inUsers();
		$("#inputMessage").keyup(function(key) {
			if (key.keyCode == 13) {
				if (key.shiftKey) {

				} else {
					$("#sendMessage").click();
				}
			}
		});

	};
	var msgText = '';
	function setWidthOnload(num) {

		var margin = $(".listBorder").css("margin").replace('px', '');
		var borderWidth = $('.listBorder').css("borderWidth").replace('px', '');
		var listWidth = $('.listBorder').width() + margin * 2 + borderWidth * 2;
		var mainWidth = num * listWidth;
		var addListBorderWidth = $('.addListBorder').width() + 10;
		var contentWidth = mainWidth + addListBorderWidth;

		$('#mainList').css('width', mainWidth);
		$('.content').css('width', contentWidth);
		$('.g3-container').css('width', contentWidth);
	}

	function setWidthAddList(num) {
		var currentWidth = $('.g3-container').width();
		var margin = $(".listBorder").css("margin").replace('px', '');
		var borderWidth = $('.listBorder').css("borderWidth").replace('px', '');
		var listWidth = $('.listBorder').width() + margin * 2 + borderWidth * 2;
		var afterWidth = currentWidth + listWidth;

		var mainWidth = num * listWidth;

		$('#mainList').css('width', mainWidth);

		if (((num + 1) * listWidth) > currentWidth) {
			$('.content').css('width', afterWidth);
			$('.g3-container').css('width', afterWidth);
		}

	}

	function addList(title) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				method : 'post',
				url : '/main/createList',
				data : {
					id : '${sessionScope.id}',
					title : title,
					b_num : b_num

				}

			}).done(
					function(msg) {

						var arrList = JSON.parse(msg);
						var id = arrList.l_num;
						//nhs
						var l_title = arrList.title;

						listView(id, l_title, arrList.l_num);

						numOfList = $('.viewList').length;
						setWidthAddList(numOfList);

						/* 각 리스트들의 카드들을 쇼터블 하는 function */
						listSortable(id);

						var listHtml = $('#mainList')[0].innerHTML;
						send('mainList', 'listCreate', '${sessionScope.id}',
								'${sessionScope.b_num}', '0', '0');

					});
		}
	}

	function addCard(l_num, id) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$('#addCardContainer' + id).toggle();
			$('#addCardTitle' + id).focus();
			$('#addCardTitle' + id).val('');
			cardId = id;
			cardl_num = l_num;
		}
	}

	function addCardDetail() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			if ($('#addCardTitle' + cardId).val()) {
				var title = $('#addCardTitle' + cardId).val();

				var LengthOfTitle = byteCalc(title);

				if (LengthOfTitle > 30) {
					alert('카드 이름은 영문 30자, 한글 15자를 넘을 수 없습니다');
					$('#addCardTitle' + cardId).val('');
				} else {
					$
							.ajax({
								method : 'post',
								url : '/main/createCard',
								data : {
									id : '${sessionScope.id}',
									title : title,
									b_num : b_num,
									l_num : cardl_num

								}
							})
							.done(
									function(msg) {
										console.log(msg);
										var cardArr = JSON.parse(msg);

										var newCard = document
												.createElement('div');
										var c_num = cardArr.c_num;

										newCard.id = c_num;
										newCard.className = 'list-card';
										newCard.onclick = function() {

											cardView(b_num, cardl_num, c_num)

										};

										labelSet(b_num, cardl_num, c_num);

										var labelArea = document
												.createElement('div');
										labelArea.className = 'labelDiv';

										// 카드 내부의 label div 생성!!!
										for (var j = 1; j <= 7; j++) {
											var labelDiv = document
													.createElement('div');
											labelDiv.id = 'labelDiv' + c_num
													+ '_' + j;
											labelArea.append(labelDiv);
										}

										var cardTitle = document
												.createElement('div');
										cardTitle.id = 'cardTitle' + c_num;
										cardTitle.className = 'cardTitle';

										var createCardText = document
												.createTextNode(cardArr.title);

										cardTitle.appendChild(createCardText);

										newCard.append(labelArea);
										newCard.append(cardTitle);

										document
												.getElementById('list' + cardId)
												.append(newCard);

										var cardHtml = $('#list' + cardId)[0].innerHTML;
										send('cardCreate', 'cardCreate',
												'${sessionScope.id}',
												'${sessionScope.b_num}', '0',
												'0');
										$('#addCardContainer' + cardId)
												.toggle();
										$('#addCardTitle' + cardId).val('');
									});
				}

			}
		}
	}
	var dateC_num = 0;

	function cardView(b_num, l_num, c_num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$('#cardReply').empty();
			$('#commentArea').val('');
			$.ajax({
				method : 'post',
				url : '/main/selectCardDetail',
				data : {
					b_num : b_num,
					l_num : l_num,
					c_num : c_num
				}
			}).done(
					function(msg) {

						var detail = JSON.parse(msg);

						var cardInfo = detail[0];

						var cardReply = detail[1];
						//hs
						var cardLink = detail[2];

						// console.log('cardLink=' + cardLink[0]);

						handleDesc(0); // description textarea 숨기기
						// console.log('detail: '+detail);
						var content = cardInfo.content;

						var label = cardInfo.label;
						var labelName = cardInfo.labelName;
						// console.log("view: " + labelName);

						var cardTitle = cardInfo.title;

						$('#card_title_view').text(cardTitle);

						$('#card_title_input').val(cardTitle);

						var dueDate = cardInfo.duedate;
						$('#date').val(dueDate);

						if (null != dueDate) {

							var sday = "D-day";
							var today = new Date();
							var mday = new Date(dueDate);
							var tmime = (mday.getTime() - today.getTime());
							var itime = 24 * 60 * 60 * 1000;
							var fdday = tmime / itime;
							var dday = Math.floor(fdday) + 1;

							$('.nal_div').text("D-day  " + dueDate);
							$('.nal2_div').text(
									"D-day 까지 " + dday + " 일 남았습니다.");
						} else {
							$('.nal_div').text('');
							$('.nal2_div').text('');
						}
						
						console.log('labelNameshow: '+labelName);

						labelShow(label);
						labelNameShow(labelName);

						if (null != content) {
							$('.content_div').html(content);
						} else {
							$('.content_div').text('');
						}

						$.each(cardReply, function(i) {

							createReplyDiv(cardReply[i].seq,
									cardReply[i].content, cardReply[i].m_id,
									cardReply[i].regdate);
						});

						//hs
						$('#attachLink').children().empty();
						$.each(cardLink, function(i) {
							var node = document.createElement('div');

							var textNode = document
									.createTextNode(cardLink[i].content);
							var aTag = document.createElement('a');
							aTag.href = cardLink[i].content;
							aTag.appendChild(textNode);
							aTag.target = '_blank';
							node.appendChild(aTag);

							$('#attachLink').append(node);
						});

						document.getElementById('listNum').value = l_num;
						document.getElementById('cardNum').value = c_num;
						dateC_num = c_num;
						cardModal.style.display = "block";
					});
		}
	}

	function labelShow(label) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			if (null == label) {
				label = "0,0,0,0,0,0,0";
			}

			var labelArr = label.split(',');

			for (var i = 1; i <= 7; i++) {
				$('#selected_label' + i).hide();
				if ('0' != labelArr[i - 1]) {
					$('#selected_label' + i).css('background-color',
							rgb2hex($('#label' + i).css("background-color")));
					$('#selected_label' + i).show();
				}
			}
		}
	}

	function labelNameShow(labelName) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var labelWidth = 0;

			// 		console.log(labelName);
			if (null == labelName) {
				labelName = ",,,,,,";
			}
			var labelNameArr = labelName.split(',');
			// 		console.log('show: ' + labelNameArr);
			for (var i = 1; i <= 7; i++) {
				if ('' != labelNameArr[i - 1]) {
					labelWidth = byteCalc(labelNameArr[i - 1]);
					if (labelWidth <= 4)
						labelWidth = 4;
					else if (labelWidth >= 18)
						labelWidth = 18;
					$('#label_name' + i).text(labelNameArr[i - 1]);
					$('#selected_label' + i).css('width', labelWidth * 10);
					$('#selected_label' + i).val(labelNameArr[i - 1]);
				}
			}
		}
	}

	function comment() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var content = $('#commentArea')[0].value;

			if ('' == content) {
				alert('댓글을 입력하세요');
			} else {
				$.ajax({
					method : 'post',
					url : '/main/addCardReply',
					data : {

						c_key : $('#cardNum')[0].value,
						m_id : '${sessionScope.id}',
						content : content
					}
				}).done(
						function(msg) {

							var replyInfo = JSON.parse(msg);

							createReplyDiv(replyInfo.seq, replyInfo.content,

									replyInfo.m_id, replyInfo.regdate);

							$('#commentArea').val('');

						});
			}
		}
	}

	function handleDesc(num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$('.content_textarea').val('');

			if (num == 1) {
				$('.content_tag').hide();
				$('.content_area').show();
				$('.content_div').hide();
			} else {
				$('.content_tag').show();
				$('.content_area').hide();
			}
		}
	}

	function sendDesc() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$('.content_tag').show();
			$('.content_div').show();
			$('.content_area').hide();

			var content = $('.content_textarea').val();
			$.ajax({
				method : 'post',
				url : '/main/updateContent',
				data : {
					c_key : $('#cardNum')[0].value,
					content : $('.content_textarea')[0].value
				}
			}).done(function(msg) {
				$('.content_div').text(content);
			});
		}

	}

	function createReplyDiv(seq, cnt, m_id, regdate) {

		var reply = document.createElement('div');

		reply.id = 'reply_' + seq;
		reply.className = 'card_reply';

		var content = document.createElement('pre');
		var writer = document.createElement('div');
		var regdateDiv = document.createElement('div');

		var contentText = document.createTextNode(cnt);
		var writerText = document.createTextNode(m_id);
		var regdateText = document.createTextNode(regdate);
		var updateText = document.createTextNode('수정 ');
		var updateText2 = document.createTextNode(' 수정 ');
		var wallText = document.createTextNode('|');
		var wallText2 = document.createTextNode('|');
		var deleteText = document.createTextNode(' 삭제');
		var cancleText = document.createTextNode(' 수정취소');

		var updateDelete = document.createElement('div');
		var updateTag = document.createElement('a');
		var wallSpan = document.createElement('span');
		var deleteTag = document.createElement('a');
		var inputCancleDiv = document.createElement('div');
		var inputUpdate = document.createElement('textarea');
		var updateCheck = document.createElement('a');
		var wallSpan2 = document.createElement('span');
		var cancleTag = document.createElement('a');

		updateDelete.id = 'update_delete' + seq;
		updateDelete.className = 'update_delete';

		updateTag.id = 'update_comment' + seq;
		updateTag.setAttribute('onclick', 'showUpdate(' + seq + ', 1)');
		updateTag.setAttribute('href', '#');
		updateTag.append(updateText);

		updateCheck.id = 'update_check' + seq;
		updateCheck.setAttribute('onclick', 'updateComment(' + seq + ')');
		updateCheck.setAttribute('href', '#');
		updateCheck.append(updateText2);

		wallSpan.id = 'wall' + seq;
		wallSpan.append(wallText);

		wallSpan2.id = 'wall2' + seq;
		wallSpan2.append(wallText2);

		deleteTag.id = 'delete_comment' + seq;
		deleteTag.setAttribute('onclick', 'deleteComment(' + seq + ')');
		deleteTag.setAttribute('href', '#');
		deleteTag.append(deleteText);

		inputCancleDiv.id = 'input_cancle_div' + seq;
		inputCancleDiv.className = 'input_cancle_div';

		inputUpdate.id = 'input_update' + seq;
		inputUpdate.className = 'input_update';

		cancleTag.id = 'cancle_tag' + seq;
		cancleTag.className = 'cancle_tag';
		cancleTag.setAttribute('href', '#');
		cancleTag.setAttribute('onclick', 'showUpdate(' + seq + ', 2)');
		cancleTag.append(cancleText);

		inputCancleDiv.append(inputUpdate);
		inputCancleDiv.append(updateCheck);
		inputCancleDiv.append(wallSpan2);
		inputCancleDiv.append(cancleTag);

		regdateDiv.className = 'comment_regdate';
		regdateDiv.id = 'comment_regdate' + seq;

		writer.className = 'comment_writer';
		writer.id = 'comment_writer' + seq;
		content.className = 'comment_content';

		regdateDiv.appendChild(regdateText);
		writer.appendChild(writerText);
		content.appendChild(contentText);

		reply.appendChild(writer);
		reply.appendChild(regdateDiv);
		reply.appendChild(content);

		content.id = 'comment_content' + seq;

		updateDelete.append(updateTag);
		updateDelete.append(wallSpan);
		updateDelete.append(deleteTag);

		writer.append(writerText);
		content.append(contentText);

		var sessionId = '${sessionScope.id}';

		if (sessionId == m_id) {
			content.append(updateDelete);
		}

		reply.append(writer);
		reply.append(content);
		reply.append(inputCancleDiv);

		$('#cardReply').prepend(reply);

		var midSize = byteCalc(m_id);

		$('#comment_writer' + seq).css('width', midSize * 10);

		$('#comment_writer' + seq).click(function() {
			profile(m_id);
		});

	}

	function updateComment(getSeq) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var newReply = $('#input_update' + getSeq).val();

			$.ajax({
				method : 'post',
				url : '/main/updateCardReply',
				data : {
					c_key : $('#cardNum')[0].value,
					seq : getSeq,
					content : newReply
				}
			}).done(
					function(msg) {
						var replyInfo = JSON.parse(msg);

						$('#cardReply').empty();
						$.each(replyInfo, function(i) {
							createReplyDiv(replyInfo[i].seq,
									replyInfo[i].content, replyInfo[i].m_id,
									replyInfo[i].regdate);

						});
					});
		}
	}

	function showUpdate(getSeq, action) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			if ('1' == action) {
				$('#input_cancle_div' + getSeq).show();
				$('#update_delete' + getSeq).hide();
			} else if ('2' == action) {
				$('#input_cancle_div' + getSeq).hide();
				$('#update_delete' + getSeq).show();
			}
		}
	}

	function deleteComment(getSeq) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var result = confirm('댓글을 삭제 하시겠습니까?');

			if (result) {
				$.ajax({
					method : 'post',
					url : '/main/deleteCardReply',
					data : {
						c_key : $('#cardNum')[0].value,
						seq : getSeq,
						m_id : '${sessionScope.id}'
					}
				}).done(
						function(msg) {
							var replyInfo = JSON.parse(msg);

							$('#cardReply').empty();


							$.each(replyInfo,
									function(i) {
										createReplyDiv(replyInfo[i].seq,
												replyInfo[i].content,
												replyInfo[i].m_id,
												replyInfo[i].regdate);

									});
						});
			}
		}
	}

	function labelView() {
		if ($('.btn-label-view').next("div").hasClass('submenu_hidden')) {
			$('.btn-label-view').next("div").removeClass('submenu_hidden');
		} else {
			$('.btn-label-view').next("div").addClass('submenu_hidden');
		}
	}

	function getHistory() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				method : 'post',
				url : '/main/selectHistory',
				data : {
					b_num : b_num,
					id : '${sessionScope.id}'
				}
			}).done(
					function(msg) {
						var history = JSON.parse(msg);
						var msg = '';
						for (i = 0; i < history.length; i++) {
							msg += '<p class="history">' + history[i].content
									+ ' ' + history[i].regdate + '</p>'
							$('#selectHistory').html(msg);
						}

					});
		}
	}
	function updateListTitle(id, choice) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			if (1 == choice) {
				$('#list_title' + id).hide();
				$('#up_list_title' + id).show();
				$('#up_title_input' + id).select();
			} else if (2 == choice) {
				var title = $('#up_title_input' + id).val();

				$.ajax({
					url : '/main/listTitleUpdate',
					method : 'post',
					data : {
						b_num : b_num,
						l_num : id,
						title : title
					}

				}).done(function(msg) {
					var result = JSON.parse(msg);
					if ('success' == result) {
						$('#list_title' + id).html('');
						$('#list_title' + id).html(title);
						$('#list_title' + id).innerHTML = title;
						$('#list_title' + id).attr('title', title);
						$('#up_list_title' + id).hide();
						$('#list_title' + id).show();
					} else if ('fail' == result) {
						alert('수정 실패');
					}
				});
			}
		}
	}

	function listView(id, l_title, l_num) {
		var list_header = document.createElement('div');
		list_header.className = 'list_header';

		var div = document.createElement('div');
		div.id = 'list' + id;
		div.className = 'list';

		var addCardArea = document.createElement('div');
		addCardArea.className = 'addCardArea';

		var viewList = document.createElement('div');
		viewList.id = 'viewList' + id;
		viewList.className = 'viewList';

		var listBorder = document.createElement('div');
		listBorder.id = id;
		listBorder.className = 'listBorder';

		//hs
		var list_title = document.createElement('div');
		list_title.id = 'list_title' + id;
		list_title.className = 'list_title';
		list_title.innerHTML = l_title;
		list_title.setAttribute('onclick', 'updateListTitle(' + id + ', 1);');
		list_title.setAttribute('title', l_title);

		var up_list_title = document.createElement('div');
		up_list_title.id = 'up_list_title' + id;
		up_list_title.className = 'up_list_title';
		up_list_title
				.setAttribute('onclick', 'updateListTitle(' + id + ', 2);');

		var up_title_input = document.createElement('input');
		up_title_input.id = 'up_title_input' + id;
		up_title_input.className = 'up_title_input';
		up_title_input.setAttribute('type', 'text');
		up_title_input.setAttribute('value', l_title);
		up_list_title.append(up_title_input);

		var list_foot = document.createElement('div');
		list_foot.className = 'list_foot';

		var addCardDiv = document.createElement('div');
		addCardDiv.className = 'addCard';

		var addCardContainer = document.createElement('div');
		addCardContainer.id = 'addCardContainer' + id;
		addCardContainer.className = 'addCardContainer';

		var addCardTextarea = document.createElement('textarea');
		addCardTextarea.id = 'addCardTitle' + id;
		addCardTextarea.className = 'addCardTitle';

		var addCardSubmit = document.createElement('input');
		addCardSubmit.id = 'addCardSubmit' + id;
		addCardSubmit.className = 'addCardSubmit';
		addCardSubmit.setAttribute('type', 'button');
		addCardSubmit.setAttribute('value', '저장');
		addCardSubmit.setAttribute('onclick', 'addCardDetail()');

		var aTag = document.createElement('a');
		var createAText = document.createTextNode('addCard');
		aTag.setAttribute('onClick', 'addCard(' + l_num + ',\'' + id + '\')');

		aTag.appendChild(createAText);

		addCardContainer.append(addCardTextarea);
		addCardContainer.append(addCardSubmit);

		addCardDiv.appendChild(aTag);
		addCardArea.append(addCardContainer);
		list_foot.append(addCardArea);
		list_foot.appendChild(addCardDiv);

		//hs
		var aDelList = document.createElement('a');
		aDelList.className = 'listDelBtn';
		var aDelListText = document.createTextNode('x');
		aDelList.appendChild(aDelListText);
		aDelList.setAttribute('href', '#');
		aDelList.setAttribute('onclick', 'deleteList(' + b_num + ',' + l_num
				+ ');');

		list_header.appendChild(aDelList);

		list_header.appendChild(list_title);
		list_header.appendChild(up_list_title);

		viewList.appendChild(list_header);
		viewList.appendChild(div);

		viewList.appendChild(list_foot);

		listBorder.append(viewList);

		document.getElementById('mainList').appendChild(listBorder);

		$('.list').css('max-height', $('.listBorder').height() * 0.8);
	}

	function listSearch(b_num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				url : '/main/searchList',
				method : 'post',
				data : {
					b_num : b_num
				}
			}).done(function(msg) {

				var listArr = JSON.parse(msg);
				$.each(listArr, function(i) {

					var l_num = listArr[i].l_num;
					var id = l_num;
					//nhs
					var l_title = listArr[i].title;

					listView(id, l_title, l_num);

					/*
					cardSearch >> 데이터베이스에 있는 해당리스트의 카드들을 불러온다.
					 */
					cardSearch(b_num, l_num, id);

				});

				numOfList = $('.listBorder').length; // 전체 viewList의 갯수 획득

				// 			console.log('length_onload: ' + numOfList);

				setWidthOnload(numOfList); // Onload 시 전체 width 설정

			});
		}
	}

	function labelSet(b_num, l_num, c_num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				method : 'post',
				url : '/main/selectCardDetail',
				data : {
					b_num : b_num,
					l_num : l_num,
					c_num : c_num
				}
			}).done(
					function(msg) {

						var detail = JSON.parse(msg);
						var cardInfo = detail[0];
						var cardReply = detail[1];

						var label = cardInfo.label;

						if (label == null) {
							label = "0,0,0,0,0,0,0";
						}

						var labelArr = label.split(',');

						for (var i = 1; i <= 7; i++) {
							if ('0' != labelArr[i - 1]) {
								$('#labelDiv' + c_num + '_' + i).css(
										'background-color',
										rgb2hex($('#label' + i).css(
												"background-color")));
								$('#labelDiv' + c_num + '_' + i).show();
							}
						}
					});
		}
	}

	function cardSearch(b_num, l_num, id) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				url : '/main/searchCard',
				method : 'post',
				data : {
					b_num : b_num,
					l_num : l_num
				}
			}).done(
					function(msg) {
						var cardArr = JSON.parse(msg);

						$.each(cardArr, function(i) {
							var cardDiv = document.createElement('div');
							var c_num = cardArr[i].c_num;

							cardDiv.id = c_num;
							cardDiv.className = 'list-card';
							cardDiv.onclick = function() {
								cardView(b_num, l_num, c_num);
							};

							labelSet(b_num, l_num, c_num);

							var labelArea = document.createElement('div');
							labelArea.className = 'labelDiv';

							// 카드 내부의 label div 생성!!!
							for (var j = 1; j <= 7; j++) {
								var labelDiv = document.createElement('div');
								labelDiv.id = 'labelDiv' + c_num + '_' + j;
								labelArea.append(labelDiv);
							}
							var cardTitle = document.createElement('div');
							cardTitle.id = 'cardTitle' + c_num;
							cardTitle.className = 'cardTitle';

							var createCardText = document
									.createTextNode(cardArr[i].title);

							cardTitle.appendChild(createCardText);

							cardDiv.append(labelArea);
							cardDiv.append(cardTitle);

							$('#list' + id).append(cardDiv);

						});
						listSortable(id);

					});
		}
	}
	function listSortable(id) {

		$('#list' + id)
				.sortable(
						{
							connectWith : '.list',
							update : function(ev, ui) {

								if (sessionChk()) {
									alert('로그아웃되었습니다.');
									location.href = '/';
								} else {
									var result1 = $('#list' + id).sortable(
											'toArray');
									var parentId = ev.toElement.parentElement.id;
									var cardArr = '';

									$
											.each(
													ev.target.childNodes,
													function(i) {

														if (parentId == ev.target.childNodes[i].id) {
															console.log(id);
															console
																	.log(parentId);
															console
																	.log(ev.target.childNodes[i].id);

															for (var i = 0; i < result1.length; i++) {
																if (i < (result1.length - 1)) {
																	cardArr += result1[i]
																			+ ',';
																} else {
																	cardArr += result1[i];
																}

															}
															$
																	.ajax(
																			{
																				url : '/main/moveCard',
																				method : 'post',
																				data : {

																					b_num : b_num,
																					l_num : id,
																					c_num : parentId,
																					msg : cardArr,
																					length : result1.length
																				}

																			})
																	.done(
																			function(
																					msg) {

																				send(
																						'cardMove',
																						'cardMove',
																						'${sessionScope.id}',
																						'${sessionScope.b_num}',
																						'0',
																						'0');
																			});
														}
													});
								}
							}
						});
	}

	function openChat() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			chatOnOff = true;
			viewMsg();
			document.getElementById("mySidenavChat").style.width = "600px";
			closeMsg();
		}
	}

	function closeChat() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			chatOnOff = false;
			document.getElementById("mySidenavChat").style.width = "0";
		}
	}

	function unConnect() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$.ajax({
				url : '/chat/ucConnection',
				method : 'post',
				dataType : 'json',
				data : {
					b_num : '${sessionScope.b_num}'
				}

			}).done(
					function(msg) {
						send('${sessionScope.id}', 'unConnec',
								'${sessionScope.id}', '${sessionScope.b_num}',
								'0', '0');
					});
		}
	}

	//hs
	$(function() {
		//리스트 타이틀
		$('#CBContainer').css('display', 'none');
		$('#addList').click(function() {
			// 			console.log('b');
			$('#CBContainer').toggle();
			$('#CBTitle').focus();
			$('#CBTitle').val('');
			$('#addList').hide();
		});

		$('#CBSubmit').click(function() {
			var listTitle = $('#CBTitle').val();
			var lengthOfListTitle = byteCalc(listTitle);
			if (lengthOfListTitle > 20) {
				alert('리스트 이름은 영문 20자, 한글 10자를 넘을 수 없습니다');
				$('#CBTitle').val('');
			} else {
				if ($('#CBTitle').val()) {
					addList($('#CBTitle').val());
				}
			}
			$('#CBContainer').toggle();
			$('#CBTitle').val('');
			$('#addList').show();
		});
		$('#CBCancel').click(function() {
			$('#CBContainer').toggle();
			$('#CBTitle').val('');
			$('#addList').show();
		});

		//링크 등록
		$('#insertLink').click(function() {
			$('#popup_layer, #overlay_t').toggle();
			$('#insertLinkInput').focus();
			$('#insertLinkInput').val('');
			$('#popup_layer').css("top", "40%");
		});
		$('#overlay_t, .close').click(function() {
			$('#popup_layer, #overlay_t').hide();
		});
		$('#linkSubmit')
				.click(
						function() {
							if (sessionChk()) {
								alert('로그아웃되었습니다.');
								location.href = '/';
							} else {

								if ($('#insertLinkInput').val()) {

									$
											.ajax(
													{
														method : 'post',
														url : '/main/insertLink',
														data : {
															c_key : $('#cardNum')[0].value,
															content : $(
																	'#insertLinkInput')
																	.val()
														}
													})
											.done(
													function(msg) {
														$(
																'#popup_layer, #overlay_t')
																.hide();
														var insertLink = JSON
																.parse(msg);

														var node = document
																.createElement('div');
														var textNode = document
																.createTextNode(insertLink.content);
														var aTag = document
																.createElement('a');
														aTag.href = insertLink.content;
														aTag
																.appendChild(textNode);
														aTag.target = '_blank';
														node.appendChild(aTag);

														$('#attachLink')
																.prepend(node);

													});
								} else {
									$('#popup_layer, #overlay_t').hide();
								}
							}
						});

		$('#deleteCard').click(function() {
			if (sessionChk()) {
				alert('로그아웃되었습니다.');
				location.href = '/';
			} else {

				var result = confirm('카드를 삭제 하시겠습니까?');

				if (result) { //yes 
					$.ajax({
						method : 'post',
						url : '/main/deleteCard',
						data : {
							b_num : b_num,
							c_key : $('#cardNum')[0].value
						}
					}).done(function(msg) {
						console.log(msg);
						$('#cardModal').css('display', 'none');
						var listArr = JSON.parse(msg);
						$('#mainList').children().remove();
						$.each(listArr, function(i) {

							var l_num = listArr[i].l_num;
							var id = l_num;
							var l_title = listArr[i].title;

							listView(id, l_title, l_num);
							cardSearch(b_num, l_num, id);

						});
						numOfList = $('.listBorder').length; // 전체 viewList의 갯수 획득
						setWidthOnload(numOfList); // Onload 시 전체 width 설정
					});
				}
			}
		});

		$("#sch_main").keydown(function(e) {

			if (e.keyCode == 13) {
				searchFilter();
			}
		});

	});

	function deleteList(b_num, l_num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var result = confirm('리스트를 삭제 하시겠습니까?');

			if (result) {
				$.ajax({
					method : 'post',
					url : '/main/deleteList',
					data : {
						b_num : b_num,
						l_num : l_num
					}
				}).done(function(msg) {
					//카드 삭제 시 리스트 뷰 재구성
					$('#cardModal').css('display', 'none');
					var listArr = JSON.parse(msg);
					$('#mainList').children().remove();
					$.each(listArr, function(i) {

						var l_num = listArr[i].l_num;
						var id = l_num;
						var l_title = listArr[i].title;

						listView(id, l_title, l_num);
						cardSearch(b_num, l_num, id);

					});
					numOfList = $('.listBorder').length; // 전체 viewList의 갯수 획득
					setWidthOnload(numOfList); // Onload 시 전체 width 설정
				});
			}
		}
	}

	function userConnection(users) {
		$.each(users, function(i) {
			var div = document.createElement('div');
			div.id = users[i];
			div.className = 'user';

			var aTag = document.createElement('a');
			var contentText = document.createTextNode(users[i]);

			aTag.setAttribute('onclick', 'profile(\'' + users[i] + '\')');
			aTag.setAttribute('style', 'color: white; font-size: 20px');

			aTag.append(contentText);

			div.append(aTag);
			$('#user').append(div);
		});
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

	function changeLabelName(num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var inputLabelName = $('#label_name').val();

			var labelWidth = byteCalc(inputLabelName);

			if (labelWidth > 20) {
				alert('라벨 이름은 영문 20자, 한글 10자를 넘을 수 없습니다');
				$('#label_name').val('');
			} else {
				$.ajax({
					method : 'post',
					url : '/main/selectLabelName',
					data : {
						b_num: b_num
					}
				}).done(function(msg) {
					var labelName = msg;
					
					console.log("msg: "+msg);

					if (labelWidth <= 4)
						labelWidth = 4;
					else if (labelWidth >= 18)
						labelWidth = 18;

					$('#selected_label' + num).css('width', labelWidth * 10);

					if ('' == inputLabelName) {
						$('#selected_label' + num).val(" ");
						$('#selected_label' + num).append("&nbsp;");

						$('#label_name' + num).text(' ');
						$('#label_name' + num).append("&nbsp;");
					} else {
						$('#selected_label' + num).val(inputLabelName);
						$('#label_name' + num).text(inputLabelName);
					}


					$('#label_name').text('');

					var labelNameArr = makeLabelNameArr(labelName, num);

					var tempArr = labelNameArr.toString();

					if (sessionChk()) {
						alert('로그아웃되었습니다.');
						location.href = '/';
					} else {

						$.ajax({
							method : 'post',
							url : '/main/updateLabelName',
							data : {
								b_num : b_num,
								labelName : tempArr
							}
						}).done(function(msg) {
							var result = JSON.parse(msg);

						});
					}
				});
			}
		}
	}

	function makeLabelNameArr(labelName, num) {
		var inputLabelName = $('#label_name').val();
		var labelNameArr = labelName;
		labelNameArr = labelName.split(',');
		labelNameArr[num - 1] = inputLabelName;

		console.log('labelNameInside: '+labelName);
		console.log('make: '+labelNameArr);

		return labelNameArr;
	}

	function label(num) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			var backgroundColor = rgb2hex($('#label' + num).css(
					"background-color"));
			$('#selected_label' + num).css('background-color', backgroundColor);

			var isNone = $('#selected_label' + num).css('display');

			$.ajax({
				method : 'post',
				url : '/main/selectLabel',
				data : {
					c_key : $('#cardNum')[0].value
				}
			}).done(
					function(msg) {
						var detail = JSON.parse(msg);

						var label = detail.label;
						console.log(detail);

						var c_num = $('#cardNum')[0].value;

						var labelArr;
						$('#labelDiv' + c_num + '_' + num).css(
								'background-color', backgroundColor);
						if ('none' != isNone) {
							labelArr = makeLabelArr(label, num, 'del');
							$('#selected_label' + num).hide();
							$('#labelDiv' + c_num + '_' + num).hide();
						} else {
							labelArr = makeLabelArr(label, num, 'ins');
							$('#selected_label' + num).show();
							$('#labelDiv' + c_num + '_' + num).show();
						}

						var tempArr = labelArr.toString();

						$.ajax({
							method : 'post',
							url : '/main/updateLabel',
							data : {
								c_key : $('#cardNum')[0].value,
								label : tempArr
							}
						}).done(function(msg) {

						});

						console.log(label);

						var c_num = $('#cardNum')[0].value;

						var labelArr;
						$('#labelDiv' + c_num + '_' + num).css(
								'background-color', backgroundColor);
						if ('none' != isNone) {
							labelArr = makeLabelArr(label, num, 'del');
							$('#selected_label' + num).hide();
							$('#labelDiv' + c_num + '_' + num).hide();
						} else {
							labelArr = makeLabelArr(label, num, 'ins');
							$('#selected_label' + num).show();
							$('#labelDiv' + c_num + '_' + num).show();
						}

						var tempArr = labelArr.toString();

						$.ajax({
							method : 'post',
							url : '/main/updateLabel',
							data : {
								c_key : $('#cardNum')[0].value,
								label : tempArr
							}
						});
						send(isNone + ',' + c_num + ',' + num + ','
								+ backgroundColor, 'labelClick',
								'${sessionScope.id}', '${sessionScope.b_num}',
								'0', c_num);
					});
		}
	}

	function makeLabelArr(label, num, action) {
		var backgroundColor = rgb2hex($('#label' + num).css("background-color"));

		var labelArr = label.split(',');

		if ('ins' == action) {
			labelArr[num - 1] = backgroundColor;
		} else if ('del' == action) {
			labelArr[num - 1] = 0;
		}
		return labelArr;
	}

	function rgb2hex(orig) {
		var rgb = orig.replace(/\s/g, '').match(/^rgba?\((\d+),(\d+),(\d+)/i);
		return (rgb && rgb.length === 4) ? "#"
				+ ("0" + parseInt(rgb[1], 10).toString(16)).slice(-2)
				+ ("0" + parseInt(rgb[2], 10).toString(16)).slice(-2)
				+ ("0" + parseInt(rgb[3], 10).toString(16)).slice(-2) : orig;
	}

	function openMsg() {
		var bodyHeight = document.body.offsetHeight - 150;
		document.getElementById("msgOff").style.top = bodyHeight + "px";

	}
	function openFilter() {
		document.getElementById("filter").style.width = "300px";
	}
	function closeFilter() {
		document.getElementById("filter").style.width = "0px";

	}

	function closeMsg() {
		document.getElementById("msgOff").style.top = "100%";
	}
	function inviteMember() {
		document.getElementById("invite").style.width = "300px";
	}
	function closeInviteMember() {
		document.getElementById("invite").style.width = "0px";

	}

	function profile(id) {
		window.open('profile?profileId=' + id, '',
				'width=600, height=300, left=500, top=400');
	}

	$(function() {
		$("#wow").datepicker({

			changeMonth : true,
			closeText : 'close',
			dateFormat : 'yy-mm-dd',
			autoclose : true,
			changeYear : true,
			onSelect : function(day) {

				$.ajax({
					method : 'post',
					url : '/main/dueDate',
					data : {
						c_key : dateC_num,
						day : day

					}
				}).done(function(msg) {

					$('#date').val(day);
					var detail = JSON.parse(msg);
					console.log('date:' + msg);

					$('.nal_div').text("D-day     :" + day)

					var sday = "D-day";
					var today = new Date();
					var mday = new Date(day);
					var tmime = (mday.getTime() - today.getTime());
					var itime = 24 * 60 * 60 * 1000;
					var fdday = tmime / itime;
					var dday = Math.floor(fdday) + 1;
					if (dday == 0)
						$('.nal2_div').text("오늘입니다.");
					else if (dday > 0)
						$('.nal2_div').text(sday + "까지 " + dday + "일 남았습니다.");
					else if (dday < 0)
						$('.nal2_div').text(sday + "로부터 " + dday + "일 지났습니다.");

					$("#wow").css('display', 'none');
				});
			}
		});
	});

	function logout() {
		var result = confirm('로그아웃 하시겠습니까?');

		if (result) { //yes 
			unConnect();
			location.replace('/main/logOut');
		}
	}

	function showCal() {
		$("#wow").toggle();
	}

	function showCal() {
		$("#wow").toggle();
	}

	$(function() {
		$('#wow').datepicker().on('changeDate', function(day) {
			$('#wow').hide();
		});
	});

	// 	$('#id').text(id);

	$(function() {
		$('#wow').datepicker().on('changeDate', function(day) {
			$('#wow').hide();
		});
	});

	function sessionChk() {
		var result = false;
		$.ajax({
			url : '/main/sessionChk',
			method : 'post',
			async : false
		}).done(function(msg) {
			if ('1' == msg) {
				result = true;
			}
		});
		return result;
	}

	function updateBoardTitle(choice) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			if (1 == choice) {
				$('#board_Title').hide();
				$('#up_board_Title').show();
				$('#up_board_input').select();
			} else if (2 == choice) {
				var title = $('#up_board_input').val();

				$.ajax({
					url : '/main/boardTitleUpdate',
					method : 'post',
					data : {
						b_num : b_num,
						title : title
					}

				}).done(function(msg) {
					var result = JSON.parse(msg);
					if ('success' == result) {
						$('#board_Title').html('');
						$('#board_Title').html(title);
						$('#up_board_Title').hide();
						$('#board_Title').show();
					} else if ('fail' == result) {
						alert('수정 실패');
					}

				});

			}
		}
	}
	function updateCardTitle(choice) {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			//카드 타이틀
			if (1 == choice) {
				$('#card_title_view').hide();
				$('#card_title_update').show();
				$('#card_title_input').select();
			} else if (2 == choice) {
				var title = $('#card_title_input').val();
				var l_num = $('#listNum').val();
				var c_num = $('#cardNum').val();

				$.ajax({
					url : '/main/cardTitleUpdate',
					method : 'post',
					data : {
						b_num : b_num,
						l_num : l_num,
						c_num : c_num,
						title : title
					}
				}).done(function(msg) {
					var result = JSON.parse(msg);
					if ('success' == result) {
						$('#cardTitle' + c_num).html(title);
						$('#card_title_view').html('');
						$('#card_title_view').html(title);
						$('#card_title_update').hide();
						$('#card_title_view').show();
					} else if ('fail' == result) {
						alert('수정 실패');
					}
				});

				$('#card_title_update').hide();
				$('#card_title_view').show();
				$('#card_title_view').select();
			}
		}
	}

	function beforeMsg() {
		if (sessionChk()) {
			alert('로그아웃되었습니다.');
			location.href = '/';
		} else {

			$("#display${sessionScope.b_num}")
					.scroll(
							function() {
								var dis = $("#display${sessionScope.b_num}");
								if (dis[0].scrollHeight - dis.scrollTop() == dis[0].scrollHeight) {
									var beHeight = dis[0].scrollHeight
											- dis.scrollTop();
									console.log(dis[0].scrollHeight
											- dis.scrollTop());
									$
											.ajax(
													{
														method : 'post',
														url : '/chat/beforeMsg',
														data : {
															b_num : '${sessionScope.b_num}',
															userId : '${sessionScope.id}',
															seq : firstSeq
														}
													})
											.done(
													function(msg) {
														var data = JSON
																.parse(msg);
														$
																.each(
																		data,
																		function(
																				i) {
																			var regdate = data[i].date;
																			var msg = data[i].content;
																			var id = data[i].m_id;
																			firstSeq = data[i].firstSeq;

																			if (id == '${sessionScope.id}') {

																				var div = document
																						.createElement('div');
																				div.className = 'myMsg';

																				var content = document
																						.createElement('pre');
																				content.className = "myContent";

																				var date = document
																						.createElement('div');
																				date.className = "myDate";

																				var b = document
																						.createElement('div');
																				b.className = 'b';

																				var contentText = document
																						.createTextNode(msg);
																				var dateText = document
																						.createTextNode(regdate);

																				content
																						.appendChild(contentText);

																				date
																						.appendChild(dateText);

																				div
																						.append(b);
																				div
																						.append(content);
																				div
																						.append(date);

																			} else {
																				var box = document
																						.createElement('div');
																				box.className = 'box';

																				var div = document
																						.createElement('div');
																				div.className = 'memberMsg';

																				var content = document
																						.createElement('pre');
																				content.className = "memberContent";

																				var writer = document
																						.createElement('div');
																				writer.className = "memberWriter";

																				var date = document
																						.createElement('div');
																				date.className = "memberDate";

																				var b = document
																						.createElement('div');
																				b.className = 'm';

																				var contentText = document
																						.createTextNode(msg);
																				var writerText = document
																						.createTextNode(id);
																				var dateText = document
																						.createTextNode(regdate);

																				content
																						.appendChild(contentText);
																				writer
																						.appendChild(writerText);
																				date
																						.appendChild(dateText);

																				box
																						.append(writer);
																				box
																						.append(b);
																				box
																						.append(content);
																				box
																						.append(date);

																				div
																						.append(box);

																			}
																			$(
																					'#display${sessionScope.b_num}')
																					.prepend(
																							div);

																		});

														$(
																'#display${sessionScope.b_num}')
																.scrollTop(
																		(dis[0].scrollHeight - dis
																				.scrollTop())
																				- beHeight);
													});
								}

							});
		}
	}
	// 	function checkEnter() {
	// 		var key = window.event.keycode;
	// 		var desc = '';
	// 		if(key === 13) {
	// 			desc = $('.content_textarea').val();
	// 			desc = desc + '\n';
	// 			return false;
	// 		} else {
	// 			return true;
	// 		}
	// 	}
</script>
<jsp:include page="listWebSocket.jsp" flush="false"></jsp:include>
</head>
<body>

	<div id="msgOff" class="msgSide">
		<a href="javascript:void(0)" class="closeMsg" onclick="closeMsg();">&times;</a>
		<div id="message" onclick="openChat();"></div>
	</div>

	<header id="header" class="clearfix">

		<a href="#" onclick="profile('${id}')" class="btn_board"><span>${id}</span></a>
		<a href="#" onclick="logout()" class="btn_logout"> <span>LOGOUT</span></a>
		<div id="sch_main_wrap">
			<fieldset class="sch_field">
				<input type="text" id="sch_main">
			</fieldset>
			<a href="#" onclick="searchFilter();" id="btn_search"><span
				class="btn_ico_sch"></span></a>
		</div>
		<a href="/main/board"><h1 style="top: -10px;"
				onclick="unConnect();">PROJECT 321</h1></a> <a href="#"
			class="js-toggle-right-slidebar">☰</a>
	</header>

	<div
		style="position: fixed; height: 50px; margin-top: 50px; color: #e4e2e2; font-size: 40px;">
		<div id="board_Title" onclick="updateBoardTitle(1)">${title}</div>
		<div id="up_board_Title" onclick="updateBoardTitle(2)"
			style="display: none;">
			<input type="text" id="up_board_input" value="${title}">
		</div>
	</div>

	<div id="content">
		<div class="g3-container" canvas="container" align="right">
			<div class="content">
				<div id="mainList" class="mainList"></div>
				<div class="addListBorder">
					<div id="addList">
						<span id="addListText">Add List..</span>
					</div>
					<div id="CBContainer">
						<textarea id="CBTitle"></textarea>
						<div id="CBTitle_btn">
							<button id="CBSubmit">SAVE</button>
							<button id="CBCancel">cancel</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div off-canvas="slidebar-2 right shift" style="z-index: 9999;">
			<ul class="menu">
				<a class="menu-icon" href="#"><i class="icon-reorder"></i></a>
				<ul class="side-menu">
					<h2 class="title">Menu</h2>
					<li class="link"><a href="#"
						class="link_tag1 js-close-right-slidebar" onclick="openFilter();">Filter</a></li>
					<li class="link" onclick="getHistory();"><a href="#"
						class="link_tag2" id="myBtn">History</a></li>
					<li class="link"><a href="#" onclick="openChat();"
						class="link_tag3 js-close-right-slidebar">Chatting</a></li>
					<li class="link"><a href="#" onclick="inviteMember()"
						class="link_tag5 js-close-right-slidebar">Members</a></li>
				</ul>
			</ul>
		</div>
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span id="hisClose" class="close">&times;</span>
				<p id="selectHistory"></p>
			</div>
		</div>
		<div id="mySidenavChat" class="sidenav-chat" style="margin-top: 50px;">
			<jsp:include page="chat.jsp" flush="false"></jsp:include>
		</div>

		<div id="filter" class="side-filter">
			<jsp:include page="filter.jsp" flush="false"></jsp:include>
		</div>
		<div id="invite" class="side-invite">
			<jsp:include page="invite.jsp" flush="false"></jsp:include>
		</div>


		<div id="cardModal" class="card-modal">
			<div class="modal-content">
				<p>
					<span id="cardClose" class="close">&times;</span>
				</p>
				<div id="cardView" class="cardView">
					<div class="card-detail-main">

						<input type="hidden" id="listNum"> <input type="hidden"
							id="cardNum">
						<div id="card_title" style="font-size: 40px;">
							<div id="card_title_view" onclick="updateCardTitle(1)"></div>
							<div id="card_title_update" onclick="updateCardTitle(2)"
								style="display: none;">
								<input type="text" id="card_title_input">
							</div>

						</div>
						<div class="label_div">
							<input id="selected_label1" type="button" onclick="label('1')"
								value="&nbsp;"> <input id="selected_label2"
								type="button" onclick="label('2')" value="&nbsp;"> <input
								id="selected_label3" type="button" onclick="label('3')"
								value="&nbsp;"> <input id="selected_label4"
								type="button" onclick="label('4')" value="&nbsp;"> <input
								id="selected_label5" type="button" onclick="label('5')"
								value="&nbsp;"> <input id="selected_label6"
								type="button" onclick="label('6')" value="&nbsp;"> <input
								id="selected_label7" type="button" onclick="label('7')"
								value="&nbsp;">
						</div>
						<br>
						<div class="nal_div"></div>
						<div class="nal2_div"></div>
						<br>
						<div id="contentId">
							<a href="#" class="	 glyphicon-pencil content_tag"
								onclick="handleDesc(1);">&nbsp;content...</a>
							<!-- 					<div class="card-desc"> -->
							<!-- 							<a href="#" class="	 glyphicon-pencil content_tag"	onclick="createDescriptionDiv();">&nbsp;description...</a> -->
							<pre class="content_div"></pre>
							<div class="content_area" id="content_area">
								<div class="content_text">
									<textarea class="content_textarea"></textarea>
								</div>
								<div>
									<button value="SAVE" style="width: 40px; height: 30px;"
										onclick="sendDesc();">
										<img alt="send" src="/resources/images/btn_send.png">
									</button>
									<button value="X" style="width: 40px; height: 30px;"
										onclick="handleDesc(0);">
										<img alt="send" src="/resources/images/btn_cancel.png">
									</button>
								</div>
							</div>
						</div>

						<h3>Add Comment</h3>
						<textarea id="commentArea" style="width: 100%; height: 100px;"
							required="required"></textarea>

						<input type="button" value="SAVE" onclick="comment();"
							id="btn_comment">
						<div id="attachLink"></div>
						<div id="cardReply"></div>
					</div>

					<div class="card-detail-sidebar">
						<button onclick="labelView();" class="btn-label-view dropdown">
							<!-- 						<input type="button" onclick="labelView();" class="btn-label-view dropdown"> -->
							<span class="btn_label_toggle"><img alt="label"
								src="/resources/images/btn_label.png" width="20px" height="20px"
								class="btn-label">&nbsp;Label</span>
						</button>
						<div class="submenu_hidden">
							<ul class="submenu">
								<span class="label_name">Labels</span>
								<input type="text" id="label_name"
									placeholder=" Input label name...">
								<li id="label1" onclick="label('1');">&nbsp; <span
									id="label_name1">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('1')">
								</a>
								<li id="label2" onclick="label('2');">&nbsp; <span
									id="label_name2">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('2')">
								</a>
								<li id="label3" onclick="label('3');">&nbsp; <span
									id="label_name3">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('3')">
								</a>
								<li id="label4" onclick="label('4');">&nbsp; <span
									id="label_name4">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('4')">
								</a>
								<li id="label5" onclick="label('5');">&nbsp; <span
									id="label_name5">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('5')">
								</a>
								<li id="label6" onclick="label('6');">&nbsp; <span
									id="label_name6">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('6')">
								</a>
								<li id="label7" onclick="label('7');">&nbsp; <span
									id="label_name7">&nbsp;</span>
								</li>
								<a href="#"> <img alt="label_setting"
									src="/resources/images/btn_label_setting.png"
									class="btn_label_setting" onclick="changeLabelName('7')">
								</a>
							</ul>
						</div>

						<br> <br>
						<button id="insertLink">
							<span><img alt="label"
								src="/resources/images/btn_attachment.png" width="20px"
								height="20px" class="btn-attachment">&nbsp;Attachment</span>
							<div id="overlay_t"></div>
							<div id="popup_layer">
								<input type="text" id="insertLinkInput"
									placeholder="attach link"> <input type="button"
									id="linkSubmit" class="close" value="save">

							</div>
						</button>
						<br> <br>

						<button id="deleteCard">
							<span><img alt="label"
								src="/resources/images/btn_delete.png" width="20px"
								height="20px" class="btn-delete">&nbsp;Delete</span>
						</button>
						<br> <br>

						<button id="calBtn" onclick="showCal()">
							<span><img alt="label"
								src="/resources/images/calendar.jpg" width="25px" height="25px"
								class="btn-delete">&nbsp;Calendar</span>
						</button>
						<div id="wow" style="display: none;"></div>
						<br> <br>


					</div>
				</div>

			</div>
		</div>



	</div>

</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/resources/js/jquery-ui.js"></script>
<script src="/resources/js/slidebars.js"></script>
<script src="/resources/js/scripts.js"></script>

</html>