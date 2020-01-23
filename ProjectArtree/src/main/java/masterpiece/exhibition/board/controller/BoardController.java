package masterpiece.exhibition.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {


	
	
	// 공지 게시판
	@RequestMapping(value="/notice.at")
	public String notice() {
		return "board/notice/notice.tiles";
	}

}
