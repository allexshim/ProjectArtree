package masterpiece.exhibition.board.preview.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PreviewController {

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
	
}
