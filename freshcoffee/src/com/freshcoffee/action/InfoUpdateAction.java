package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freshcoffee.dao.MemberDAO;
import com.freshcoffee.dto.MemberDTO;

public class InfoUpdateAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "member/info_update.jsp";
		int result;
		MemberDTO mDto = new MemberDTO();
		MemberDAO mDao = new MemberDAO();
		
		// 로그인 된 유저만 회원수정 가능
		HttpSession session = request.getSession();
		
		//게스트유저라면 index 돌려보냄
		if (session.getAttribute("loginUser") == null) {
			url = "index.freshcoffee";
		}
		
		if (result > 0) {
			mDto = mDao.memOne(id);
			
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		}
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
		
		return forward;
	}
	
}
