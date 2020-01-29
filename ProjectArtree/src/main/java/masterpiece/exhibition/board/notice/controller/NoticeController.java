package masterpiece.exhibition.board.notice.controller;

import javax.servlet.http.HttpServletRequest;
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
	
}
