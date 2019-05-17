<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q & A 상세게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style type="text/css">
	a {text-decoration: none;}
	#board_wrap {
		width: 800px;
		border: 1px solid #fec9c9;
		margin: 230px auto 40px;
		border-radius: 5px; 
		box-sizing: border-box;
		border-top: 20px  solid #fec9c9;
		padding: 20px;
		padding-bottom: 40px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);

	}
	.box_title {
		margin:0;
		margin-bottom:10px;
	}
	.category_text {
		font-size: 15px;
		display: block;
		margin-bottom: 5px;
		font-style: italic;
		color: #f39c12;
	}
	table {
		width: 738px;
		border-collapse: collapse;
		border-radius: 4px;
		border-top: 2px solid #fec9c9;
		border-bottom: 2px solid #fec9c9;
		border-left: 1px solid #fec9c9;
		border-right: 1px solid #fec9c9;
		margin-bottom: 10px;
		font-size: 17px;
	}
	th,td {
		border: 1px solid #fec9c9;
		padding-left: 15px;
	}
	th {
		background-color: #fec9c9;
		color: white;
		height: 35px;
	}
	td {
		height: 35px;
		background-color: white;
	}
	#detailContent {
		padding: 20px;
	}
	i {
		display: inline-block;
		padding-left: 10px;
	}
	.fa-eye {
		color: #3498DB;
	}
	.fa-heart {
		color: #e12e1c;
	}
	.btn_Like {
		position: relative;
		display: inline-block;
		width: 44px;
		height: 44px;
		border: 1px solid #e8e8e8;
		border-radius: 44px;
		font-family: notokr-bold,sans-serif;
		font-size: 14px;
		line-height: 16px;
		background-color: #fff;
		color: #dd5d54;
		box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
		transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
	    cursor: pointer;
	    outline: none;
	}
	.btn_Like:hover {
	  border: 1px solid rgba(228,89,89,0.3);
	  background-color: rgba(228,89,89,0.02);
	  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
	}
	.btn_unlike .img_emoti {
	    background-position: -30px -120px;
	}
	.btn_unlike .img_emoti {
	    background-position: -30px -120px;
	}
	.img_emoti{
		display: inline-block;
		overflow: hidden;
		font-size: 0;
		line-height: 0;
		background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
		text-indent: -9999px;
		vertical-align: top;
		width:20px;
		height: 17px;
		margin-top: 1px;
		background-position: 0px -120px;
		text-indent: 0;
	}
	.btn_Like .ani_heart_m {
		margin: -63px 0 0 -63px;
	}
	.ani_heart_m {
		display: block;
		position: absolute;
		top: 50%;
		left: 50%;
		width: 125px;
		height: 125px;
		margin: -63px 0 0 -63px;
		pointer-events: none;
	}
	.ani_heart_m.hi {
	    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
	    -webkit-background-size: 9000px 125px;
	    background-size: 9000px 125px;
	    animation: on_m 1.06s steps(72);
	}
	.ani_heart_m.bye {
	    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
	    -webkit-background-size: 8250px 125px;
	    background-size: 8250px 125px;
	    animation: off_m 1.06s steps(66);
	}
	@keyframes on_m {
	  from { background-position: 0 }
	  to { background-position: -9000px }
	}
	
	@keyframes off_m {
	  from { background-position: 0 }
	  to { background-position: -8250px }
	}
	.fa-heart{
		font-size: 14px;
		padding-right: 5px;
	}
	#reply_wrap {
		margin: 0 auto 40px;
		border: 1px solid #d6ecfa;
		width: 800px;
		box-sizing: border-box;
		border-radius: 4px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	#reply_Wrap_title {
		height: 30px;
		margin: 0px;
		border-bottom: 1px solid #d6ecfa;
		background-color: #d6ecfa;
	}
	#knboard_detail_rspan {
		color:white;
		font-size: 15px;
		line-height: 30px;
		padding-left: 10px; 
	}
	#detail_replay {
		width: 799px;
		padding: 20px;
		box-sizing: border-box;
	}
	.reply_List:nth-child(2n) {
		margin-left: 130px;
	}
	.reply_List {
		border: 1px solid #d6ecfa;
		border-radius: 4px;
		padding: 10px;
		background-color: white;
		width: 602px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		margin-bottom: 30px;
	}
	.replay_writer {
		color: #2c3e50;
		font-weight: bold;
		font-size: 15px;
		text-decoration: none;
	}
	.replyList_Date {
		float: right;
		color: #2c3e50;
		font-size: 12px;
	}
	.reply_login {
		border-top: 1px dashed black;
		padding-left: 10px;
	}
	.reply_nologin_span {
		width: 14px;
		line-height: 40px;
		font-size: 12px;
	}
	#reply_Btn {
		background-color: #f39c12;
		display: inline-block;
		margin-top: 10px;
	}
	#reply_Btn:hover {
		background-color: #f39c12;
	}
	.reply_Btn {
		background-color: #3498DB;
		padding: 7px 15px;
		font-size: 14px;
		border-radius: 25px;
		color: white;
		outline: none;
		border: 0;
		cursor: pointer;
	}
	.reply_Btn:hover {
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	.btn_warning {
		background-color: #f39c12;
		margin-left: 5px;
	}
	.reply_logina {
		font-size: 15px;
		font-weight: bold;
		color: #3498DB;
	}
	#modal_all {
		z-index: 200;
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0, 0, 0, 0.4);
		padding-top: 100px;
		display: none;
	}
	#close_Btn {
		float: right;
		cursor: pointer;
		margin-top: 8px;
	}
	#content_layout {
		width: 460px;
		height: 160px;
		box-sizing: border-box;
		background-color: white;
		border-radius: 25px;
		position: absolute;
		top: 50%;
		left: 50%;
		margin-top: -160px;
		border: 2px solid #2c3e50;
	}
	#modal_header {
		height: 35px;
		background-color: #2c3e50;
		color: white;
		border-radius: 20px 20px 0 0;
		padding: 0 20px;
		line-height: 35px;
	}
	#modal_content {
		text-align: center;
		font-size: 20px;
		padding: 20px 0;
	}
	.btn_Login {
		text-align: center;
	}
	.btn_Login > a {
		width: 90px;
		height: 35px;
		border: 2px solid #2c3e50;
		font-size: 20px;
		border-radius: 25px;
		display: inline-block;
		text-align: center;
		font-weight: bold;
		color: #2c3e50;
		margin: 0 20px 20px;
		line-height: 33px;
	}
	.btn_Login:hover {
		background-color: #2c3e50;
		color: white;
	}



