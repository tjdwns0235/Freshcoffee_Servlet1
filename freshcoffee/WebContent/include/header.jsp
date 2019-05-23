<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/css/common.css?v=1">
<link rel="stylesheet" href="${path}/css/header.css?v=1">
<title>Insert title here</title>
</head>
<body>
	<button id="topBtn">
		<i class="fas fa-arrow-up"></i>
	</button>
	<header>
		<div class="header_menu"> 
			<div class="inner_header">
				<div class="header_sns">
					<a href="#"><i class="fab fa-instagram"></i></a>
					<a href="#"><i class="fab fa-facebook-f"></i></a>
					<a href="#"><i class="fab fa-twitter"></i></a>
					<a href="#"><i class="fab fa-google"></i></a>

				</div>
				<div class="header_member">
					<ul>
						<li><a href="#">로그인</a></li>
						<li><a href="${path}/constract.freshcoffee">회원가입</a></li>
						<li><a href="#">정보수정</a></li>
						<li><a href="#" class="mypage">마이페이지</a>
							<div class="dropdown">
							     <a href="#" >나의 주문</a>
							     <a href="#" >장비구니</a>
							     <c:choose>
								     <c:when test="${!empty sessionScope.loginUser}">
									     <a href="${path}/pwUpdate.freshcoffee">비밀번호 수정</a>
										 <a href="${path}/infoUpdate.freshcoffee">회원수정</a>
										 <a href="${path}/dropMember.freshcoffee">회원탈퇴</a>
									 </c:when>
								 </c:choose>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="header_logo">
			<div class="inner_header">
				<img src="${path}/img/freshcoffee2.png" alt="로고이미지">
			</div>
		</div>
    </header>
    nav>
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
    <script type="text/javascript">
		$(document).ready(function() {
			$(window).scroll(function(){
				var scrolValue = $(this).scrollTop();
				if (scrolValue > 40) {
					$('#topBtn').fadeIn();
				} else {
					$('#topBtn').fadeOut();
				}
			});
			$('#topBtn').click(function(event) {
				$('html, body').animate({scrollTop : 0}, 500);
			});
			/* $(document).on('click', 'logout_btn', function(){
				$.ajax({
					url: "logoutAjax",
					type: "POST",
					dataType: "json",
					success: function(data) {
						location.reload();
					},
					error: function() {
						alert("System Error");
					}
				});
			}); */
		});
	</script>
</body>
</html>