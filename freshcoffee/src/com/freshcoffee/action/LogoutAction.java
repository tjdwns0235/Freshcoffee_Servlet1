package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public class LogoutAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		if (session != null) {
			//session  초기화
			session.invalidate();
		}
		
		JSONObject jObj = new JSONObject();
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(jObj);
	
			
		return null;
	}

}
