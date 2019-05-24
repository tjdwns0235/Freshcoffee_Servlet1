package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InfoUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member/info_update.jsp";
		
		// 로그인 된 유저만 회원수정 가능
		HttpSession session = request.getSession();
		
		//게스트유저라면 index 돌려보냄
		if (session.getAttribute("loginUser") == null) {
			url = "index.freshcoffee";
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
