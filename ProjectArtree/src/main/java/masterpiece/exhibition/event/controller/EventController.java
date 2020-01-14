package masterpiece.exhibition.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@RequestMapping(value="/aboutbin.at")
	public String aboutbin(HttpServletRequest request) {		
		
		return "event/aboutbin.tiles";
	}
	
	@RequestMapping(value="/eventbin.at")
	public String eventbin(HttpServletRequest request) {		
		
		String content = "";
		for (int i=0; i<16; i++) {
			content += "<div class=\"contentBin\">";
			content += "	<div><img style=\"width: 280px; height: 280px;\" src=\""+request.getContextPath()+"/resources/images/event/base.jpg\"></div>";
			content += "	<div style=\"margin: 10px 0px;\">";
			content += "		<div style=\"font-weight: bold; font-size: 17px;\" >Relaxed Mornings</div>";		
			content += "		<div style=\"font-size: 15px;\">8:30-9:30am, Mon 13 Jan</div>";
			content += "	</div>";
			content += "</div>";
			content += "";
		}
		
		request.setAttribute("content", content);
		
		return "event/eventbin.tiles";
	}
	
}
