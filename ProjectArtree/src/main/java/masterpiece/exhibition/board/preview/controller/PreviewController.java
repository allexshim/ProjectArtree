package masterpiece.exhibition.board.preview.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import masterpiece.exhibition.board.preview.service.InterPreviewService;

@Controller
public class PreviewController {
	
	@Autowired
	private InterPreviewService service;

	@RequestMapping(value="/previewList.at")
	public String previewList(HttpServletRequest request) {
		
		return "board/preview/previewList.tiles";
	} // end of previewList -------------------------------------------
	
	@RequestMapping(value="/previewDetail.at")
	public String previewDetail(HttpServletRequest request) {
		
		return "board/preview/previewDetail.tiles";
	} // end of previewDetail -------------------------------------------
	
	@RequestMapping(value="/addPreview.at")
	public String addPreview(HttpServletRequest request) {
		
		return "board/preview/addPreview.tiles";
	} // end of addPreview --------------------------------------------
	
	
	////////////////////////// 전시회명 검색 - 모달에 띄울 전시회 리스트 ////////////////////////////
	@ResponseBody
	@RequestMapping(value="/getModalExhList.at", produces="text/plain;charset=UTF-8")
	public String getModalExhList(HttpServletRequest request) {
		
		String key = request.getParameter("key");
		
		List<HashMap<String,String>> ModalExhList = service.getModalExhList(key);
		
		JSONArray jsonArr = new JSONArray();
		
		for(HashMap<String,String> ModalExh : ModalExhList) {
			
			JSONObject jobj = new JSONObject();
			
			jobj.put("EXHIBITIONNAME", ModalExh.get("EXHIBITIONNAME"));
			jobj.put("MAINPOSTER", ModalExh.get("MAINPOSTER"));
			
			jsonArr.put(jobj);
		}
		
		return jsonArr.toString();
		
	}
	
}
