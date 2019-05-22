<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../include/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="commentList">
		<div id="reply_Wrap_title">
			<span id="knboard_detail_rspan">댓글 ${replyList.size()}</span>
		</div>
		
		<c:choose>
			<c:when test ="${empty sessionScope.loginUser}">
				<div id="detail_replay">
					<c:forEach items="${empty sessionScope.loginUser}">
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
					</c:forEach>
				</div>
			</c:when>
		</c:choose>
	</div>

</body>
</html>