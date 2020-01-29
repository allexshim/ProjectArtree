package masterpiece.exhibition.board.review.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import masterpiece.exhibition.board.review.model.ReviewVO;
import masterpiece.exhibition.board.review.service.InterReviewService;
import masterpiece.exhibition.common.MyUtil;
import masterpiece.exhibition.member.model.MemberVO;


@Controller
public class ReviewController {

	@Autowired
	InterReviewService service;
	
	@RequestMapping(value="/reviewList.at")
	public String reviewList(HttpServletRequest request) {

		// ========================= 페이징 =========================
		List<ReviewVO> revList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo");
		
		int totalCount = 0; // 총게시물 건수
		int sizePerPage = 3; // 한 페이지당 보여줄 게시물 수
		int currentShowPageNo = 0; // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함
		int totalPage = 0; // 총 페이지수(웹브라우저상에 보여줄 총 페이지 개수, 페이지바)
		
		int startRno = 0; // 시작 행번호
		int endRno = 0; // 끝 행번호
		
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchWord == null || searchWord.trim().isEmpty()) {
			searchWord = "";
		}
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("searchType", searchType);
		paraMap.put("searchWord", searchWord);
		
		// 먼저 총 게시물 건수(totalCount)를 구해와야 한다.
		// 총 게시물 건수(totalCount)는 검색조건이 있을 때와 없을 때로 나뉜다.
		
