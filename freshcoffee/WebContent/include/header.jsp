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
							     <choose>
								     <c:when test="${!empty sessionScope.loginUser}">
									     <a href="pwUpdate.freshcoffee">비밀번호 수정</a>
										 <a href="infoUpdate.freshcoffee">회원수정</a>
										 <a href="dropMember.freshcoffee">회원탈퇴</a>
									 </c:when>
								 </choose>
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