package masterpiece.exhibition.search.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import masterpiece.exhibition.search.service.InterSearchService;

@Controller
public class SearchController {

	@Autowired
	InterSearchService service;
	
	@RequestMapping(value="/search.at")
	public String goSearchPage(HttpServletRequest request) {
		
		return "search/search.tiles";
	} // end of reviewList --------------------------------------------
	
	@RequestMapping(value="/locationSearch.at")
	public String locationSearch() {
		
		// ajax로 호출, 모든 전시회를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getAllExhibition();
		
		for(int i=0; i<exhibitionList.size(); i++) {
			System.out.println(exhibitionList.get(i).get("exhibitionName"));
		}
		
		return jsarr.toString();
	}
	
	
	
}
