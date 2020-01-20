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
	@RequestMapping(value="/exhList.at", produces="text/plain;charset=UTF-8")
	public String exhibitionList(HttpServletRequest request) {
		
		return "exhibits/exhList.tiles";
	}
	
	/////////////////// 전시회 목록 불러오기 /////////////////////
	@ResponseBody
	@RequestMapping(value="/exhibitsList.at", produces="text/plain;charset=UTF-8")
	public String exhList(HttpServletRequest request) {
		
		String len = request.getParameter("len");
		String page = request.getParameter("page");
		
		System.out.println(len+"/"+page);
		
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
	
	@RequestMapping(value="/exhDetail.at")
	public String exhibitionDetail() {
		return "exhibits/exhDetail.tiles";
	}
	
	@RequestMapping(value="/galDetail.at")
	public String galleryDetail() {
		return "exhibits/galDetail.tiles";
	}
	
	@RequestMapping(value="/galList.at")
	public String galleryList() {
		return "exhibits/galList.tiles";
	}
}
