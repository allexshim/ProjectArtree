package masterpiece.exhibition.board.notice.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import masterpiece.exhibition.board.notice.service.InterNoticeService;
import masterpiece.exhibition.common.MyUtil;

@Controller
public class NoticeController {
	
	@Autowired
	InterNoticeService service;

	// 공지 게시판
	@RequestMapping(value="/notice.at")
	public String notice(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String goBackURL = MyUtil.getCurrentURL(request);	
		session.setAttribute("goBackURL", goBackURL);
		
		return "board/notice/notice.tiles";
	}
	
	// 새 글 입력하기
	@RequestMapping(value="/addNotice.at")
	public void addNotice(HttpServletRequest request, HttpServletResponse response) {

		String notTitle = request.getParameter("notTitle");
		String notContent = request.getParameter("notContent");
		
		HashMap<String,String> addNotice = new HashMap<String,String>();
		
		addNotice.put("notTitle", notTitle);
		addNotice.put("notContent",notContent);
		
		// 새 글 추가하기
		int n = service.addNotice(addNotice);
		
		try {
			String msg = "";
			
			if(n==1) { msg = "글쓰기 완료!"; }
			else { msg = "에러가 발생했습니다."; 
			}
			
			String loc = "/artree/notice.at";
			
			request.setAttribute("msg", msg); 
			request.setAttribute("loc", loc);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			dispatcher.forward(request, response);
				
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
	}
	
}
