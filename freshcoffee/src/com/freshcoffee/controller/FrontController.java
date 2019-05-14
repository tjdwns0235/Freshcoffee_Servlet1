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
import com.freshcoffee.action.InfoUpdateAction;
import com.freshcoffee.action.LogoutAction;
import com.freshcoffee.action.MemberAction;
import com.freshcoffee.action.MemberPlayAction;
import com.freshcoffee.action.PwUpdateAction;

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
		
		//13. uri와 ctx를 빼서 command를 생성
		//	실행: /freshcoffee/idCheck.freshcoffee
		//	- /freshcoffee
		// 	/idCheck.freshcoffee >>> command
		
		
		//4 uri와 ctx를 빼서 경로를 생성한다
		// uri = /SHS/insert.shs
		// ctx = /SHS
		// uri - ctx = /insert.shs
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String command = uri.substring(ctx.length());
		System.out.println("페이지이동>>" + command);
		//14. 생성된 command 조건에 맞는 if문 실행
		
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
			//15. IdcheckAction 클래스 객체 생성
			//	  결과물: action 인스턴스
			//	 action 인스터스를 활용하여 excute() 메서드 실행
			// 	 매개변수로  Controller의 request와 response를 전송
			//   이동
			action = new IdCheckAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/memberPlay.freshcoffee")) {
			//15. IdcheckAction 클래스 객체 생성
			//	  결과물: action 인스턴스
			//	 action 인스터스를 활용하여 excute() 메서드 실행
			// 	 매개변수로  Controller의 request와 response를 전송
			//   이동
			action = new MemberPlayAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/logoutAjax.freshcoffee")) {
			action = new LogoutAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/infoUpdate.freshcoffee")) {
			action = new InfoUpdateAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/pwfoUpdate.freshcoffee")) {
			action = new PwUpdateAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/dropMember.freshcoffee")) {
			action = new DropMemberAction();
			forward = action.excute(request,response);
		}else if (command.contentEquals("/pwCheck.freshcoffee")) {
			action = new PwCheckAction();
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
