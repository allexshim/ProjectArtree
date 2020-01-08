package masterpiece.exhibition.exhibits.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ExhibitsController {

	@RequestMapping(value="/exhList.at")
	public String exhibitionList() {
		return "exhibits/exhList.tiles";
	}
	
	@RequestMapping(value="/exhDetail.at")
	public String exhibitionDetail() {
		return "exhibits/exhDetail.tiles";
	}
	
	
}
