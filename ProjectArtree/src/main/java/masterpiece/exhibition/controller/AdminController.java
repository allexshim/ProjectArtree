package masterpiece.exhibition.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value="/admin.at")
	public String admin() {
		
		
		return "admin/practice.tiles";
	}
	
}
