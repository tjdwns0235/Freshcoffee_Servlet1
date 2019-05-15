package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DropMemberAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member_delete.freshcoffee";
		
		HttpSession session = request.getSession(); 
//		session.getAttribute("loginUser.id");
		if (session.getAttribute("loginUser") == null) {
			url = "index.freshcoffee";
		}
		
		
		
		//패스워드 수정
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
