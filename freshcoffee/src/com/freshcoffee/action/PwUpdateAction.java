package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PwUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.freshcoffee";
//		HttpSession session = request.getSession(); 1번 방법
//		
//		session.getAttribute("loginUser.id");
		
		String pw = request.getParameter("newpw"); //새비밀번호의 Input Name이 newpw
		
		//패스워드 수정
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
