package masterpiece.exhibition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/mainartree.at")
	public String mainartree() {
		return "main/mainartree.tiles";
	}
	
}
