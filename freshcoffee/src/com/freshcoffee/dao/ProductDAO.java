package com.freshcoffee.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.freshcoffee.dto.ProductDTO;
import com.freshcoffee.mybatis.SqlMapConfig;



public class ProductDAO {
		SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();

		SqlSession sqlSession;
		private ProductDAO(){}
		// 외부에서 빌려서 사용할 객체 생성(instance)
		private static ProductDAO instance = new ProductDAO();
		//외부에서 getInstance() 를 호출하면 객체를 빌려줌
		public static ProductDAO getInstance() {
			return instance;
		}
		int result = 0;


public List<ProductDTO> bestList() {
	List<ProductDTO> List = null;
	sqlSession = sqlSessionFactory.openSession();
	try {
		List = sqlSession.selectList("bestList");
		System.out.println(List);
		
	} catch (Exception e) {
		e.printStackTrace();
	}finally {
		sqlSession.close();
	}
	
	return List;
	
}
}
