<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
<style type="text/css">
	.content {
		border: 1px solid black;
		margin: 200px auto;
		width: 750px;
		text-align: left;
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
	.writer {
	 	margin-left: 25px;
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
	.update_Btn a {
		text-decoration: none;
		background-color: orange;
		width:200px;
		height: 30px;
		text-underline: none;
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
					<h4>제목</h4>
					<span class="title_input"><input type="text" name="title" placeholder="제목을입력해주세요"></span>
				</div>
	
				<div class="insert_Content">
					<div class="content_MiniTitle">내용</div>
					<textarea></textarea>
				</div>
				
				<div class="writer">
					<div>작성자</div>
					<span class="content_MiniTitle">
						<input type="text" name="writer">
					</span>
				</div>
				</form>

			<div class="file_Area">
				<span><input type="file" name=""></span>
				<span class="update_Btn"><a href="#">게시글 수정</a></span>
			</div>

		</div>
		
	</section>
</body>
</html>