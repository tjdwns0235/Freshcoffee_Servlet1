package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freshcoffee.dao.BoardDAO;
import com.freshcoffee.dao.ReplyDAO;
import com.freshcoffee.dto.ReplyDTO;

public class ReplyRemoveAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String strbno = request.getParameter("bno");
		int rno = Integer.parseInt(request.getParameter("rno"));
		
		ReplyDAO rDao = ReplyDAO.getInstance();
		int result = rDao.replyRemove(rno);
		
		if (result == 1) {
			System.out.println("성공");
			BoardDAO bDao = BoardDAO.getInstance();
			String flag = "minus";
			bDao.replyCntUpdate(strbno, flag);
		}
		
		
		return null;
	}

}
