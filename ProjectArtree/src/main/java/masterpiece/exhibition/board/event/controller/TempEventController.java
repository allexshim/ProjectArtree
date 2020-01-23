package masterpiece.exhibition.board.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TempEventController {

	@RequestMapping(value="/eventList.at")
	public String eventList() {
		return "board/events/eventList.tiles";
	}
	
	@RequestMapping(value="/addEvent.at")
	public String addEvent() {
		
		return "board/events/addEvent.tiles";
	}
	
}
