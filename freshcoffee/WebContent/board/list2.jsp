<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/resources/css/list.css?v=1">
<style type="text/css">
     .box_wrap, .box1, .box2{
           box-sizing:content-box;
     }
     pagination_i > i{
           line-height: 15px!important;
     }
     .fas{
           line-height: 1.5!important;
     }
     .container{
           width: 500px;
           margin: 0 auto;
     }
     .new_time{
           background-color: #FF8224;
           font-size: 11px;
           color:white;
           border-radius: 25px;
           padding: 2px 5px;
           animation-name:twinkle;
           animation-duration:1.2s;
           animation-iteration-count:infinite;
     }
     @keyframes twinkle{
           0% {opacity:0;}
           100% {opacity:1;}
     }
     .replyCnt_Color{
           color : tomato;
     }
     .pagination {
           font-size:15px;
           display: inline-block;
     }
     .pagination a {
       color: black;
       float: left;
       padding: 5px 10px;
       text-decoration: none;
       text-align:center;
       transition: background-color .3s;
       border: 1px solid #ddd;
       height: 20px;
       width: 10px;
       line-height: 20px;
     }
     .pagination a.active {
       background-color: #B7F0B1;
       color: gray;
       border: 1px solid #B7F0B1;
       border-radius: 0px;
     }
     .pagination a:hover:not(.active) {
           border-radius: 0px;
           background-color: #ddd;
     }
     #search_result{
           position: absolute;
           bottom: 0;
           right: 0;
           font-size: 14px;
     }
     .search_span{
           color:tomato;
     }
     .board_content_title > a{
           color : black;
     }
