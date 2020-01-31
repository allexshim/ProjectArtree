package masterpiece.exhibition.board.preview.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.board.preview.service.InterPreviewService;
import masterpiece.exhibition.common.MyUtil;

@Controller
public class PreviewController {
	
	@Autowired
	private InterPreviewService service;

	@RequestMapping(value="/previewList.at")
	public String previewList(HttpServletRequest request) {
		
		String str_page = request.getParameter("curPage");
		
		int totalCount = 0;// 총 게시물 건수
		int size = 10;// 한 페이지당 보여줄 게시물 수
		int curPage = 0;// 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정
		int totalPage = 0;// 총 페이지수(웹브라우저 상에 보여줄 총 페이지 갯수, 페이지바)
		
		int startRno = 0;// 시작 행번호
		int endRno = 0;// 끝 행번호
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		if(searchType == null) { searchType = ""; }
		if(searchWord == null) { searchWord = ""; }
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		// 총 게시물 건수
		totalCount = service.getTotalCount(paraMap);
	
		totalPage = (int)Math.ceil((double)totalCount/size);
		
		// 게시판에 보여지는 초기화면은 페이지 넘버 1로 한다.
		if(str_page == null) { 
			curPage = 1; 
		}
		else { // 유저가 장난으로 문자를 썼을 때
			try {
				curPage = Integer.parseInt(str_page);
				
				if( curPage < 1 || curPage > totalPage ) { curPage = 1; }
			} catch (NumberFormatException e) { curPage = 1; }
		} // end of if ---------
		
		// **** 가져올 게시글의 범위  **** //
		startRno = (( curPage - 1 ) * size ) + 1;
		endRno = startRno + size - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		List<HashMap<String, String>> previewListMap = service.getPreviewList(paraMap);
		
		if(!"".equals(searchWord)) {
			request.setAttribute("paraMap", paraMap);
		}
		

		int blockSize = 5;
		
		int loop = 1;
		
		int pageNo = ((curPage - 1)/blockSize) * blockSize + 1;
	
		String url = "previewList.at";	
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		pageNo = ( (curPage - 1)/blockSize)*blockSize + 1; // !!!!! 공식 !!!!!
		
		String pageBar = "";
		
		// ***** [이전] 만들기 ***** // search_date="+search_date+"&search_key="+search_key+"&search="+search+"&
		if( pageNo != 1 ) {
			pageBar += "<a href='"+url+"&curPage="+(pageNo-1)+"&size="+size+"&searchType="+searchType+"&searchWord="+searchWord+"'><img src='/artree/images/board/btn_page_prev.png'></a>";
		// loop가 10일때 while문을 빠져나와 해당 [다음]을 만든다. 여기서의 memberList.up은 해당 memberListAction.java를 읽어오고
		// 맨 위 getParameter값에 1이 아닌 10이 들어오게 되면서 loop는 11부터 새로이 시작하며 반복한다.
		}

		pageBar += "<ul>";
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == curPage) {
				pageBar +="<li><span class='this'>"+pageNo+"</span></li>";
			}
			else {
				pageBar += "<li><a style='display: inline-block;' class='other' href='"+url+"&curPage="+pageNo+"&size="+size+"&searchType="+searchType+"&searchWord="+searchWord+"'>"+pageNo+"</a></li>"; 
				       // ""+1+"&nbsp;"+2+"&nbsp;"+3+"&nbsp;"+......+10+"&nbsp;"
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		pageBar += "</ul>";
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<a style='display: inline-block;' href='"+url+"&curPage="+pageNo+"&size="+size+"&searchType="+searchType+"&searchWord="+searchWord+"'><img src='/artree/images/board/btn_page_next.png'></a>"; 
		}

		pageBar += "</ul>";
		
		int startIdx = totalCount-size*(curPage-1);
		
		request.setAttribute("pageBar", pageBar);
		request.setAttribute("startIdx", startIdx);
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes"); 
		
		String gobackURL = MyUtil.getCurrentURL(request);
		request.setAttribute("gobackURL", gobackURL);
		
		request.setAttribute("previewListMap", previewListMap);
		return "board/preview/previewList.tiles";
	} // end of previewList -------------------------------------------
	
	@RequestMapping(value="/previewDetail.at")
	public String previewDetail(HttpServletRequest request) {
		
		return "board/preview/previewDetail.tiles";
	} // end of previewDetail -------------------------------------------
	
	@RequestMapping(value="/addPreview.at")
	public String requireLogin_addPreview(HttpServletRequest request, HttpServletResponse response) {
		
		return "board/preview/addPreview.tiles";
	} // end of addPreview --------------------------------------------
	
	@RequestMapping(value="/addEnd.at", method= {RequestMethod.POST})
	public ModelAndView addEnd(HttpServletRequest request, ModelAndView mav) {
		
		String fk_idx = request.getParameter("fk_idx");
		String name = request.getParameter("name");
		String eno = request.getParameter("eno");
		String title = request.getParameter("title");
		String contents = request.getParameter("contents");
		
		title = MyUtil.replaceParameter(title);
		contents = MyUtil.replaceParameter(contents);
		contents = contents.replaceAll("\r\n", "<br/>");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("name", name);
		paraMap.put("eno", eno);
		paraMap.put("title", title);
		paraMap.put("contents", contents);
		paraMap.put("fk_idx", fk_idx);

		int result = service.addEnd(paraMap);
		
		if(result == 0) {
			mav.addObject("msg", "등록에 실패하였습니다. 다시 시도해주세요.");
			mav.addObject("loc", request.getContextPath()+"/previewList.at");
			mav.setViewName("msg");
		}
		else {
			mav.addObject("msg", "글이 정상적으로 등록되었습니다 !");
			mav.addObject("loc", request.getContextPath()+"/previewList.at");
			mav.setViewName("msg");
		}
		
		return mav;
	}
	
	
	////////////////////////// 전시회명 검색 - 모달에 띄울 전시회 리스트 ////////////////////////////
	@ResponseBody
	@RequestMapping(value="/getModalExhList.at", produces="text/plain;charset=UTF-8")
	public String getModalExhList(HttpServletRequest request) {
		
		String key = request.getParameter("key");
		
		List<HashMap<String,String>> ModalExhList = service.getModalExhList(key);
		
		JSONArray jsonArr = new JSONArray();
		
		for(HashMap<String,String> ModalExh : ModalExhList) {
			
			JSONObject jobj = new JSONObject();
			
			jobj.put("EXHIBITIONNO", ModalExh.get("EXHIBITIONNO"));
			jobj.put("EXHIBITIONNAME", ModalExh.get("EXHIBITIONNAME"));
			jobj.put("MAINPOSTER", ModalExh.get("MAINPOSTER"));
			
			jsonArr.put(jobj);
		}
		
		return jsonArr.toString();
		
	}
	
}
