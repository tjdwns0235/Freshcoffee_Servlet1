<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="include/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		@import url("https://fonts.googleapis.com/css?family=Cute+Font");
		.bodyall {
			width: 100%;
		}
		.bodycontent {
			width: 1440px;
			margin: 0 auto;
			border: 1px solid black;
			text-align: center;
			height: auto;
		}
		.bodycontent > img {
			width: 1300px;
			height: 324px;
			margin: 0 auto;
			margin-top: 30px;

		}
		.product_title > span {
			font-size: 28px;
			font-weight: 600;
			font-family: 'Source Serif Pro', serif;
			display: flex;
			justify-content: center;
			margin-top: 70px;
			margin-bottom: 40px;

		}
		#topBtn {
			position: fixed;
			bottom: 40px;
			right: 40px;
			font-size: 22px;
			width: 50px;
			height: 50px;
			background: #FADAD8;
			color: white;
		    border: none;
			cursor: pointer;
			border-radius: 50%;
			outline:none;
			display: none;
		}
		#topBtn i {
			transition: .3s;
		}
		#topBtn:hover i {
			transform: scale(1.3);
		}
		#topBtn:hover {
			background: #d6ecfa;
		}
		.product_box {
			flex: 1;
		}
		.product_menu {
			/*border: 1px solid blue;*/
			width: 1200px;
			margin: 0 auto;
			display: flex;
			height: auto;
			justify-content: space-evenly;
		}
		.product_menu img {
			width: 240px;
			height: 230px;
			flex: 1;
		}
		.coffename {
			font-size: 17px;
		}
		.displayitem_price {
			list-style: none;
			font-size: 17px;
		}
		.name a {
			text-decoration: none;
		}
		.name {
			border-bottom: 1px solid #ddd;
			border-bottom-width: 1px;
			display: inline-block;
			width: 240px;
			margin: 0 auto;
		}
		.click {
			color: black;
		}
		.click:hover {
			color:   #A593E0;
		}
		.displayitem_price:hover {
			color: #00dffc;
		}
	</style>
</head>
<body>
	<section>
	   <div class="bodyall">
		 	<div class="bodycontent">
				<img src="${path}/img/coffee2.JPG" alt="커피홈1">
					<div class="product_title"><span>Best Product</span></div>
						<div class="product_menu">
								<c:forEach items="${bestList}" var="best">
									<div class="product_box">
				 						<a href="#"><img src="${path}/img/${best.p_img}" alt="상품이미지 케냐"></a>
				 							<p class="name">
			 								<a href="#" class="click">
			 								<strong class="title_displayitem">
				 							<span>상품명</span>
				 								:
				 							</strong>
				 							<span class="coffename">${best.p_name}</span>
				 							</a>
				 							</p>

					 					<li>
						 					<strong class="title_displayitem">
						 						<span>판매가</span>
						 						:
						 					</strong>
						 					<span>${best.p_price}</span>
					 					</li>
			 		   				</div>
		 		   				</c:forEach>
		 		   		</div>
					</div>
			  </div>    
			</div>
	</section>
</body>
</html>