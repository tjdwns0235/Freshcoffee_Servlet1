package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freshcoffee.dao.MemberDAO;
import com.freshcoffee.dto.MemberDTO;

public class PwUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.freshcoffee";
//		HttpSession session = request.getSession(); 1번 방법
//		session.getAttribute("loginUser.id");
		String id = request.getParameter("id");
		String pw = request.getParameter("newpw"); //새비밀번호의 Input Name이 newpw
		
		//패스워드 수정
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.pwUpdate(id, pw);
		
		if (result > 0) {
			HttpSession session = request.getSession();
			MemberDTO mDto = mDao.memOne(id);
			
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}

}
