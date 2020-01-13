package masterpiece.exhibition.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@RequestMapping(value="/aboutbin.at")
	public String aboutbin(HttpServletRequest request) {		
		
		return "event/aboutbin.tiles";
	}
	
}