</style>
</head>
<body>
	<section>
		<div id="board_wrap">
			<div class="box_header">
				<h3 class="box_title">Q & A 게시판</h3>
			</div>
			<div class="box_body">
				<table>
					<tbody>
						<tr>
							<th style="border-left: 0;">제목</th>
							<td colspan="3" style="border-right: 0;">
								<span class="category_text">3000번째 글</span>
								<span id="title">오늘 하루 날씨가 좋네요</span>
							</td>
						</tr>

						<tr>
							<th style="border-left: 0;">작성일</th>
							<td style="width:30%;">2019.05.17</td>
							<th style="border-left:0px; ">작성자</th>
							<td style="width: 30%; border-right: 0px;">김다빛</td>
						</tr>

						<tr>
							<th style="border-left: 0;">첨부파일</th>
							<td colspan="2" style="border-right: 0;"></td>
							<td style="border-right: 0; border-left: 0; text-align: center;">
								<i class="fa fa-eye"></i>5
								<i class="fa fa-heart"></i>4
							</td>
						</tr>

						<tr>
							<td colspan="4" id="detailContent" style="border-right: 0; border-left: 0;" >
								<p>날씨가 참 좋아요</p>
							</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div id="user_Btn">
				<button type="button" id="return_go" class="reply_Btn"></button>
			</div>
			<div id="wrap_Like">
			<button class="btn_Like" type="button" id="btn_good"></button>
			<span class="img_emoti">좋아요</span>
			<span class="ani_heart_m"></span>
			</div>
		</div>

		
		<div id="reply_wrap">
			<div id="commentList">
				<div id="reply_Wrap_title">
				<span id="knboard_detail_rspan">댓글 1</span>
				</div>

				<div id="detail_replay">
					<div class="reply_List">
						<div class="reply_line1" style="width: 600px;">
							<a href="#" class="replay_writer">user10</a>
							<span id="replyList_Date">2019-05-17 09:18:17</span>
						</div>
						<div class="reply_line2">
							<div class="replyList_textarea" id="replyList_textarea">
								<p>좋네요!</p>
							</div>
						</div>
					</div>
				</div>

				<div class="reply_login" id="reply_nologin">
					<span class="reply_nologin_span">
						<a href="#" class="reply_logina">로그인</a>
						 "을 하시면 댓글을 등록할 수 있습니다."
					</span>
				</div>
			</div>
		</div>

		<div id="modal_all">
			<div id="content_layout">
				<div id="modal_header">
					게시글 삭제
					<span id="close_Btn">
						<i class="fa fa-close"></i>
					</span>
					<div id="modal_content">
						정말
						<span class="point">게시글</span>
						을 삭제하시겠습니까?
					</div>
					<div class="btn_Login">
						<a href="#" id="no_Btn">아니오</a>
						<a href="#" id="yes_Btn">네</a>
					</div>
				</div>
			</div>
		</div>


		
	</section>

</body>
</html>