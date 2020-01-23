package masterpiece.exhibition.main.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	} // end of getEndSoon ---------------------------------------
	
	// ajax ~ 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
	// 로그인 한 경우 회원의 선호 태그, 비로그인 상태라면 전체 회원의 선호태그 순
	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/getPreference.at", produces="text/plain;charset=UTF-8")
	public String getPreference(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		String idx = "";
		if(loginuser != null) {
			idx = loginuser.getIdx(); // 현재 로그인한 사용자의 idx
		}
	
		// ajax로 호출, 사용자가 선호하는 태그가 들어간 전시회를 조회수 높은 순으로 3개 가져오기
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getPreference(idx);
		
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
	} // end of getPreference ---------------------------------------
	
}
