<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
</head>
<body>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	 	$(document).on("blur", "#pw_now", function(){
	 		//Ajax를 활용하여 입력한 비번과 현재 비번이 일치하는지 확인
	 		
	 		var nowPw = $("#pw_now").val(); //입력한 비밀번호
	 		var nowId = "${sessionScope.loginUser.id}";
	 		
	 		if (nowPw != null || nowPw.length != 0) {
				$.ajax({
					url: 'pwCheck.freshcoffee',
					type: 'POST',
					dataType: 'json',
					data: 'id='+nowId+'&pw='+nowPw,
					success: function(data) {
						
					},
					error:function() {
						alert("System Error!!!!");
					}
				});
			}
	 	});
	</script>
</body>
</html>