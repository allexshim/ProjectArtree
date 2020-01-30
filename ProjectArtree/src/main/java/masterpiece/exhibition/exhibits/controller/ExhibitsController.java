package masterpiece.exhibition.exhibits.controller;

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
import org.springframework.web.bind.support.SessionAttributeStore;
import org.springframework.web.context.annotation.SessionScope;

import masterpiece.exhibition.exhibits.service.InterExhibitsService;
import masterpiece.exhibition.member.model.MemberVO;

@Controller
public class ExhibitsController {

	@Autowired
	private InterExhibitsService service;

	/////////////////// 전시회 목록 홈 /////////////////////
	@RequestMapping(value = "/exhHome.at")
	public String exhHome(HttpServletRequest request) {
		return "exhibits/exhList.tiles";
	}

	/////////////////// 전시회 목록 불러오기 /////////////////////
	@ResponseBody
	@RequestMapping(value = "/exhList.at", produces = "text/plain;charset=UTF-8")
	public String exhList(HttpServletRequest request) {

		String len = request.getParameter("len");
		String page = request.getParameter("page");
		String type = request.getParameter("type");
		String loca = request.getParameter("loca");

		if (type == null || "0".equals(type)) {
			type = "";
		}
		if (loca == null || "0".equals(loca)) {
			loca = "";
		}

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("check", "exh");
		paraMap.put("type", type);
		paraMap.put("loca", loca);

		int totCount = service.getTotalCount(paraMap);

		if (len == null || !len.equals("16")) {
			len = "16";
		}

		String start = String.valueOf(((Integer.parseInt(page) - 1) * Integer.parseInt(len)) + 1);
		String end = String.valueOf(Integer.parseInt(start) + Integer.parseInt(len) - 1);

		paraMap.put("start", start);
		paraMap.put("end", end);

		List<HashMap<String, Object>> ExhListMap = service.getExhList(paraMap);

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, Object> exh : ExhListMap) {
			JSONObject jobj = new JSONObject();

			jobj.put("EXHIBITIONNO", exh.get("EXHIBITIONNO"));
			jobj.put("FK_GALLERYNO", exh.get("FK_GALLERYNO"));
			jobj.put("GALLERYNAME", exh.get("GALLERYNAME"));
			jobj.put("LOCATION", exh.get("LOCATION"));
			jobj.put("EXHIBITIONNAME", exh.get("EXHIBITIONNAME"));
			jobj.put("SCHEDULE", exh.get("SCHEDULE"));
			jobj.put("PRICE", exh.get("PRICE"));
			jobj.put("MAINPOSTER", exh.get("MAINPOSTER"));
			jobj.put("totCount", totCount);

			jsonArr.put(jobj);
		}

