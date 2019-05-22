package com.freshcoffee.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.freshcoffee.dto.MemberDTO;
import com.freshcoffee.mybatis.SqlMapConfig;

public class MemberDAO {
	SqlSessionFactory sqlSessionFactory = SqlMapConfig.getSqlSession();
	SqlSession sqlSession;
	int result = 0;
	MemberDTO mDto = new MemberDTO();
	boolean flag = false;
	
	private MemberDAO(){}
	
	// 외부에서 빌려서 사용할 객체 생성(instance)
	private static MemberDAO instance = new MemberDAO();
	//외부에서 getInstance() 를 호출하면 객체를 빌려줌
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	


	//회원가입 ID중복체크(Ajax)
	public String idCheck(String id) {
		//19. mybatis를 사용하기 위해 sqlSession을 빌려옴
		sqlSession = sqlSessionFactory.openSession();
		String result = "";
		try {
			//20. sqlSession을 활용하여 mapper.xml의 idCheck 이름의sql문을 실행 (매개변수로 id 데이터 전달)
			result = sqlSession.selectOne("idCheck", id);
			//22. DB에서 sql문을 실행한 결과를 result 변수에 담음
			// 23. result가 null이면 사용가능한 ID
			//		result가 null이아니면 중복된 ID
			// 사용가능한 ID = "1" 중복된 ID = "-1"
			if (result != null) { //ID가 있다 = 중복
				result = "-1";
			}  else {
				result = "1"; //사용가능한 ID
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		//24. IdCheckAction 클래스로 "1" or "-1"값을  return값으로 보냄
		return result;
	}
	//회원가
	public int mem_insert(MemberDTO mDto) {
		sqlSession = sqlSessionFactory.openSession(true);
		
		try {
			result = sqlSession.insert("mem_insert", mDto);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return result;
	}
	
	// 회원정보 수정 (pw 제외)
		 public int memUpdate(MemberDTO mDto) {
			 sqlSession = sqlSessionFactory.openSession(true);
			 
			 try {
				result = sqlSession.update("mem_update", mDto);
			 } catch(Exception e) {
				 e.printStackTrace();
			 } finally {
				 sqlSession.close();
			 }
			 return result;
		 }
	
		
		public MemberDTO memOne(String id) {
			 sqlSession = sqlSessionFactory.openSession(true);
			 
			 try {
				mDto = sqlSession.selectOne("memOne", id);
			 } catch(Exception e) {
				 e.printStackTrace();
			 } finally {
				 sqlSession.close();
			 }
			 return mDto;
		 }
		
		// 비밀번호 재설정
		// : 입력한 비밀번호가 현재 비밀번호와 일치하는지 판단
		public boolean pwCheck(String id, String pw) {
			sqlSession = sqlSessionFactory.openSession();
			HashMap<String, String> map = new HashMap<>();
			map.put("id", id);
			map.put("pw", pw);
			try {
				result = sqlSession.selectOne("pwCheck", map);
				
				if(result == 1) {
					flag = true;
				} else {
					flag = false;
				}
				
				System.out.println("flag >>>>" + flag);
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				sqlSession.close();
			}
			return flag;
		}
		
		 //비밀번호 재설정
		 public int pwUpdate(String id, String pw) {
			 sqlSession = sqlSessionFactory.openSession(true);
			 
			 mDto.setId(id);
			 mDto.setPw(pw);
			 
			 try {
				result = sqlSession.update("pwUpdate", mDto);
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				sqlSession.close();
			}
			 return result;
		 }
	
	 
	 // 회원 탈퇴(처치해버림)
	 public int memDelete(String id) {
		 sqlSession = sqlSessionFactory.openSession(true);
		 
		 try {
			result = sqlSession.delete("memDelete", id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return result;
	 }
}
