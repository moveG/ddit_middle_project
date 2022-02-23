package kr.or.ddit.member.vo;

import java.awt.Color;
import java.awt.Font;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import nl.captcha.Captcha;
import nl.captcha.audio.AudioCaptcha;
import nl.captcha.servlet.CaptchaServletUtil;
import nl.captcha.text.producer.NumbersAnswerProducer;
import nl.captcha.text.renderer.DefaultWordRenderer;

public class CaptChautll {
	
	private static int width = 150; //가로크기
	private static int height = 50; //세로크기
	
	// 캡챠생성
	public void GetImgCaptCha(HttpServletRequest request, HttpServletResponse response) {
		
		List<Font> fontList = new ArrayList<Font>();
		fontList.add(new Font("",Font.HANGING_BASELINE, 40));
		fontList.add(new Font("Courier",Font.ITALIC, 40));
		fontList.add(new Font("",Font.PLAIN, 40));
		List<Color> colorList = new ArrayList<Color>();
		colorList.add(Color.BLACK);
		
		Captcha captcha = new Captcha.Builder(width, height)
				// .addText() 또는 아래와 같이 정의 : 6자리 숫자와 폰트 및 컬러 설정
				.addText(new NumbersAnswerProducer(6), new DefaultWordRenderer(colorList, fontList))
				.addNoise().addBorder()
				.build();
		
		// JSP에서 Captcha 객체에 접근할 수 있도록 session에 저장
		request.getSession().setAttribute(Captcha.NAME, captcha);
		CaptchaServletUtil.writeImage(response, captcha.getImage());
	
	}
	
	// 캡챠 Audio 생성
	public void getAudioCaptCha(HttpServletRequest request, HttpServletResponse response, String answer) throws IOException{
		HttpSession session = request.getSession();
		
		Captcha captcha = (Captcha) session.getAttribute(Captcha.NAME);
		String getAnswer = answer;
		
		if(getAnswer == null || getAnswer.equals("")) getAnswer = captcha.getAnswer();
		
		AudioCaptcha audiocaptcha = new AudioCaptcha.Builder()
				.addAnswer(new SetTextProducer(getAnswer))
				.addNoise() // 잡음 추가
				.build();
		
		CaptchaServletUtil.writeAudio(response, audiocaptcha.getChallenge());
		
		
	}
	
	
}















