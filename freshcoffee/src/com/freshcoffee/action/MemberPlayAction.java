package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freshcoffee.dto.MemberDTO;

public class MemberPlayAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.freshcoffee";
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pwd1");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String email_url = request.getParameter("url");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String zipcode = request.getParameter("zipcode");
		String bir1  = request.getParameter("bir1");
		String bir2  = request.getParameter("bir2");
		String bir3  = request.getParameter("bir3");
		MemberDTO mDto = new MemberDTO(id, pw, name, phone, email, email_url, zipcode, addr1, addr2, bir1, bir2, bir3);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(true); //sendDirect
		// 값이 변할때 redirect
		// 값이 안 변할때 forward
		
		return forward;
	}

}
