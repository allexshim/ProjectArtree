package masterpiece.exhibition.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping(value="/searchBylocation.at")
	public String searchBylocation(HttpServletRequest request) {
		
		
		return "search/searchBylocation.tiles";
	} // end of reviewList --------------------------------------------
	

	
}
