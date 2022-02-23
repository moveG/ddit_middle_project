package kr.or.ddit.notice.controller;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.notice.service.INoticeService;
import kr.or.ddit.notice.service.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

/**
 * Servlet implementation class UpdateNotice
 */
@WebServlet("/UpdateNotice.do")
public class UpdateNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	int notice_no = Integer.parseInt(req.getParameter("notice_no"));
    	
    	INoticeService service = NoticeServiceImpl.getInstance();
    	
    	NoticeVO vo = service.selectNotice(notice_no);
    	
    	req.setAttribute("notice", vo);
    	
    	req.getRequestDispatcher("notice.updateNotice.jsp").forward(req, resp);
    }
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NoticeVO vo = new NoticeVO();
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int num = service.updateNotice(vo);
		
		request.setAttribute("result", num);
		
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
	}

}
