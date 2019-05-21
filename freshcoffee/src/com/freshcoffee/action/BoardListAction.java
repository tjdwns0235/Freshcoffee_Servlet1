package com.freshcoffee.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardListAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		return null;
		
		
		
		// 검색 설정(검색타입, 키워드)
		String search_option = null;
		String keyword = null;
		if (request.getParameter("keyword") != null) {
			search_option = request.getParameter("search_option");
			keyword = request.getParameter("keyword");
			criDto.setSearch_option(search_option);
			criDto.setKeyword(keyword);
			request.setAttribute("search_option", search_option);
			request.setAttribute("keyword", keyword);
			System.out.println("검색타입:" + search_option);
			System.out.println("검색키워드: " + keyword);
		}
	}

}
