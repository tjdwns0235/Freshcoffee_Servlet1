package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

public class RegisterAjaxAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "board.register.jsp";
		
		HttpSession session = request.getSession();
		
		String message = "";
		
		if (session.getAttribute("loginUser") == null) {
			//로그인 => 모달창 뛰우고, 경고메시지 출력
			message = "nologin";
		} else {
			message = "login";
		}
		
		JSONObject jObj = new JSONObject();
		jObj.put("message", message);
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter()
		
		
		
		return null;
	}

}
