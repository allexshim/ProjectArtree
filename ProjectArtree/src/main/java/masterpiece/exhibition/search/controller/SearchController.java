package masterpiece.exhibition.search.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SearchController {

	@RequestMapping(value="/search.at")
	public String searchBylocation(HttpServletRequest request) {
		
		return "search/search.tiles";
	} // end of reviewList --------------------------------------------
	

	
}
