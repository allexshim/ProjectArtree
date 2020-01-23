package masterpiece.exhibition.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping(value="/eventList.at")
	public String eventList() {
		return "board/events/eventList.tiles";
	}
	
	@RequestMapping(value="/addEvent.at")
	public String addEvent() {
		
		return "board/events/addEvent.tiles";
	}
	
	
	

}
