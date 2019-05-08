<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		@import url('https://fonts.googleapis.com/css?family=Cute+Font');

		

		
		 .inner_header2 ul > li  {
			float: left;
			text-align: center;
			margin: 0px;
			height: 85px;

			
		}
		.inner_header2 {
			padding: 0;
			max-width: 1440px;
			margin: 0 auto;
			height: 85px;

		}
		.inner_header2 > ul {
			display: flex;
			justify-content: space-between;
		}
		/*.inner_header2 > ul> li > a {
			text-decoration: none;
			font-size: 23px;
			height: 85px;
			margin: 0 60px;
			
		}*/
			
		.inner_header2 ul  li  a {
			text-decoration: none;
			position: relative;
			color: #363636;
			font-weight: 20px;
			font-family: sans-serif;
			display: block;
			overflow: hidden;
			transition: 0.4s all;
			line-height: 85px;
			
		}
		.li1 {
			
			text-decoration: none;
			font-size: 23px;
			height: 85px;
			margin: 0 60px;
		}
		

		
		.inner_header2 ul li > a:before {
			content: '';
			width: 500px;
			position: absolute;
			border-bottom: 2px solid #484848;
			bottom: 0;
			right: 1000px;
			transition: 0.4s all;
		}
		.inner_header2 ul li a:hover:before {
			right: 0;
		}
		.dropdown1 > a {
			/*width: 100px;*/
			margin: 0 auto;
			background-color: #FADAD8;
			font-size: 20px;
		}
		.dropdown1 > a:hover {
			transform: scale(1.1);
		}
		.dropdown1 {
			background-color: white;
			box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.05);
			z-index: 5;
			display: none;
			color:;
			/*position:absolute;*/
		}

		.inner_header2 > ul > li:hover .dropdown1 {
			display: block;
				
		}
		.inner_header2 > ul > li:hover .a {
			background-color: #FADAD8;
		}
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
		.new_product > span {
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
		.new_product_box {
			flex: 1;
		}
		.new_product_menu {
			/*border: 1px solid blue;*/
			width: 1200px;
			margin: 0 auto;
			display: flex;
			height: auto;
			justify-content: space-evenly;
		}
		.new_product_menu img {
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
	 <%@ include file="include/header.jsp" %>
	 

	<nav>
		<div class="header_nav">
			
			<div class="inner_header2">
				<ul>
					
					<li><a href="#" class="li1">북아메리카</a>
						<div class="dropdown1">
							<a href="#" >멕시코</a>
							<a href="#">하와이</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">중앙/남아메리카</a>
						<div class="dropdown1">
							<a href="#">과테말라</a>
							<a href="#">도미니카</a>
							<a href="#">볼리비아</a>
							<a href="#">브라질</a>
							<a href="#">엘살바도르</a>
							<a href="#">자메이카</a>
							<a href="#">코스타리카</a>
							<a href="#">콜롬비아</a>
							<a href="#">파나마</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">아시아</a>
					<div class="dropdown1">
							<a href="#">베트남</a>
							<a href="#">인도네시아</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">아프리카</a>
						<div class="dropdown1">
							<a href="#">에티오피아</a>
							<a href="#">케냐</a>
							<a href="#">탄자니아</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">오세아니아</a>
						<div class="dropdown1">
							<a href="#">파푸아뉴기니</a>
						</div>
					</li>
					
					<li><a href="#" class="li1">자주하는질문</a>
						<div class="dropdown1">
							<a href="#">Q & A</a>
							<a href="#">문의하기</a>
						</div>
					</li>

					</li>
				</ul>
			</div>
		</div>
	</nav>
	<section>
	   <div class="bodyall">
		 	<div class="bodycontent">
				<img src="${path}/img/coffee2.JPG" alt="커피홈1">

				
					
					<div class="new_product"><span>Best Product</span></div>
	
						<c:forEach items="${bestList}" var="best">
						<div class="new_product_menu">
							<div class="new_product_box">
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

				 				<li class="displayitem_price">
				 					<strong class="title_displayitem">
				 						<span>판매가</span>
				 						:
				 					</strong>
				 					<span>${best.p_price}</span>
				 				</li>
				 		   		</div>
				 		   </div>
				 		   </c:forEach>

		 
		</div>
		  </div>    
	</section>
</body>
</html>