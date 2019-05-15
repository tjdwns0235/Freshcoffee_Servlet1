<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
</head>
<body>
<!--에러메시지에 클래스로 pwAjax 설정해라  -->
	
	<input name="id" type="hidden" value="${sessionScope.loginUser.id}">  <!--form태그 밑에 둔다 2번째 방법  -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		var currentPw = false;
		var newPwEq = false;
	
	 	$(document).on("blur", "#pw_now", function(){
	 		//Ajax를 활용하여 입력한 비번과 현재 비번이 일치하는지 확인
	 		
	 		var nowPw = $("#pw_now").val(); //입력한 비밀번호
	 		var nowId = "${sessionScope.loginUser.id}";
	 		
	 		if (nowPw != null || nowPw.length != 0) {
				currentPw = ajaxPwCheck();
			}
	 	});
	 			
	 			$('.btn_agree').click(function(){
	 				var postPw = $('#pw_now').val(); //현재 비밀번호의 #(ID)
	 				var newPw = $('#inputpw').val();
	 				
	 				
	 				if (!currentPw) {
	 				// 1.현재비밀번호가 맞는지 확인
	 					$('#pw_now').focus();
						return false;
					} else if (!newPwEq) {
						$('#inputpw').focus();
						// 2. 새비밀번호와 새비밀번호 확인 유효성 체크
						return false;
					} else if(postPw == newPw) {
						// 3. 현재비밀번호와 새 비밀번호가 같으면 체크
						//alert(postPw + "," + newPw);
						$('#inputpw').focus();
						$('#inputpw').next().test('현재비밀번호와 다르게 입력해주세요')
											.css('display', 'block')
											.css('color','tomato');
						return false;
					}
	 				
	 					
	 			
	 				$('#frm_mem').submit();
	 			});
	 	});
});
	</script>
</body>
</html>