</style>
</head>
<body>
     <div class="all_wrap">
           <div class="board_wrap">
           
                <div class="board_header">
                     <div class="board_title">
                           게시판 제목
                     </div>
                     <div class="board_array">
                           <div class="array_content"><a href="${path}/board/list?sort_option=new&keyword=${map.keyword}&search_option=${map.search_option}" id="orderNew">최신순</a></div>
                           <div class="array_content"><a href="${path}/board/list?sort_option=good&keyword=${map.keyword}&search_option=${map.search_option}" id="orderGood">추천순</a></div>
                           <div class="array_content"><a href="${path}/board/list?sort_option=reply&keyword=${map.keyword}&search_option=${map.search_option}" id="orderReply">댓글순</a></div>
                           <div class="array_content"><a href="${path}/board/list?sort_option=view&keyword=${map.keyword}&search_option=${map.search_option}" id="orderCnt">조회순</a></div>  
                     </div>
                     
                     <c:if test="${!empty map.keyword}">
                           <div id = "search_result">
                                <span class="search_span">"${map.keyword}"</span>로 검색한 결과는
                                <span class="search_span">"${map.count}"</span>건 입니다.
                           </div>
                     </c:if>
                </div>
                <div class="board_body">
                     <div class="content_title">
                           <div class="content_box board_content_num">NO.</div>
                           <div class="content_box board_content_title">제목</div>
                           <div class="content_box board_content_user">작성자</div>
                           <div class="content_box board_content_day">작성일</div>
                           <div class="content_box board_content_good">좋아요</div>
                           <div class="content_box board_content_view">조회수</div>
                           <div class="content_box board_content_file">첨부</div>
                     </div>
                     <c:forEach items="${map.list}" var="bDto">
                           <!-- 현재시간 구하기 -->
                           <jsp:useBean id="now" class="java.util.Date"/>
                           <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today"/>
                           <fmt:formatDate value="${bDto.regdate}" pattern="yyyy-MM-dd" var="regdate"/>
                           <div class="content_body">
                                <div class="content_box board_content_num">${bDto.bno}</div>
                                <div class="content_box board_content_title">
                                     <a class="view_link" href="${path}/boardView.makefree?bno=${bDto.bno}">
                                           ${bDto.title}
                                     </a>
                                     <c:if test="${bDto.replycnt > 0}">
                                           <span class="replyCnt_Color">( ${bDto.replycnt} )</span>
                                     </c:if>
                                     <c:if test="${today == regdate}">
                                           <span class="new_time">New</span>
                                     </c:if>
                                </div>
                                
                                
                                <div class="content_box board_content_user">${bDto.writer}</div>
                                <div class="content_box board_content_day">
                                     <c:choose>
                                           <c:when test="${today == regdate}">
                                                <fmt:formatDate pattern="hh:mm:ss" value="${bDto.regdate}" />
                                           </c:when>
                                           <c:otherwise>
                                                <fmt:formatDate pattern="yyyy-MM-dd" value="${bDto.regdate}" />      
                                           </c:otherwise>
                                     </c:choose>                
                                </div>
                                <div class="content_box board_content_good"><i class="fas fa-heart"></i> ${bDto.goodcnt}</div>
                                <div class="content_box board_content_view"><i class="far fa-eye"></i> ${bDto.viewcnt}</div>
                                <div class="content_box board_content_file">
                                     <c:if test="${bDto.filesize > 0}">
                                           <i class="fas fa-paperclip" style="color:slateblue;"></i>
                                     </c:if>
                                </div>
                           </div>
                     </c:forEach>	
                </div>
                <div class="board_footer">
                     <div class="border_page">
                           <div class="container">
                                <div class="pagination">
                                     <c:if test="${map.pager.curBlock > 1}">
                                           <a href="${path}/board/list?curPage=1&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" class="pagination_i"><i class="fas fa-angle-double-left"></i></a>
                                           <a href="${path}/board/list?curPage=${map.pager.blockBegin - 10}&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" class="pagination_i"><i class="fas fa-angle-left"></i></a>
                                     </c:if>
                                     
                                     <c:forEach begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}" var="idx">
                                           <a href="${path}/board/list?curPage=${idx}&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" <c:out value="${map.pager.curPage == idx ? 'class=active':''}"/>>
                                                ${idx}
                                           </a>
                                     </c:forEach>
                                     
                                     <c:if test="${map.pager.curBlock < map.pager.totBlock}">
                                           <a href="${path}/board/list?curPage=${map.pager.blockEnd + 1}&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}" class="pagination_i">
                                                <i class="fas fa-angle-right"></i>
                                           </a>
                                           <a href="${path}/board/list?curPage=${map.pager.totPage}&sort_option=${map.sort_option}&keyword=${map.keyword}&search_option=${map.search_option}"  class="pagination_i">
                                                <i class="fas fa-angle-double-right"></i>
                                           </a>
                                     </c:if>
                                </div>
                           </div>
                     </div>
                     <div class="board_footer_btn">
                           <div class="board_search">
                                <select id="selset_board" name="selset_board">
                                <option value="all" selected="selected">제목+내용</option>
                                <option value="title">제목</option>         
                                <option value="content">내용</option>
                                <option value="writer">작성자</option>
                           </select>
                                <div class="board_search_bar">
                                     <input type="text" name="" id="input_search" placeholder="검색">
                                     <div class="search_i"><i class="fas fa-search"></i></div>
                                </div>
                           </div>
                           <div class="board_insert">게시글 등록</div>
                     </div>
                </div>
           </div>
     </div>
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script type="text/javascript">
           $(document).ready(function() {             
                
                var sort_option = "${map.sort_option}";
                $('.array_content > a').css("color", "black").css("font-weight", "400");
                if(sort_option == "new"){
                     $('#orderNew').css("color", "red").css("font-weith", "700");
                } else if(sort_option == "good"){
                     $('#orderGood').css("color", "red").css("font-weith", "700");
                } else if(sort_option == "reply"){
                     $('#orderReply').css("color", "red").css("font-weith", "700");
                } else if(sort_option == "view"){
                     $('#orderCnt').css("color", "red").css("font-weith", "700");
                }
                
                $('.search_i').click(function(event) {
                     var search_option = $('#selset_board').val();
                     var keyword = $.trim($('#input_search').val());
                     /* alert(search_option + ", " + keyword); */
                     
                     if(keyword == null || keyword.length == 0){
                           $('#input_search').focus();
                           return false;
                     }
                     location.href="${path}/board/list?search_option="+search_option+"&keyword="+keyword;
                });
                
/*              $('#input_search').focus(function(event) {
                     $('.board_search_bar').css('width', '400px')
                                                  .css('background-color', 'white')
                                                  .css('transition', '.7s');
                     $('#input_search').css('background-color', 'white')
                                            .css('transition', '.7s');
                });
                $('#input_search').blur(function(event) {
                     $('.board_search_bar').css('width', '120px')
                                                  .css('background-color', '#f8f8f8')
                                                  .css('transition', '.7s');
                     $('#input_search').css('background-color', '#f8f8f8')
                                             .css('transition', '.7s')
                                             .val("");
                }); */
                $('.board_insert').click(function(event) {
                     
                     $.ajax({
                           type:"POST",
                           url: "registerAjax.makefree",
                           dataType: "json",
                           success:function(data){
                                if(data.message == "login"){
                                     location.href = "registerView.makefree";
                                }else if(data.message == "nologin") {
                                     
                                     $('#modal').css('display', 'flex');
                                     $('#inputid').focus();
                                     $('.err_code').last().css('display','block')
                                                                 .css('color', '#ff1616')
                                                                .text('로그인이 필요합니다.');
                                }
                                
                           },
                           error: function(){
                                alert("System Error!!!")
                           }
                     });
                });
                
                
           });
     </script>
     <%@ include file="../include/footer.jsp" %>
     
</body>
</html>