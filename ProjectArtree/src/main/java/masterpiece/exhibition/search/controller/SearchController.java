package masterpiece.exhibition.search.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import masterpiece.exhibition.search.service.InterSearchService;

@Controller
public class SearchController {

	@Autowired
	InterSearchService service;
	
	// 검색 페이지로 이동하는 url
	@RequestMapping(value="/search.at")
	public String goSearchPage(HttpServletRequest request) {
		
		return "search/search.tiles";
	} // end of reviewList --------------------------------------------
	
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/locationSearch.at", produces="text/plain;charset=UTF-8")
	public String locationSearch() {
		
		// ajax로 호출, 모든 전시회를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getAllExhibition();
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
     
			jsobj.put("detailAddress",single.get("detailAddress"));
			jsobj.put("exhibitionName",single.get("exhibitionName"));

			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of locationSearch ---------------------------------------
	
	
	
}
