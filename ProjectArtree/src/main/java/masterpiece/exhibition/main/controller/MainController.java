package masterpiece.exhibition.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import masterpiece.exhibition.main.service.InterMainService;
import masterpiece.exhibition.member.model.MemberVO;

@Controller
public class MainController {
	
	@Autowired
	InterMainService service;
	
	@RequestMapping(value="/mainartree.at")
	public String mainartree() {
		return "main/mainartree.tiles";
	}
	
	// ajax ~ 인기 전시회 top3 가져오기
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getMostPolular.at", produces="text/plain;charset=UTF-8")
	public String getMostPolular() {
		
		// ajax로 호출, 인기 전시회 top3를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getMostPolular();
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			/*exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, 
			mainposter, galleryname, galleryno, location*/
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
	} // end of getMostPolular ---------------------------------------
	
	// ajax ~ 신규 전시회 top3 가져오기
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getNewest.at", produces="text/plain;charset=UTF-8")
	public String getNewest() {
		
		// ajax로 호출, 신규 전시회 top3를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getNewest();
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			/*exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, 
			mainposter, galleryname, galleryno, location*/
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
	} // end of getNewest ---------------------------------------
	
	// ajax ~ 종료임박 전시회 종료일 빠른순으로 3개 가져오기
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getEndSoon.at", produces="text/plain;charset=UTF-8")
	public String getEndSoon() {
		
		// ajax로 호출, 종료임박 전시회를 종료일 빠른순으로 3개 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getEndSoon();
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			/*exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, 
			mainposter, galleryname, galleryno, location*/
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
	} // end of getEndSoon ---------------------------------------
	
	// ajax ~ 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
	// 로그인 한 경우 회원의 선호 태그, 비로그인 상태라면 전체 회원의 선호태그 순
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getPreference.at", produces="text/plain;charset=UTF-8")
	public String getPreference(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String idx = null;
		if(loginuser != null) {
			idx = loginuser.getIdx(); // 현재 로그인한 사용자의 idx
		}
		
		// ajax로 호출, 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getPreference(idx);
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			/*exhibitionno, fk_galleryno, exhibitionname, author, startdate, enddate, 
			mainposter, galleryname, galleryno, location*/
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
	} // end of getPreference ---------------------------------------
	
	// ajax ~ 이벤트 등록 빠른순으로 3개 가져오기
	// 이벤트 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getNewEvent.at", produces="text/plain;charset=UTF-8")
	public String getNewEvent() {
		
		// ajax로 호출, 이벤트 등록 빠른순으로 3개 가져오기
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> eventList =  null;
		eventList = service.getNewEvent();
	
		for(HashMap<String,String> single :eventList) {
			JSONObject jsobj = new JSONObject();
			//  fk_exhibitionNo, eventName, content, startDate, endDate, mainPoster
			jsobj.put("exhibitionNo",single.get("fk_exhibitionNo"));
			jsobj.put("eventName",single.get("eventName"));
			jsobj.put("content",single.get("content"));
			jsobj.put("startDate",single.get("startDate"));
			jsobj.put("endDate",single.get("endDate"));
			jsobj.put("mainPoster",single.get("mainPoster"));
			
			jsarr.put(jsobj);
		}
		return jsarr.toString();
	} // end of getNewEvent ---------------------------------------
	
	
	// 성별 차트
	@ResponseBody
	@RequestMapping(value = "/getGenderChart.at", produces = "text/plain;charset=UTF-8")
	public String getGenderChart(HttpServletRequest request) {
	
	List<HashMap<String, Object>> getGenderChart = service.getGenderChart(); // 성별 차트
	
	JSONArray jsonArr = new JSONArray();
	
	for (HashMap<String, Object> chart : getGenderChart) {
	
	JSONObject jobj = new JSONObject();
	
	jobj.put("GENDER", chart.get("GENDER"));
	jobj.put("CNT", chart.get("CNT"));
	jobj.put("PCT", chart.get("PCT"));
	jobj.put("TOTAL", chart.get("TOTAL"));
	
	jsonArr.put(jobj);
	
	}
	
	return jsonArr.toString();
	}
	
}
