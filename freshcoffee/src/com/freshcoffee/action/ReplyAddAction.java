package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freshcoffee.dao.ReplyDAO;
import com.freshcoffee.dto.ReplyDTO;


public class ReplyAddAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("re_bno"));
		String writer = request.getParameter("re_writer");
		String content = request.getParameter("re_textarea");
		
		ReplyDTO rDto = new ReplyDTO(content, writer, bno);	
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyAdd(rDto);
		
		if (result > 0) {
			System.out.println("성공");
			// 해당게시글 댓글 카운트 1증가
		} else {
			System.out.println("실패");
		}
		
		return null;
	}

}
