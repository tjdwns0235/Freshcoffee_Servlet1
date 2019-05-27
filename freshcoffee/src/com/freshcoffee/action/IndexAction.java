package com.freshcoffee.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.freshcoffee.dao.ProductDAO;
import com.freshcoffee.dto.ProductDTO;



public class IndexAction implements Action {

	@Override
	public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "index.jsp";
		
		
		System.out.println("index,exec");
		ProductDAO pDao = ProductDAO.getInstance();
		List<ProductDTO> bList = pDao.bestList();
//		List<ProductDTO> nList = pDao.newList();
		
//		for (ProductDTO productDTO : bList) {
//			System.out.println(productDTO.getP_img());
//			System.out.println(productDTO.getP_name());
//		}
		
		request.setAttribute("bestList", bList);
		
		System.out.println(bList.toString());
		
		ActionForward forward = new ActionForward();
		forward.setPath(url);
		forward.setRedirect(false);
		
		return forward;
	}
	
}
