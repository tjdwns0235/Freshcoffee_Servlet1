<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<style type="text/css">
	@import url('https://fonts.googleapis.com/css?family=Caveat|Yeon+Sung');
	*,body {
		margin: 0;
		padding: 0;
		font-family: 'Yeon Sung', cursive;
	}
	.content {
		width: 1000px;
		box-sizing: border-box;
		border: 1px solid black;
		margin: 230px auto;
		border-radius: 15px;
		padding: 15px;
	}
	.table {
		width: 950px;
		border: 1px solid black;
		border-collapse: collapse; 
	}
	th. td {
		border: 1px solid black;
		font-family: 'Yeon Sung', cursive;
	}
	th {
		height: 35px;
		background-color: pink;
		text-align: center;
		color: white;
	}
	td {
		height: 35px;
		text-align: center;
		background-color: white;
	}
	td:nth-child(2) {
		text-align: left;
		padding-left: 10px;
	}
	.btn {
		padding: 7px 15px;
		font-size: 14px;
		border-radius: 20px;
		background-color: skyblue;
		color:white;
		border:0;
		float: right;
		outline: none;
	}
	.btn:hover {
		background-color: orange;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
	}
	.pagination > li {
		display: inline-block;
		border: 1px solid black;
		height: 20px;
		text-align: center;
		border-radius: 4px;
		vertical-align: center;
	}
	.pagination a {
		width: 20px;
		padding: 0 7px;
		line-height: 24px;	
		background-color: white;
		color: black;	
	}
	a {
		text-decoration: none;
		color: black;
	}
	.text_center {
		text-align: center;
	}
	.board_pagination {
		clear: both;
		text-align: center;
	}
	.active {
		background-color: #2c3e50;
		color: white;

	}
	#div_search {
		float: right;
		margin:10px 0 20px;
	}
	#searchboard {
		height: 29px;
		width: 200px;
		margin:0 10px;
		border: 1px solid #cccccc;
		border-radius: 20px;
		outline: none;
		padding-left: 8px;
	}
	.btn_Search {
		margin-top: 0;
	}
	#selsearch {
		height: 29px;
		width: 100px;
		font-size: 15px;
		float: left;
		border-radius: 20px;
		outline: none;
	}
	.new_Time {
		background-color: #ff8224;
		font-size: 11px;
		color: white;
		border-radius: 20px;
		padding: 2px 5px;
		animation-name: twinkle;
		animation-duration: 1.2s;
		animation-iteration-count: infinite; 
	}
	.replyCnt_color {
		background-color: rgb(231, 29, 54);
		font-size: 11px;
		color:white;
		border-radius: 20px;
		padding:2px 5px;
	}
	@keyframes twinkle {
    0%   {opacity: 0;}
    100% {opacity: 1;}
	}
	.box h3 {
		margin: 20px 0 10px 0;
		display: block;
		font-size: 30px;
		font-family: 'Caveat', cursive!important;
	}
	.box-body {
		margin-top: 7px;
	}
	#orderGood {
		background-color: #FF0000;
	}
	#order_board {
		display: inline-block;
	}
	#order_board > span {
		margin-right: 8px;
		display: inline-block;
		height: 29px;
		line-height: 40px;
	}
	#orderGood i {
		font-size: 12px;
		margin-right: 2px;
		display: inline-block;
	}
	.pagination * {
		font-family: 'Sunflower', sans-serif!important;
		display: inline-block;
		height: 24px;
	}
</style>
</head>
<body>
	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<h3>Q & A</h3>
				</div>
				<div>
					<div id="order_board">
						<span>
							<a href="#" id="orderNew">최신순</a>
						</span>
						<span>
							<a href="#" id="orderGood">추천순</a>
						</span>
						<span>
							<a href="#" id="orderReply">댓글순</a>
						</span>
						<span>
							<a href="#" id="ordrCnt">조회순</a>
						</span>
					</div>
					<button id="boardAdd" class="btn btn-Primary">게시글 등록</button>
				</div>
			</div>
			<div class="box-body">
				<table class="table table-boarded">
					<tbody>
					<tr style="width:12px">
						<th style="width: 50px">No.</th>
						<th style="width: 450px">제목</th>
						<th style="width: 150px">작성자</th>
						<th style="width: 130px">작성일</th>
						<th style="width: 60px">좋아요</th>
						<th style="width: 60px">조회수</th>
						<th style="width: 60px">첨부</th>
					</tr>
					<tr>
						<td class="text_center" style="background-color: white;">263</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								게시판디자인하기싫다
								<span class="replyCnt_color">1</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>

					<tr>
						<td class="text_center" style="background-color: white;">262</td>
						<td style="background-color: white;" class="title_table">
							<a href="#">
								"JAVA 너무 재밌다!"
								<span class="replyCnt_color">2</span>
								<span class="new_Time">new</span>
							</a>
						</td>
						<td style="background-color: white;">popotaze</td>
						<td style="background-color: white;" class="text_center">
							"10:13:52"
						</td>
						<td style="background-color: white;" class="text_center">
							<span>
								<i class="fa fa-heart">
								</i>
								"0"
							</span>
						</td>
						<td style="background-color: white;" class="text_center">6</td>
						<td style="background-color: white;" class="text_center"></td>
					</tr>
			</tbody>
		</table>

		<div id="div_search">
			<select id="selsearch" name="selsearch">
				<option value="3" selected="selected" >조건선택</option>
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">제목+내용</option>
				<option value="4">작성자</option>
			</select>
			<input type="text" placeholder="검색할내용을 입력해주세요!" name="searchboard" id="searchboard">
			<a href="#" id="search_Btn" class="btn btn_Search">검색</a>
		</div>

		<div class="board_pagination">
			<ul class="pagination">
				<li class="active">
					<a href="#"><i class="fas fa-angle-left"></i></a>
				</li>
				<li class="active">
					<a href="#"><i class="fas fa-angle-double-left"></i></a>
				</li>
				<li class="active">
					<a href="#">1</a>
				</li>
				<li class="active">
					<a href="#">2</a>
				</li>
				<li class="active">
					<a href="#">3</a>
				</li>
				<li class="active">
					<a href="#">4</a>
				</li>
				<li class="active">
					<a href="#">5</a>
				</li>
				<li class="active">
					<a href="#">6</a>
				</li>
				<li class="active">
					<a href="#">7</a>
				</li>
				<li class="active">
					<a href="#">8</a>
				</li>
				<li class="active">
					<a href="#">9</a>
				</li>
				<li class="active">
					<a href="#">10</a>
				</li>
				<li class="active">
					<a href="#"><i class="fas fa-angle-right"></i></i></a>
				</li>
				<li class="active">
					<a href="#"><i class="fas fa-angle-double-right"></i></i></a>
				</li>
			</ul>
		</div>
			</div>
		</div>
	</section>

</body>
</html>