package masterpiece.exhibition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/samplecontent.artree")
	public String samplecontent() {	
		return "main/samplecontent.tiles";
	}
	
	
}
