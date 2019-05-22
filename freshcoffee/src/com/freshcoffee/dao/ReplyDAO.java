package com.freshcoffee.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.freshcoffee.dto.ReplyDTO;
import com.freshcoffee.mybatis.SqlMapConfig;

public class ReplyDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	int result = 0;
	ReplyDTO rDto = new ReplyDTO();
	boolean flag = false;
	List<ReplyDTO> list = null;
	
	private ReplyDAO() {}
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	//해당 게시글 댓글 목록 조회
	public List<ReplyDTO> replyList(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			list = sqlSession.selectList("replyList", bno);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return list;
	}
	

}
