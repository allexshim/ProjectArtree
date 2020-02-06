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
import masterpiece.exhibition.member.model.MemberVO;

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
		
		String pageBar = "";
		
		// ***** [이전] 만들기 ***** // search_date="+search_date+"&search_key="+search_key+"&search="+search+"&
		if( pageNo != 1 ) {
			pageBar += "<a href='"+url+"&curPage="+(pageNo-1)+"&size="+size+"&searchType="+searchType+"&searchWord="+searchWord+"'><img style='padding-bottom:7px;' src='/artree/resources/images/exhibition/ico/left_arrow.png'></a>";
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
			pageBar += "<a style='display: inline-block;' href='"+url+"&curPage="+pageNo+"&size="+size+"&searchType="+searchType+"&searchWord="+searchWord+"'><img style='padding-bottom:7px;' src='/artree/resources/images/exhibition/ico/right_arrow.png'></a>"; 
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
		
		String bno = request.getParameter("bno");
		String fk_idx = request.getParameter("fk");
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");

		String idx = "";
		if(loginuser != null) {
			idx = loginuser.getIdx();
		}
		if("yes".equals(session.getAttribute("readCountPermission")) && fk_idx != idx) {
			// 글 목록보기를 클릭한 다음 특정글을 조회해온 경우이다.
			service.addReadcount(bno);
			// 글 조회수 증가
			session.removeAttribute("readCountPermission");
		}
		
		HashMap<String, String> previewDetailMap = service.getPreviewDetail(bno);

		request.setAttribute("previewDetailMap", previewDetailMap);
		return "board/preview/previewDetail.tiles";
	} // end of previewDetail -------------------------------------------
	
	@RequestMapping(value="/addPreview.at")
	public String requireLogin_addPreview(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
		String eno = request.getParameter("eno");
		
		if(bno != null) {
			HashMap<String, String> previewEditMap = service.getPreviewDetail(bno);
			
			String CONTENT = previewEditMap.get("CONTENT");
			CONTENT = CONTENT.replaceAll("<br/>", "\r\n");
			previewEditMap.put("CONTENT", CONTENT);
			
			request.setAttribute("previewEditMap", previewEditMap);
			return "board/preview/addPreview.tiles";	
		}
		else if(eno != null){
			HashMap<String, String> WriteHelper = service.getPreviewWriteHelper(eno);
			
			request.setAttribute("WriteHelper", WriteHelper);
			return "board/preview/addPreview.tiles";
		}
		else {
			return "board/preview/addPreview.tiles";
		}

	} // end of addPreview --------------------------------------------
	
	///////////////////////// 기대평 글쓰기 및 수정하기 /////////////////////////////
	@RequestMapping(value="/addEnd.at", method= {RequestMethod.POST})
	public ModelAndView addEnd(HttpServletRequest request, ModelAndView mav) {
		
		String bno = request.getParameter("bno");
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
		paraMap.put("bno", bno);
		paraMap.put("title", title);
		paraMap.put("contents", contents);
		paraMap.put("fk_idx", fk_idx);

		int result = service.addEnd(paraMap);
		
		String msg = "";
		
		if(result == 1) { msg = "글이 정상적으로 등록되었습니다 !"; }
		else if(result == 2) { msg = "글이 정상적으로 수정되었습니다 !"; }
		else { msg = "등록에 실패하였습니다. 다시 시도해주세요."; }

		mav.addObject("msg", msg);
		mav.addObject("loc", request.getContextPath()+"/previewList.at");
		mav.setViewName("msg");
		
		return mav;
	}
	
	////////////////////////// 기대평 - 특정 게시물의 댓글 목록 ////////////////////////////
	@ResponseBody
	@RequestMapping(value="/getCommentList.at", produces="text/plain;charset=UTF-8")
	public String getCommentList(HttpServletRequest request) {
		
		String bno = request.getParameter("bno");
		
		List<HashMap<String, String>> commentListMap = service.getCommentList(bno);
		
		JSONArray jsonArr = new JSONArray();
		
		for(HashMap<String,String> comList : commentListMap) {
			
			JSONObject jobj = new JSONObject();

			jobj.put("SEQ", comList.get("SEQ"));
			jobj.put("FK_IDX", comList.get("FK_IDX"));
			jobj.put("NAME", comList.get("NAME"));
			jobj.put("CONTENT", comList.get("CONTENT").replaceAll("<br/>", "\r\n"));
			jobj.put("REGDATE", comList.get("REGDATE"));
			
			jsonArr.put(jobj);
		}
		
		return jsonArr.toString();
	}
	
	////////////////////////// 기대평 - 특정 게시물의 댓글 등록 ////////////////////////////
	@ResponseBody
	@RequestMapping(value="/addPrevComment.at", produces="text/plain;charset=UTF-8")
	public String addComment(HttpServletRequest request) {
	
		 String writer = request.getParameter("comWriter");
		 String content = request.getParameter("comContent");
		 String fk_seq = request.getParameter("fk_seq");
		 String fk_idx = request.getParameter("fk_idx");

		 content = MyUtil.replaceParameter(content);
		 content = content.replaceAll("\r\n", "<br/>");

		 HashMap<String, String> paraMap = new HashMap<String, String>();
		 paraMap.put("writer", writer);
		 paraMap.put("content", content);
		 paraMap.put("fk_seq", fk_seq);
		 paraMap.put("fk_idx", fk_idx);
		 
		 int result = service.addComment(paraMap);
		 
		 JSONObject jobj = new JSONObject();

		 jobj.put("result", result);
		 
		 return jobj.toString();
		
	}
	
	/////////////////////////////// 댓글 수정하기 /////////////////////////////////////
	@ResponseBody
	@RequestMapping(value="/editComment.at", produces="text/plain;charset=UTF-8")
	public String editComment(HttpServletRequest request) {
		
		 String cno = request.getParameter("cno");
		 String content = request.getParameter("content");

		 content = MyUtil.replaceParameter(content);
		 content = content.replaceAll("\r\n", "<br/>");
		
		 HashMap<String, String> paraMap = new HashMap<String, String>();
		 paraMap.put("cno", cno);
		 paraMap.put("content", content);
		 
		 int result = service.editComment(paraMap);
		 
		 JSONObject jobj = new JSONObject();
		
		 jobj.put("result", result);
		 
		 return jobj.toString();
	}
	
	/////////////////////////////// 댓글 삭제하기 /////////////////////////////////////
	@ResponseBody
	@RequestMapping(value="/delComment.at", produces="text/plain;charset=UTF-8")
	public String delComment(HttpServletRequest request) {
		
		 String cno = request.getParameter("cno");
		 String bno = request.getParameter("bno");

		 HashMap<String, String> paraMap = new HashMap<String, String>();
		 paraMap.put("cno", cno);
		 paraMap.put("bno", bno);
		 
		 int result = service.delComment(paraMap);
		 
		 JSONObject jobj = new JSONObject();
		
		 jobj.put("result", result);
		 
		 return jobj.toString();
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
	
	/////////////////////// 기대평 게시물 삭제하기 //////////////////////////
	@RequestMapping(value="/deletePreview.at")
	public ModelAndView deletePreview(HttpServletRequest request, ModelAndView mav) {
		
		String bno = request.getParameter("bno");
		
		int result = service.goDeletePreview(bno);
		
		String msg = "";
		
		if(result == 1) { msg = "글이 삭제되었습니다 !"; }
		else { msg = "오류가 발생하여 돌아갑니다."; }
		
		mav.addObject("msg", msg);
		mav.addObject("loc", request.getContextPath()+"/previewList.at");
		mav.setViewName("msg");
		
		return mav;
	}
	
	
}
