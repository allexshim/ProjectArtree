package masterpiece.exhibition.search.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

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
	
	/*/// wordCloud 수정용 백업
	// 검색 페이지로 이동하는 url
	@RequestMapping(value="/search2.at")
	public String goSearchPage2(HttpServletRequest request) {
		
		return "search/search2.tiles";
	} // end of reviewList --------------------------------------------
*/	
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
			//  detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
			jsobj.put("detailAddress",single.get("detailAddress"));
			jsobj.put("exhibitionName",single.get("exhibitionName"));
			jsobj.put("galleryName",single.get("galleryName"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("exhibitionno",single.get("exhibitionno"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();
	} // end of locationSearch ---------------------------------------
	
	@ResponseBody
	@RequestMapping(value="/locationJSON.at", produces="text/plain;charset=UTF-8", method=RequestMethod.POST)
//	public String locationJSON(HttpServletRequest request, @RequestParam(value="coordsArr[]") List<HashMap<String,String>> coordsArr) {
	public String locationJSON(HttpServletRequest request) {
		
		String[] coordsArr = request.getParameterValues("coordsArr");
		/*System.out.println("controller coordsArr.length : "+coordsArr.length);*/ //221
		
		JSONObject jsobj = new JSONObject();
		
		JSONArray jsArr = new JSONArray();
		for(int i=0; i<coordsArr.length; i++) {
			/*System.out.println("coordsArr[i] : "+coordsArr[i]);*/
			// {"galleryName":item.galleryName, "lat":35.20459722797615,"lng":129.21270222887753}
			
			// "\"KT&G 상상마당 춘천 아트센터 갤러리\""
			int galleryNamestart = coordsArr[i].indexOf(":");
			int galleryNameend = coordsArr[i].indexOf(",");
			String galleryName = coordsArr[i].substring(galleryNamestart+1, galleryNameend);
			
			int latstart = coordsArr[i].indexOf(":", galleryNamestart+1);
			int latend = coordsArr[i].indexOf(",", galleryNameend+1);
			String lat = coordsArr[i].substring(latstart+1, latend);
			
			int lngstart = coordsArr[i].lastIndexOf(":");
			int lngend = coordsArr[i].lastIndexOf("}");
			String lng = coordsArr[i].substring(lngstart+1, lngend);
			
			JSONObject singlecoord = new JSONObject();
			singlecoord.put("galleryName", galleryName);
			singlecoord.put("lat", lat);
			singlecoord.put("lng", lng);
			jsArr.put(singlecoord);				
		}
		jsobj.put("positions", jsArr);
		/*System.out.println("result :"+jsobj.toString());*/
		
		return jsobj.toString();
		
	} // end of locationJSON ---------------------------------------
	
	// 클릭한 갤러리 이름에 해당하는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/selectedLocationSearch.at", produces="text/plain;charset=UTF-8")
	public String selectedLocationSearch(HttpServletRequest request) {
		
		String galleryName = request.getParameter("galleryName");
		galleryName = galleryName.substring(1, galleryName.length()-1);
		
		// System.out.println("galleryName : "+galleryName);
		
		// ajax로 호출, 선택한 갤러리에서 열리는 전시회를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionByLocation(galleryName);

		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();

			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();
	} // end of selectedLocationSearch ---------------------------------------
	
	
	
	// 해당 월에 열리는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/monthSearch.at", produces="text/plain;charset=UTF-8")
	public String monthSearch(HttpServletRequest request) {
		String year = request.getParameter("year");
		String month = request.getParameter("month"); // 1월 2020
		
		String str = (Integer.parseInt(month)>=10)?"":"0";
		month = year+"-"+str+month+"-01"; //2020-01-01
		
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyMonth(month);
		
		//System.out.println(exhibitionList.size()); // 45
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
   
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of monthSearch ------------------------------------------------------
	
	// 해당 날짜에 열리는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/dateSearch.at", produces="text/plain;charset=UTF-8")
	public String dateSearch(HttpServletRequest request) {
		String date = request.getParameter("date");

		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyDate(date);
		
		//System.out.println(exhibitionList.size());
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
   
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
		
	} // end of dateSearch ------------------------------------------------------
	
	// 모든 전시회의 테마를 가져온다. (오늘 기준으로 전시중인 전시회만)
	@ResponseBody
	@RequestMapping(value="/allSearch.at", produces="text/plain;charset=UTF-8")
	public String allThemeSearch(HttpServletRequest request) {
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyTheme();
		
		//System.out.println(exhibitionList.size());
		String allTag = "";
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
			
			allTag += ","+single.get("tag");
			
			jsarr.put(jsobj);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("allTag", allTag);

		return jsarr.toString();	
	} // end of allThemeSearch ------------------------------------------------------
	
	
	// 선택한 테마에 해당하는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/selectThemeSearch.at", produces="text/plain;charset=UTF-8")
	public String selectThemeSearch(HttpServletRequest request) {
		
		String tag = request.getParameter("tag");
		
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbySelectTheme(tag);
		
	//	System.out.println(exhibitionList.size());
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();	
	} // end of selectThemeSearch ------------------------------------------------------
	
	////////////////////////////////////////////////////////////////////////////////
	
	// 관리자 페이지 차트 ~ 태그
	@RequestMapping(value="/byTags.at")
	public String isAdmin_byTags(HttpServletRequest request, HttpServletResponse response) {
		
		// 통계를 내기 위해 총 회원수를 구해서 request영역에 저장한다.
		int totalcnt = service.getMemberCnt();
		request.setAttribute("totalcnt", totalcnt);

		// System.out.println("controller"+totalcnt);
		
		return "admin/statistics/byTags.tiles";
	}
	
	// /getChartDataByTags.at
	@ResponseBody
	@RequestMapping(value="/getChartDataByTags.at", produces="text/plain;charset=UTF-8")
	public String getChartDataByTags(HttpServletRequest request) {
		
		//HttpSession session = request.getSession();
		
		// 각각 tag이름, tag의 빈도수를 저장하는 HashMap
		List<HashMap<String,String>> TagList = service.getChartDataByTags();
		// tag, CNT
		
		//int totalTagCnt = 0;
		JSONArray jsarr = new JSONArray();
		for(HashMap<String,String> map : TagList) {
			JSONObject jsobj = new JSONObject();
			jsobj.put("tag", map.get("tag"));
			jsobj.put("cnt", map.get("CNT"));
			jsarr.put(jsobj);
			
			//totalTagCnt += Integer.parseInt(map.get("CNT"));
			
		}
		/*System.out.println("tagArr[i].tag : "+totalTagCnt*1.0);
		session.setAttribute("tagArr[i].tag", totalTagCnt*1.0);*/
		
		return jsarr.toString();
	} // end of getChartDataByTags ----------------------------------------
	
	
	@ResponseBody
	@RequestMapping(value="/getAgeDataByTags.at", produces="text/plain;charset=UTF-8")
	public String getAgeDataByTags(HttpServletRequest request) {
		
		String tag = request.getParameter("tag");
		// 해당 태그를 선호하는 연령대,해당회원수 를 가져온다.
		List<HashMap<String,String>> ageRange = service.getAgeDataByTags(tag);
		// agegroup, agecnt
		JSONArray jsarr = new JSONArray();
		for(HashMap<String,String> map : ageRange) {
			JSONObject jsobj = new JSONObject();
			jsobj.put("agegroup", map.get("agegroup"));
			jsobj.put("agecnt", map.get("agecnt"));
			jsobj.put("tag", map.get("tag"));
			jsarr.put(jsobj);
			
			//System.out.println("agegroup"+map.get("agegroup"));
			//System.out.println("agecnt"+map.get("agecnt"));
		}
		return jsarr.toString();
	} // end of getAgeDataByTags ----------------------------------------
	
	
}
