package kr.or.ddit.cmm.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import kr.or.ddit.cmm.vo.AtchFileVO;

public interface IAtchFileService {

	/*
	 * 첨부파일 목록을 저장하기 위한 메서드
	 * @param fileItemMap
	 * @return
	 */
	public AtchFileVO saveAtchFileList(Map<String, FileItem[]> fileItemMap) throws Exception;
	
	/*
	 * 첨부파일 목록 조회하기
	 * @param fileVO
	 * @return
	 */
	public AtchFileVO getAtchList(AtchFileVO fileVO);
	public List<AtchFileVO> getAtchFileList(AtchFileVO fileVO);
	/*
	 * 첨부파일 세부정보 조회하기
	 * @param fileVO 객체
	 * @return atchfileVO 세부파일정보를 담은 객체
	 */
	public AtchFileVO getAtchFileDetail(AtchFileVO fileVO);
	
	
}
