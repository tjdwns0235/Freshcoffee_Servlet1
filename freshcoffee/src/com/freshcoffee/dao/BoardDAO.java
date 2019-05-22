package com.freshcoffee.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.freshcoffee.dto.BoardDTO;
import com.freshcoffee.dto.CriteriaDTO;
import com.freshcoffee.mybatis.SqlMapConfig;



public class BoardDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	int result = 0;
	BoardDTO bDto = new BoardDTO();
	List<BoardDTO> list = null;
	boolean flag = false;
	
	private BoardDAO() {}
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	public List<BoardDTO> listAll(CriteriaDTO criDto){
		sqlSession = sqlSessionFactory.openSession();
		try {
			list = sqlSession.selectList("listAll", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return list;
	};
	
	// 페이지네이션에 필요한 게시글 Total 수 구하기
	public int totalCount(CriteriaDTO criDto) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			result = sqlSession.selectOne("totalCount", criDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 게시글 1건(상세조회)
	public BoardDTO view(String bno) {
		sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.selectOne("view");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return bDto;
	}
	
	//게시글 조회수 증가(+1)
	public void viewCnt(String bno, HttpSession session) {
		sqlSession = sqlSessionFactory.openSession(true);
		try {
			long update_time = 0;
			
			//null이면 => 처음 조회수  1증가
			//null이 아니면 처음이 아님
			if (session.getAttribute("read_time_"+bno) != null) {
				//이전에 게시글을 조회한 시간
				update_time = (long)session.getAttribute("read_time_"+bno);
			}
			//현재시간 구하기
			long current_time = System.currentTimeMillis();
			// 현재시간과 이전에 게시글 조회시간을 비교
			//24시간(1일)이 지났으면 조회수를 1 증가
			// 				아니면 조회수 증가 없음
			if (current_time - update_time > 24 * 60 * 60 * 1000) {
				sqlSession.update("viewCnt", bno);
				
				//조회수 1증가한 최신 시간을 session 담음
				session.setAttribute("read_time"+bno, current_time);
				
				//ex) 30번게시글인 경우
				//	  read_time_ 30변수를 하나 만들고
				//    현재시간을 담음
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	}
	
	

}
