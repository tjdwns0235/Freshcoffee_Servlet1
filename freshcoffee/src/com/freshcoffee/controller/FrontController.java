package com.freshcoffee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freshcoffee.action.Action;
import com.freshcoffee.action.ActionForward;
import com.freshcoffee.action.ConstractAction;
import com.freshcoffee.action.IdCheckAction;
import com.freshcoffee.action.IndexAction;
import com.freshcoffee.action.MemberAction;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
        
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글깨짐 방지(Post방식): 가장 위에 적어야 함.
		request.setCharacterEncoding("UTF-8");
		
		Action action = null;
		ActionForward forward = null; 
		
		
		//4 uri와 ctx를 빼서 경로를 생성한다
		// uri = /SHS/insert.shs
		// ctx = /SHS
		// uri - ctx = /insert.shs
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		System.out.println("페이지이동>>" + command);
		
		if (command.contentEquals("/index.freshcoffee")) {
			action = new IndexAction();
			forward = action.excute(request,response);
		} else if (command.contentEquals("/constract.freshcoffee")) {
			action = new ConstractAction();
			forward = action.excute(request,response);
		} else if (command.contentEquals("/member.freshcoffee")) {
			action = new MemberAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/idCheck.freshcoffee")) {
			action = new IdCheckAction();
			forward = action.excute(request,response);
		}
		
		
	
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}
		}
	}


}
