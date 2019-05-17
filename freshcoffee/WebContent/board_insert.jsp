<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<style type="text/css">
	.content {
		border: 1px solid #fec9c9;
		margin: 200px auto;
		width: 750px;
		text-align: left;
		border-radius: 5px;
		padding: 20px;
		border-top: 25px solid #fec9c9!important;
		padding-bottom: 40px;
		box-shadow: 0 4px 10px 0 rgba(0,0,0,0.2), 0 4px 20px 0 rgba(0,0,0,0.19);
		height: 900px;
	}
	h3 {
		margin-left: 25px;
	}
	h4 {
		margin-top:30px;
		margin-left: 25px;
		margin-bottom: 10px;
	}
	.title_input input {
		margin:0 25px 30px 0;
		margin-left: 25px;
		width: 690px;
		height: 25px;
	}
	.insert_Content {
		margin-left: 25px;
	}
	.insert_Content textarea {
		width:690px;
		height: 400px;
	}
	label {
		font-size: 17px;
		color: black;
		display: block;
	}
	.writer {
	 	margin-left: 25px;
	 	margin-bottom: 10px;
	}
	.content_MiniTitle input {
		width: 690px;
		height: 25px;
	}
	.writer {
		margin-top: 20px;
	}
	.update_Btn {
		float: right;
		margin-right: 25px;
	}
	.file_Area {
		margin: 30px 0 0 0;
	}
	.file_Area input {
		margin-left:25px;
	}
	.update_Btn {
		width: 105px;
		height:30px;
	}
	.update_Btn > a {
		text-decoration: none;
		background-color: #FADAD8;
		display: inline-block;
		width:100px;
		height: 25px;
		color: white;
		text-align:center;
		line-height:25px;
	}
	.update_Btn > a:hover {
		background-color:#00dffc;
	}
	
</style>
</head>
<body>
	<header>
		
	</header>
	<section class="content">
		<div class="box">
			<form action="" name="" method="POST">
				<div class="insert_title">
					<h3>Q & A</h3>
					<label for="title"><h4>제목</h4></label>
					<span class="title_input"><input type="text" name="title" placeholder="제목을입력해주세요"></span>
					<span class="boardinsert_err"></span>
				</div>
	
				<div class="insert_Content">
					<label for="content"><div class="content_MiniTitle">내용</div></label>
					<textarea name="content"></textarea>
				</div>
				
				<div class="writer">
					<label for="writer"><div>작성자</div></label>
					<span class="content_MiniTitle">
						<input type="text"  readonly="readonly" name="writer">
					</span>
				</div>
				</form>

			<div class="file_Area">
				<span><input type="file" name="uploadfile" ></span>
				<span class="update_Btn"><a href="#">게시글등록</a></span>
			</div>

		</div>
		
	</section>
</body>
</html>