		return jsonArr.toString();
	}

	///////////////////// 전시회 상세페이지 /////////////////////
	@RequestMapping(value = "/exhDetail.at")
	public String exhDetail(HttpServletRequest request) {

		String eno = request.getParameter("eno");

		HashMap<String, String> exhDetailMap = service.getExhDetail(eno); // 해당전시회정보

		request.setAttribute("exhDetailMap", exhDetailMap);
		return "exhibits/exhDetail.tiles";
	}

	///////////////////////// 전시회 상세페이지 - 성별 차트 //////////////////////////
	@ResponseBody
	@RequestMapping(value = "/genderChart.at", produces = "text/plain;charset=UTF-8")
	public String genderChart(HttpServletRequest request) {

		String eno = request.getParameter("eno");

		List<HashMap<String, Object>> genderChart = service.getGenderChart(eno); // 성별 차트

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, Object> chart : genderChart) {

			JSONObject jobj = new JSONObject();

			jobj.put("GENDER", chart.get("GENDER"));
			jobj.put("CNT", chart.get("CNT"));

			jsonArr.put(jobj);

		}

		return jsonArr.toString();
	}

	///////////////////////// 전시회 상세페이지 - 연령대별 차트 //////////////////////////
	@ResponseBody
	@RequestMapping(value = "/ageChart.at", produces = "text/plain;charset=UTF-8")
	public String ageChart(HttpServletRequest request) {

		String eno = request.getParameter("eno");

		List<HashMap<String, String>> ageChart = service.getAgeChart(eno); // 연령대 차트

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> chart : ageChart) {

			JSONObject jobj = new JSONObject();

			jobj.put("AGEGROUP", chart.get("AGEGROUP"));
			jobj.put("CNT", chart.get("CNT"));

			jsonArr.put(jobj);

		}

		return jsonArr.toString();
	}

	/////////////////// 갤러리 목록 홈 /////////////////////
	@RequestMapping(value = "/galHome.at")
	public String galHome(HttpServletRequest request) {
		return "exhibits/galList.tiles";
	}

	/////////////////// 갤러리 이번주 추천 공간 ////////////////////
	@ResponseBody
	@RequestMapping(value = "/galRecomList.at", produces = "text/plain;charset=UTF-8")
	public String galRecomList() {

		List<HashMap<String, String>> GalRecomListMap = service.getGalRecomList();

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> gal : GalRecomListMap) {

			JSONObject jobj = new JSONObject();

			jobj.put("GALLERYNO", gal.get("GALLERYNO"));
			jobj.put("GALLERYNAME", gal.get("GALLERYNAME"));
			jobj.put("MAINPICTURE", gal.get("MAINPICTURE"));
			jobj.put("LOCATION", gal.get("LOCATION"));
			jobj.put("OPENINGHOUR", gal.get("OPENINGHOUR"));
			jobj.put("HOLIDAY", gal.get("HOLIDAY"));

			jsonArr.put(jobj);

		}

		return jsonArr.toString();
	}
	
	///////////////////////// 이번주 추천 공간 - 전시 진행 유무 /////////////////////////
	@ResponseBody
	@RequestMapping(value="/getExhStatus.at", produces="text/plain;charset=UTF-8")
	public String getExhStatus(HttpServletRequest request) {
		
		String gno = request.getParameter("gno");
		
		int exhStat = service.getExhStatus(gno);
		
		JSONObject jobj = new JSONObject();
		
		jobj.put("exhStat", exhStat);
		
		return jobj.toString();
		
	}
	
	
	///////////////////////// 이번주 추천 공간 - 해당 갤러리의 전시회 리스트 ///////////////////////
	@ResponseBody
	@RequestMapping(value="/getRecomExhList.at", produces="text/plain;charset=UTF-8")
	public String getRecomExhList(HttpServletRequest request) {
		
		String gno = request.getParameter("gno");

		List<HashMap<String, String>> recomExhList = service.getRecomExhList(gno);
		
		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> exh : recomExhList) {

			JSONObject jobj = new JSONObject();
			jobj.put("EXHIBITIONNO", exh.get("EXHIBITIONNO"));
			jobj.put("MAINPOSTER", exh.get("MAINPOSTER"));

			jsonArr.put(jobj);
		}
		
		return jsonArr.toString();
	}

	/////////////////// 갤러리 목록 페이지 /////////////////////
	@ResponseBody
	@RequestMapping(value = "/galList.at", produces = "text/plain;charset=UTF-8")
	public String galList(HttpServletRequest request) {

		String page = request.getParameter("page");
		String len = request.getParameter("len");

		if (len == null || !len.equals("9")) { len = "9"; }
		if (page == null) { page = "1"; }
		
		String searchText = request.getParameter("searchText");
		String searchWhere = request.getParameter("searchWhere");

		if (searchText == null) { searchText = ""; }
		if (searchWhere == null) { searchWhere = ""; }

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("check", "gal");
		paraMap.put("searchWhere", searchWhere);
		paraMap.put("searchText", searchText);

		int totCount = service.getTotalCount(paraMap);

		String start = String.valueOf(((Integer.parseInt(page) - 1) * Integer.parseInt(len)) + 1);
		String end = String.valueOf(Integer.parseInt(start) + Integer.parseInt(len) - 1);
		
		paraMap.put("start", start);
		paraMap.put("end", end);

		List<HashMap<String, String>> GalListMap = service.getGalList(paraMap);

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> gal : GalListMap) {

			JSONObject jobj = new JSONObject();
			jobj.put("GALLERYNO", gal.get("GALLERYNO"));
			jobj.put("GALLERYNAME", gal.get("GALLERYNAME"));
			jobj.put("DETAILADDRESS", gal.get("DETAILADDRESS"));
			jobj.put("MAINPICTURE", gal.get("MAINPICTURE"));
			jobj.put("LOCATION", gal.get("LOCATION"));
			jobj.put("INTRODUCTION", gal.get("INTRODUCTION"));
			jobj.put("totCount", totCount);

			jsonArr.put(jobj);
		}

		return jsonArr.toString();
	}

	/////////////////// 갤러리 상세페이지 /////////////////////
	@RequestMapping(value = "/galDetail.at")
	public String galDetail(HttpServletRequest request) {

		String gno = request.getParameter("gno");

		HashMap<String, String> galDetailMap = service.getGalDetail(gno);

		request.setAttribute("galDetailMap", galDetailMap);
		return "exhibits/galDetail.tiles";
	}

	///////////////// 특정 갤러리의 진행중 전시회 목록 불러오기 ////////////////////
	@ResponseBody
	@RequestMapping(value = "/ingExhList.at", produces = "text/plain;charset=UTF-8")
	public String getIngExhListMap(HttpServletRequest request) {

		String gno = request.getParameter("gno");

		List<HashMap<String, String>> ingExhListMap = service.getIngExhListMap(gno);

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> exhfg : ingExhListMap) {
			JSONObject jobj = new JSONObject();

			jobj.put("EXHIBITIONNO", exhfg.get("EXHIBITIONNO"));
			jobj.put("EXHIBITIONNAME", exhfg.get("EXHIBITIONNAME"));
			jobj.put("SCHEDULE", exhfg.get("SCHEDULE"));
			jobj.put("MAINPOSTER", exhfg.get("MAINPOSTER"));

			jsonArr.put(jobj);
		}

		return jsonArr.toString();
	}

	///////////////// 특정 갤러리의 예정 전시회 목록 불러오기 ////////////////////
	@ResponseBody
	@RequestMapping(value = "/comExhList.at", produces = "text/plain;charset=UTF-8")
	public String getComExhListMap(HttpServletRequest request) {

		String gno = request.getParameter("gno");

		List<HashMap<String, String>> ComExhListMap = service.getComExhListMap(gno);

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> exhfg : ComExhListMap) {
			JSONObject jobj = new JSONObject();

			jobj.put("EXHIBITIONNO", exhfg.get("EXHIBITIONNO"));
			jobj.put("EXHIBITIONNAME", exhfg.get("EXHIBITIONNAME"));
			jobj.put("SCHEDULE", exhfg.get("SCHEDULE"));
			jobj.put("MAINPOSTER", exhfg.get("MAINPOSTER"));

			jsonArr.put(jobj);
		}

		return jsonArr.toString();
	}

	///////////////// 특정 갤러리의 지난 전시회 목록 불러오기 ////////////////////
	@ResponseBody
	@RequestMapping(value = "/endExhList.at", produces = "text/plain;charset=UTF-8")
	public String getEndExhListMap(HttpServletRequest request) {

		String gno = request.getParameter("gno");

		List<HashMap<String, String>> EndExhListMap = service.getEndExhListMap(gno);

		JSONArray jsonArr = new JSONArray();

		for (HashMap<String, String> exhfg : EndExhListMap) {
			JSONObject jobj = new JSONObject();

			jobj.put("EXHIBITIONNO", exhfg.get("EXHIBITIONNO"));
			jobj.put("EXHIBITIONNAME", exhfg.get("EXHIBITIONNAME"));
			jobj.put("SCHEDULE", exhfg.get("SCHEDULE"));
			jobj.put("MAINPOSTER", exhfg.get("MAINPOSTER"));

			jsonArr.put(jobj);
		}

		return jsonArr.toString();
	}

	/////////////////////////// 전시회 좋아요 체크 유무 확인 ///////////////////////////
	@ResponseBody
	@RequestMapping(value = "/checkExhLike.at", produces = "text/plain;charset=UTF-8")
	public String checkExhLike(HttpServletRequest request) {

		String eno = request.getParameter("eno");

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		String idx = "";
		if (loginuser != null) {
			idx = loginuser.getIdx();
		}

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("idx", idx);
		paraMap.put("eno", eno);

		int ckExhLike = service.getCheckExhLike(paraMap);

		JSONObject jobj = new JSONObject();
		jobj.put("ckExhLike", ckExhLike);

		return jobj.toString();
	}

	/////////////////////////// 갤러리 좋아요 체크 유무 확인 ///////////////////////////
	@ResponseBody
	@RequestMapping(value = "/checkGalLike.at", produces = "text/plain;charset=UTF-8")
	public String checkGalLike(HttpServletRequest request) {

		String gno = request.getParameter("gno");

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

		String idx = "";
		if (loginuser != null) {
			idx = loginuser.getIdx();
		}

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("idx", idx);
		paraMap.put("gno", gno);

		int ckGalLike = service.getCheckGalLike(paraMap);

		JSONObject jobj = new JSONObject();
		jobj.put("ckGalLike", ckGalLike);

		return jobj.toString();
	}

	/////////////////////////// 전시회 좋아요 지정 및 해제 ////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/ExhLike.at", produces = "text/plain;charset=UTF-8")
	public String ajaxRequireLogin_exhLike(HttpServletRequest request) {

		String eno = request.getParameter("eno");
		String gno = request.getParameter("gno");
		String tag = request.getParameter("tag");
		String gen = request.getParameter("gen");

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String idx = "";
		if (loginuser != null) {
			idx = loginuser.getIdx();
		}

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("eno", eno);
		paraMap.put("gno", gno);
		paraMap.put("tag", tag);
		paraMap.put("gen", gen);
		paraMap.put("idx", idx);

		int CkEcnt = service.goCheckExhLikeDis(paraMap);

		JSONObject jobj = new JSONObject();
		jobj.put("CkEcnt", CkEcnt);

		return jobj.toString();

	}

	/////////////////////////// 갤러리 좋아요 지정 및 해제 ////////////////////////////
	@ResponseBody
	@RequestMapping(value = "/GalLike.at", produces = "text/plain;charset=UTF-8")
	public String requireLogin_galLike(HttpServletRequest request, HttpServletResponse response) {

		String gno = request.getParameter("gno");

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String idx = "";
		if (loginuser != null) {
			idx = loginuser.getIdx();
		}

		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("gno", gno);
		paraMap.put("idx", idx);

		int CkGcnt = service.goCheckGalLikeDis(paraMap);

		JSONObject jobj = new JSONObject();
		jobj.put("CkGcnt", CkGcnt);

		return jobj.toString();

	}

}
