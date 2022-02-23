package kr.or.ddit.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonObject;

import nl.captcha.Captcha;

/**
 * Servlet implementation class ChkAnswer
 */
@WebServlet("/ChkAnswer.do")
public class ChkAnswer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChkAnswer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "";
		Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
		String ans = request.getParameter("answer");
		
		if(ans != null && !"".equals(ans)) {
			if(captcha.isCorrect(ans)) {
				request.getSession().removeAttribute(Captcha.NAME);
				result = "200";
			} else {
				result = "300";
			}
		}
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String result = "";
		Captcha captcha = (Captcha) request.getSession().getAttribute(Captcha.NAME);
		String ans = request.getParameter("answer");
		
		if(ans != null && !"".equals(ans)) {
			if(captcha.isCorrect(ans)) {
				request.getSession().removeAttribute(Captcha.NAME);
				result = "200";
			} else {
				result = "300";
			}
		}
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		response.setContentType("application/x-json; charset=UTF-8");
		response.getWriter().print(json);
	}
}
