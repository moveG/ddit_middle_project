package kr.or.ddit.cmm.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataOutput;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.cmm.service.AtchFileServiceImpl;
import kr.or.ddit.cmm.service.IAtchFileService;
import kr.or.ddit.cmm.vo.AtchFileVO;


@WebServlet("/filedownload.do")
public class FileDownloadServlet extends HttpServlet{

		@Override
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			long fileId = req.getParameter("fileId") != null ? 
					 Long.parseLong(req.getParameter("fileId")) : -1;
			
			int fileSn = req.getParameter("fileSn") != null ? 
					 Integer.parseInt(req.getParameter("fileSn")) : 1;
			
					 
			//파일 정보 조회 
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			AtchFileVO fileVO = new AtchFileVO();
			
			fileVO.setAtchFileId(fileId);
			fileVO.setFileSn(fileSn);
			
			fileVO = fileService.getAtchFileDetail(fileVO);
			
			//파일 다운로드 처리를 위한 응답헤더 정보 설정하기
			resp.setContentType("application/octet-stream");//그냥 바이너리 데이터 노의미
			
			//문자 공백처리, attchment안쓰면 inline
			resp.setHeader("Content-Disposition", "attachment; filename=\""
					+ URLEncoder.encode(fileVO.getOrignlFileNm(),"UTF-8").replaceAll("\\+", "%20")
					+ "\""); //스페이스를 적절하게 인코딩했다가 복원하는 %20(스페이스),공백은 +로 처리되기 때문에 바꿔줘야 함
			BufferedInputStream bis = new BufferedInputStream(
									  new FileInputStream(fileVO.getFileStreCours()));
			BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
			
			
			int c = -1;
			
			while((c= bis.read())!= -1) {
				bos.write(c);
			}
			
			bis.close();
			bos.close();
			
			
		}
		
		
		@Override
		protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
			doGet(req, resp);
			
		}
	
	
	
	
}
