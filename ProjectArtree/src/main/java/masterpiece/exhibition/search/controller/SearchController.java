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
     
			// exhibitionList에 데이터가 저장은 다 되어있는데 지도 부분이 미완성이라 2개만 저장한 것
			// 나중에 수정해야함!
			jsobj.put("detailAddress",single.get("detailAddress"));
			jsobj.put("exhibitionName",single.get("exhibitionName"));

			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of locationSearch ---------------------------------------
	
	// 해당 월에 열리는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/monthSearch.at", produces="text/plain;charset=UTF-8")
	public String monthSearch(HttpServletRequest request) {
		String month = request.getParameter("month");
		String str = (Integer.parseInt(month)>=10)?"":"0";
		
		month = "2020-"+str+month+"-01"; //2020-01-01
		System.out.println(month);
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyMonth(month);
		
		// System.out.println(exhibitionList.size()); // 118
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of monthSearch ------------------------------------------------------
	
}
