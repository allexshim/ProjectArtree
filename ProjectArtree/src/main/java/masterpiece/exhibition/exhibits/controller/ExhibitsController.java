package masterpiece.exhibition.exhibits.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import masterpiece.exhibition.exhibits.service.InterExhibitsService;

@Controller
public class ExhibitsController {
	
	@Autowired
	private InterExhibitsService service;

	
	///////////////////// 전시회 목록 페이지 ///////////////////
	@RequestMapping(value="/exhHome.at", produces="text/plain;charset=UTF-8")
	public String exhHomeList(HttpServletRequest request) {
		
		return "exhibits/exhList.tiles";
	}
	
	/////////////////// 전시회 목록 불러오기 /////////////////////
	@ResponseBody
	@RequestMapping(value="/exhList.at", produces="text/plain;charset=UTF-8")
	public String exhList(HttpServletRequest request) {
		
		String len = request.getParameter("len");
		String page = request.getParameter("page");
		
		String end = String.valueOf(Integer.parseInt(page)+Integer.parseInt(len)-1);
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("page", page); 
		paraMap.put("end", end); 
										
		String jsonStr = "";
		
		List<HashMap<String, Object>> ExhListMap = service.getExhList(paraMap);
		
		if(ExhListMap != null) {
			JSONArray jsonArr = new JSONArray();
			
			for(HashMap<String, Object> exhlm : ExhListMap) {
				JSONObject jobj = new JSONObject();
				
				jobj.put("name", exhlm.get("exhibitionno"));
				jobj.put("name", exhlm.get("fk_galleryno"));
				jobj.put("name", exhlm.get("galleryname"));
				jobj.put("name", exhlm.get("location"));
				jobj.put("name", exhlm.get("exhibitionname"));
				jobj.put("name", exhlm.get("schedule"));
				jobj.put("name", exhlm.get("price"));
				
				jsonArr.put(jobj);
				
				System.out.println(jsonArr);
			}
			
			jsonStr = jsonArr.toString();
		}

		return jsonStr;
	}
	
	///////////////////// 전시회 상세페이지 /////////////////////
	@RequestMapping(value="/exhDetail.at")
	public String exhibitionDetail() {
		return "exhibits/exhDetail.tiles";
	}

	/////////////////// 갤러리 목록 페이지 /////////////////////
	@RequestMapping(value="/galHome.at")
	public String galleryHomeList() {
		return "exhibits/galList.tiles";
	}
	
	/////////////////// 갤러리 목록 불러오기 ////////////////////
	@ResponseBody
	@RequestMapping(value="/galList.at", produces="text/plain;charset=UTF-8")
	public String galleryList(HttpServletRequest request) {
		
		
		
		return "";
	}
	
	/////////////////// 갤러리 상세페이지 /////////////////////
	@RequestMapping(value="/galDetail.at")
	public String galleryDetail() {
		return "exhibits/galDetail.tiles";
	}

}
