package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.freshcoffee.dao.MemberDAO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//16. Controller에서 전송한 request를 활용하여 member.jsp에서 보낸 id: memId를 가져와
		// id 변수에 담음
		String id = request.getParameter("id");
//		System.out.println("id>>>" + id);
		// 17. memberDAO 객체 빌려와 mDao에 담음
		
		MemberDAO mDao = MemberDAO.getInstance();
		// 18. MemberDAO 클래스의 idCheck()메서드 실행
		//		매개변수로 id값 전달
		String result = mDao.idCheck(id);
		//25. "-1" or "1"값을 result값에 담음
		
		// 26. Ajax 페이지로  결과값을 JSON방식으로 전달하기 위해 google json-simple 라이브러리를 사용하여 JSONObject 생성
		
		//Ajacx => JSON => return 할때 보내는 값도 JSON 방식
		JSONObject jObj = new JSONObject();
		
		//27. Ajax 전달할 데이터를 담음
//			  message변수에 result 담음
//			  id변수에 id 담음
		jObj.put("message", result);
		jObj.put("id", id);
		
		//28.JSON 객체에 담은 데이터를 호출한 페이지로 전송하는 기능
//			 호출한 페이지로 전송하는 기능
//			결론: message와 id를 가지고 Ajax로 이동!
		response.setContentType("application/x-json; charset=UTF-8"); // 데이터의 구격 정함 // 타입 잘못 쓰면 다운로드 창이나 탐색기 창 열림 
		response.getWriter().print(jObj); // 규격정한 데이터를 보낸다
		
		//AJAX 방식은 목적지가 자기 자신임으로 forward(목적지, 이동수단)을 return 할  필요 없음
		return null;
	}

}