		// 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithNoSearch();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearch(paraMap);
		}
		
		totalPage = (int) Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			currentShowPageNo = 1;
		}
		
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage ) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
		
		revList = service.reviewListWithPaging(paraMap);
		// 페이징 처리한 글목록 가져오기(검색이 있든지, 검색이 없든지 모두 다 포함한 것)
		
		if(!"".equals(searchWord)) {
			request.setAttribute("paraMap", paraMap);
		}
		
		// === #125. 페이지바 만들기 ===
		String pageBar = "<ul>";
		
		int blockSize = 3;
		// blockSize 는 1개 블럭(토막)당 보여지는 페이지번호의 갯수 이다.
		
				
		int loop = 1;
		
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;

		String url = "reviewList.at";	
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		// *** [이전] 만들기 *** //    
		if(pageNo != 1) {
			pageBar += "<li style='display: inline; list-style: none; margin-right: 10px;'><a href='"+url+"&currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"'>[이전]</a></li>";
		}
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display: inline; list-style-type: none; margin-right: 10px;'><span style='color: red; border: 1px solid gray; padding: 2px 4px;'>"+pageNo+"</span></li>";
			}
			else {
				pageBar += "<li style='display: inline; list-style-type: none; margin-right: 10px;'><a href='"+url+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"'>"+pageNo+"</a></li>"; 
				       // ""+1+"&nbsp;"+2+"&nbsp;"+3+"&nbsp;"+......+10+"&nbsp;"
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<li style='display: inline; list-style-type: none; margin-right: 10px;'><a href='"+url+"&currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchType="+searchType+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
		}



		pageBar += "</ul>";
		
		request.setAttribute("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		// 페이징 처리되어진 후 특정글제목을 클릭하여 상세내용을 본 이후
		// 사용자가 목록보기 버튼을 클릭했을 때 돌아갈 페이지를 알려주기 위해
		// 현재 페이지 주소를 뷰단으로 넘겨준다.
		
		request.setAttribute("gobackURL", gobackURL);
		
		HttpSession session = request.getSession();
		session.setAttribute("readCountPermission", "yes"); 
		
		request.setAttribute("revList", revList);
		
		return "board/review/reviewList.tiles";
	} // end of reviewList --------------------------------------------

	@RequestMapping(value="/reviewDetail.at")
	public String reviewDetail(HttpServletRequest request) {
		
	     String revno = request.getParameter("revno");
	     
	     String gobackURL = request.getParameter("gobackURL");
	     request.setAttribute("gobackURL", gobackURL);
	     
	     HttpSession session = request.getSession();
	     MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	      
	     String idx = null;
	      
	     if(loginuser != null) {
	    	 idx = loginuser.getIdx();
	     }
	     
	     ReviewVO revo = null;
	      
	     // 보고 온 전시회의 메인 포스터 가져오기
	     String poster = service.getPoster(revno);
	     request.setAttribute("poster", poster);
	     
	     if("yes".equals(session.getAttribute("readCountPermission"))) {
	        // 글목록보기를 다음 특정글을 조회해온 경우이다
	         
	    	 revo = service.getView(revno, idx);
	        // 글조회수 증가와 함께 글 1개를 조회를 해주는 것
	         
	        session.removeAttribute("readCountPermission");
	        // 중요함 !! session에 저장된 readCountPermission을 삭제한다.
	     }
	     else {
	        // 웹브라우저상에서 새로고침(F5)을 클릭한 경우
	         
	    	 revo = service.getViewWithNoAddCount(revno);
	        // 조회수 증가하지 않고 글 1개 조회
	     }
	      
	     // 해당 글 번호에 해당하는 댓글 가져오기
	     List<HashMap<String, String>> commentList = service.getCommentList(revno);
	     
	     request.setAttribute("commentList", commentList);
	     
	     request.setAttribute("revo", revo);
		
		return "board/review/reviewDetail.tiles";
	} // end of reviewDetail --------------------------------------------

	@RequestMapping(value="/addReview.at")
	public String addReview(HttpServletRequest request) {
		
		// 현재시간을 얻어와서 넘긴다 (작성일자)
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String writeDay = format.format(time);
		
		request.setAttribute("writeDay", writeDay);
		
		// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
		String searchWord = "";
		List<HashMap<String,String>> exhibitionList = service.getExhibit(searchWord);
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "board/review/addReview.tiles";
	} // end of addReview --------------------------------------------
	
	// 새 글 입력 모달창에서 전시회 검색하기
	@ResponseBody
	@RequestMapping(value="/exhibitInModal.at", produces="text/plain;charset=UTF-8")
	public String searchExhibitInModal(HttpServletRequest request) {
		
		String searchWord = request.getParameter("searchWord");
		List<HashMap<String,String>> exhibitionList = service.getExhibit(searchWord);
		
		/*exhibitionno, exhibitionname, author, galleryname*/
		JSONArray jsarr = new JSONArray();
		for(HashMap<String,String> map : exhibitionList) {
			JSONObject jsobj = new JSONObject();
			jsobj.put("exhibitionno", map.get("exhibitionno"));
			jsobj.put("exhibitionname", map.get("exhibitionname"));
			jsobj.put("author", map.get("author"));
			jsobj.put("galleryname", map.get("galleryname"));
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of searchExhibitInModal ------------------------------------------------
		
	
	// 새 글 입력
	@RequestMapping(value="/addReviewEnd.at")
	public ModelAndView addReviewEnd(HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
	    MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
	    String idx = loginuser.getIdx();
	    String name = loginuser.getName();
	    String exhibitionname = request.getParameter("name");
	    String exhibitionno = request.getParameter("exhibitionno");
	    String revTitle = request.getParameter("title");
	    String revContent = request.getParameter("contents");
	    
	    HashMap<String, String> paraMap = new HashMap<String, String>();
	    paraMap.put("idx", idx);
	    paraMap.put("name", name);
	    paraMap.put("exhibitionname", exhibitionname);
	    paraMap.put("exhibitionno", exhibitionno);
	    paraMap.put("revTitle", revTitle);
	    paraMap.put("revContent", revContent);
	    
		int n = service.addReview(paraMap);
		
		if(n==1) {
			String msg = "글쓰기 성공!";
			String loc = "/artree/reviewList.at";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
		}
		else {
			String msg = "글쓰기 실패!";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
		}
		
		return mav;
	}
	
	// ====================== 글 수정 ======================
    // 글수정 페이지 요청
    @RequestMapping(value="/modifyReview.at", method= {RequestMethod.GET})
	 public ModelAndView requireLogin_modifyReview(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
   	 
    	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
		String searchWord = "";
		List<HashMap<String,String>> exhibitionList = service.getExhibit(searchWord);
		request.setAttribute("exhibitionList", exhibitionList);
    	
	   	// 글 수정해야 할 글 번호 가져오기
	   	String revno = request.getParameter("revno");
	   	 
	   	// 글 수정해야 할 글 1개 내용 가져오기
	   	ReviewVO revo = service.getViewWithNoAddCount(revno);
	   	 
	   	HttpSession session = request.getSession();
	   	MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	   	 
	   	if(!loginuser.getIdx().equals(revo.getFk_idx())) {
	   		String msg = "다른 사용자의 글은 수정이 불가합니다.";
	   		String loc = "javascript:history.back()";
	   		 
	   		mav.addObject("msg", msg);
	   		mav.addObject("loc", loc);
	   		mav.setViewName("msg");
	   	}
	   	 
	   	else {
	   		// 자신의 글을 수정한 경우
	   		// 가져온 1개 글을 글수정할 폼이 있는 View단으로 보내준다.
	   		mav.addObject("revo", revo);
	   		mav.setViewName("board/review/modifyReview.tiles");

	   	}
	   	 
	   	return mav;
	   	 
    }
    
    // 글 수정 완료
    @RequestMapping(value="/modifyEndReview.at", method= {RequestMethod.POST})
    public ModelAndView requireLogin_modifyEndReview(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
   	 
    	 String fk_exhibitionno = request.getParameter("exhibitionno");
 		 String revTitle = request.getParameter("title");
 		 String revContent = request.getParameter("contents");
 		 String revno = request.getParameter("no");
 		
 		 HashMap<String,String> modifyRev = new HashMap<String,String>();
 		 modifyRev.put("fk_exhibitionno", fk_exhibitionno);
 		 modifyRev.put("revTitle", revTitle);
 		 modifyRev.put("revContent", revContent);
 		 modifyRev.put("revno", revno);
    	 
	     // 작성자만 글 수정 할 수 있다.
	     int n = service.modifyEndReview(modifyRev);
	     
	     if(n==0) {
	    	 mav.addObject("msg", "글 수정에 실패하였습니다. 관리자에게 문의해 주세요.");
	     }
	     
	     else {
	    	 mav.addObject("msg", "글이 수정되었습니다."); 
	     }
	     
	     mav.addObject("loc", request.getContextPath()+"/reviewDetail.at?revno="+revno);
	     mav.setViewName("msg");
	     
   	 return mav;
    }
    
    // 글 삭제
    @RequestMapping(value="/delReview.at", method= {RequestMethod.GET}) 
    public ModelAndView requireLogin_del(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
    	
    	
    	
    	return mav;
    }
    
    // ====================== 댓글 ======================
    @ResponseBody
    @RequestMapping(value="/addRevComment.at", method= {RequestMethod.POST}, produces="text/plain;charset=UTF-8") 
    public String addComment(HttpServletRequest request) {
    	
    	String jsonStr = "";
   	 
    	HttpSession session = request.getSession();
	    MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
    	
	    String idx = loginuser.getIdx();
    	String name = loginuser.getName();
    	String comcontent = request.getParameter("commentContents");
    	String fk_revno = request.getParameter("fk_revno");
    	
    	System.out.println("idx"+idx);
    	System.out.println("name"+name);
    	System.out.println("comcontent"+comcontent);
    	System.out.println("fk_revno"+fk_revno);
    	
    	
    	HashMap<String, String> paraMap = new HashMap<String, String>();
    	paraMap.put("idx", idx);
    	paraMap.put("name", name);
    	paraMap.put("comcontent", comcontent);
    	paraMap.put("fk_revno", fk_revno);
    	
    	
    	try {
    		// 댓글 등록
			int n = service.addComment(paraMap);
			System.out.println("n~~~!"+n);
			
			if(n==1) {
				// 댓글쓰기(insert) 및
				// 원게시물에 댓글의 개수 증가(update 1씩 증가)가 성공시

				List<HashMap<String, String>> commentList = service.getCommentList(fk_revno);
				// 원게시물에 딸린 댓글들을 조회해오는 것
				System.out.println("조회~~!"+commentList);
				
				JSONArray jsonArr = new JSONArray();
				
				for(HashMap<String, String> cmap:commentList) {
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("name", cmap.get("name"));
					jsonObj.put("comcontent", cmap.get("comcontent"));
					jsonObj.put("comwriteday", cmap.get("comwriteday"));
					
					jsonArr.put(jsonObj);
				}
				
				jsonStr = jsonArr.toString();
				System.out.println("jsonStr"+jsonStr);
			}
			
		} catch (Throwable e) {
			e.printStackTrace();
		}
   	 
   	 return jsonStr;
    }
}


