package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freshcoffee.dao.BoardDAO;
import com.freshcoffee.dto.BoardDTO;

public class BoardViewAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board/view.jsp";
		
		String bno = request.getParameter("bno");
//		System.out.println("게시글 번호" + bno);
		BoardDAO bDao = BoardDAO.getInstance();
		HttpSession session = request.getSession();
		
		// 조회수 증가(+1)
		bDao.viewCnt(bno, session);
		
		//게시글 1건 (상세조회)
		BoardDTO bDto = bDao.view(bno);
//		System.out.println(bDto.toString());
		request.setAttribute("one", bDto);
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}

}
