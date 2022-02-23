package kr.or.ddit.cmm.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.fileupload.FileItem;
import org.apache.log4j.Logger;

import kr.or.ddit.cmm.dao.AtchFileDaoImpl;
import kr.or.ddit.cmm.dao.IAtchFileDao;
import kr.or.ddit.cmm.vo.AtchFileVO;
import kr.or.ddit.util.FileUploadRequestWrapper;

public class AtchFileServiceImpl implements IAtchFileService{

	
	private static Logger logger = Logger.getLogger(AtchFileServiceImpl.class);
	
	private static IAtchFileService fileService;
	private IAtchFileDao fileDao;
	
	private AtchFileServiceImpl() {
		fileDao = AtchFileDaoImpl.getInstance();
	}
	
	public static IAtchFileService getInstance() {
		
		if(fileService ==null)fileService = new AtchFileServiceImpl();
		
		return fileService;
		
	}
	
	
	
	
	
	//같은 이름의 파일일떄 저장 파일명으로 구분(내부적으로 저장하는 방식) 
	//사용자는 모름 
	//저장하는 파일(유효id)과 실제파일을 구분해서
	@Override
	public AtchFileVO saveAtchFileList(Map<String, FileItem[]> fileItemMap) throws Exception {
		
		AtchFileVO atchFileVO = new AtchFileVO();
		 
		//정보를 주는 개념이 아님 
		fileDao.insertAtchFile(atchFileVO); //기본 첨부파일 테이블에 저장
		//atchFileVO에 데이터가 저장되어 있다 인서트 까지 끝나면 
		
		for(FileItem[] itemArr : fileItemMap.values()) {
			
			for(FileItem item : itemArr) {
				
				File uploadDir = new File(FileUploadRequestWrapper.UPLOAD_DIRECTORY);
				
				if(!uploadDir.exists()) {
					uploadDir.mkdir();
				}
				
				logger.info("item.getName() =>"+item.getName());
				
				String orignFileName = item.getName();  //원본 파일명
				long fileSize = item.getSize();			 //파일 크기
				String saveFileName = "";				 //저장파일명
				File storeFile = null;					 //저장파일객체
				String saveFilePath ="";				 //저장파일경로
				
				do{
					//저장 파일명 생성하기
					saveFileName = UUID.randomUUID().toString().replace("-","");//그냥 보기 안좋아서 없애버린거임
					saveFilePath = FileUploadRequestWrapper.UPLOAD_DIRECTORY+
								   File.separator + saveFileName;
					storeFile = new File(saveFilePath);//exist를 쓰고 싶어서 만든거임
					
				}while(storeFile.exists());             //저장파일이 중복되지 않을 때까지
				
				//확장명 추출
				String fileExtension = 
						orignFileName.lastIndexOf(".") < 0 ? 
						"" : orignFileName.substring(orignFileName.lastIndexOf(".")+1);
				
				item.write(storeFile); //업로드 파일 저장
				
				//파일 저장 끝 다음부턴 DB에 저장	
				
				atchFileVO.setStreFileNm(saveFileName);
				atchFileVO.setFileSize(fileSize);
				atchFileVO.setOrignlFileNm(orignFileName);
				atchFileVO.setFileExtsn(fileExtension);
				atchFileVO.setFileStreCours(saveFilePath);
				
				//파일 상세정보 저장
				fileDao.insertAtchFileDetail(atchFileVO);
				
				item.delete(); //임시 업로드 파일 삭제하기
				
				
				
			}
			
		}
		
		
		return atchFileVO;
	}

	@Override
	public AtchFileVO getAtchList(AtchFileVO fileVO) {
		return fileDao.getAtchList(fileVO);
	}
	
	@Override
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO) {
		return fileDao.getAtchFileList(fileVO);
	}

	@Override
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO) {
		return fileDao.getAtchFileDetail(fileVO);
	}

}
