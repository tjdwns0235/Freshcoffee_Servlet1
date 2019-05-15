package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.freshcoffee.dao.MemberDAO;

public class PwCheckAction implements Action{
	


	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println(id + "," + pw);
		MemberDAO mDao = MemberDAO.getInstance();
		boolean flag = mDao.pwCheck(id, pw);
		
		JSONObject jObj = new JSONObject();
		jObj.put("flag", flag);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		return null;
	}
	
}
