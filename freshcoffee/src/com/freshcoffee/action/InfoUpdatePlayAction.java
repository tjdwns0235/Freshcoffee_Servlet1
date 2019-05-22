package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.freshcoffee.dao.MemberDAO;
import com.freshcoffee.dto.MemberDTO;


public class InfoUpdatePlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.freshcoffee";
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email_id");
		String email_url = request.getParameter("email_url");
		String bemail = email + "@" + email_url;
		String zipcode = request.getParameter("zipcode");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String bir1 = request.getParameter("bir1");
		String bir2 = request.getParameter("bir2");
		String bir3 = request.getParameter("bir3");
		
		
		MemberDTO mDto = new MemberDTO(id, name, phone, email, email_url, zipcode, addr1, addr2, bir1, bir2, bir3);
		MemberDAO mDao = MemberDAO.getInstance();
		int result = mDao.mem_update(mDto);
		
		if(result > 0) {
			System.out.println("수정 성공");
			mDto = mDao.mem_one(id);
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", mDto);
		} else {
			System.out.println("수정 실패");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true);
	
		return forward;
	}

}


