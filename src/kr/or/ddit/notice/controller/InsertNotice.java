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
 * Servlet implementation class InsertNotice
 */
@WebServlet("/InsertNotice.do")
public class InsertNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		NoticeVO vo = new NoticeVO();
		
		/*String admin_id      = request.getParameter("ADMIN_ID");
		String notice_title  = request.getParameter("NOTICE_TITLE");
		String notice_content= request.getParameter("NOTICE_CONTENT");
		
		System.out.println(admin_id);
		System.out.println(notice_title);
		System.out.println(notice_content);
		
		vo.setAdmin_id(admin_id);
		vo.setNotice_title(notice_title);
		vo.setNotice_content(notice_content);*/
		
		try {
			BeanUtils.populate(vo, request.getParameterMap());
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
		
		INoticeService service = NoticeServiceImpl.getInstance();
		
		int num = service.insertNotice(vo);
		
		request.setAttribute("result", num);
		
		request.getRequestDispatcher("notice/result.jsp").forward(request, response);
		
	}

}
