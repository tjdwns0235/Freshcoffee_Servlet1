package src.com.freshcoffee.action;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.freshcoffee.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import src.com.freshcoffee.dto.BoardDTO;

import src.com.freshcoffee.common.Constants;

public class ModifyPlayAction implements Action {
	

	
		@Override
		public ActionForward excute(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			
			 //파일 업로드 처리 1) 파일을 저장할 디렉토리 생성
			File uploadDir = new File(Constants.UPLOAD_PATH);
			
			if (!uploadDir.exists()) {  // 저장할경로가 없다면
				uploadDir.mkdir();	// 디렉토리를 생성하세요. make(mk)디렉토리 mkdir리눅스 명령어
			}

			//request를 확장시킨 MultipartRequest 생성
			//request는 모두 String 타입
			//파일 <- request로 전송 불가
			//파일 <- request를 향상시킨 MultipartRequest를 사용
			//그래서 파일뿐만 아니라 기존에 String타입도 전부 Multipart타입으로 변경해야 함
			
//			파일업로드 2) 'D:\\upload'로 첨부파일 저장
			//기존파일이 있든 없든 새로운 파일을 저장
			MultipartRequest multi = new MultipartRequest(request,
					Constants.UPLOAD_PATH, //파일 업로드 디렉토리
					Constants.MAX_UPLOAD, // 업로드 최대용량
					"UTF-8",  			//인코딩
					new DefaultFileRenamePolicy()); //파일이름 중복정책
			
			
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			String writer = multi.getParameter("writer");
			int bfileSize = Integer.parseInt(multi.getParameter("basic_file_size"));
			String bCheck = multi.getParameter("basic_check");
			String filename = " ";
			int filesize = 0;
			
			
			
			//파일을 성정한 경로(D:\\upload)로 업로드하는 과정
			//예외처리를 꼭해야 하는 상황 1. 데이터베이스 2. I.O (Input,Out)
			
//			파일업로드  3) DB에 저장할 첨부파일의 이름과 사이즈를 구함
//			새로등록한 첨부파일이 있다면 새로 등록한 첨부파일의 filename과 filesize를 구하고 
//			새로등록한 첨부파일이 없다면
//			while()을 타지 않은 filename = "", filesize = 0 으로 고정
			try {
				Enumeration files = multi.getFileNames();
				
				while(files.hasMoreElements()) { //files.hasMoreElements()파일이 있는지 참인지 거짓인지 판별
					String file1 = (String)files.nextElement(); //첨부파일의 파일이름
					filename = multi.getFilesystemName(file1); //첨부파일의 파일
					File f1 = multi.getFile(file1);
					
					if (f1 != null) {
						// filesize는 Long타입으로 가져옴
						//int로 형변환
						filesize = (int)f1.length(); //첨부파일의 파일 사이즈 저장
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//사용자가 첨부파일을 등록하지 않았을때 파일이름이  null이나 ""으로 들어가는 것을 방지
//			"-"으로

			if (filename == null || filename.trim().equals("")) {
//				추가로 등록한 첨부파일 없는 경우
				filename = "-";
				if (bCheck.equals("no")) { //기존첨부 파일이 있는경우
					File file = new File((Constants.UPLOAD_PATH+ bfileName));
					file.delete();
				} else { // 현상태 유지
					//위에서 기존첨부 파일 값을 초기화 했기 때문에 다시 입력
					filename = bFileName;
					filesize = bFileSize();
				}
			}else {
				// 새로 등록한 첨부 파일 있는경우
				// 기존파일 있는지 체크
				if (bFileSize > 0) {
					File file = new File((Constants.UPLOAD_PATH + bFileName));
					file.delete();
				}
			}
			
					
			BoardDTO bDto = new BoardDTO(title, content, writer, filename, filesize);
			System.out.println(bDto.toString());
			BoardDAO bDao = BoardDAO.getInstance();
			bDao.registerAdd(bDto);
			
//			int bno = bDao.seqVal();
			
//			String url = "boardList.freshcoffee";
			ActionForward forward = new ActionForward();
			forward.setPath(url);
			forward.setRedirect(true);
			
			return forward;
		}

		

	}

}
