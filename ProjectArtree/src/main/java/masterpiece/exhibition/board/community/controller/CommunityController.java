package masterpiece.exhibition.board.community.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import masterpiece.exhibition.board.community.service.InterCommunityService;
import masterpiece.exhibition.common.MyUtil;
import masterpiece.exhibition.member.model.MemberVO;


@Controller
public class CommunityController {

	@Autowired
	InterCommunityService service;
	
	@RequestMapping(value="/communityList.at")
	public String communityList(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String goBackURL = MyUtil.getCurrentURL(request);	
		session.setAttribute("goBackURL", goBackURL);
		// 아래는 페이지 바 샘플인데 여유 되면 진행합니다...
				/*
				String sizePerPage = "10";	// 한 페이지에 보여줄 상품(게시글 등) 갯수
				String currentShowPageNo = request.getParameter("currentShowPageNo");
				// 띄울(보여줄) 페이지

				if(currentShowPageNo == null) {
					currentShowPageNo = "1";	
				}
				// 해당하는 주문 개수/보여줄 개수 == 전체 페이지 개수
				int totalPage = 100; // 뷰단 생성

				int pageNo = 1;
				// pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
				int blockSize = 10;
				// blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
				int loop = 1;
				// loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지는 증가하는 용도이다.
				pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 
				String pageBar = "";
				
				pageBar += "<a href = '/Semi/myshop/order/list.sa?currentShowPageNo=1'><i class='fa fa-angle-double-left' style='font-size:32px'></i></a>";
				
				if(pageNo!=1) {
					pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ (pageNo-1)+"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
				} else {
					pageBar += "&nbsp;<a href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ (pageNo) +"'><i class='fa fa-angle-left' style='font-size:32px'></i></a>&nbsp;";
				}
				
				while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
					
					if(pageNo == Integer.parseInt(currentShowPageNo)) {	// 보고자 하는 페이지 == 현재 페이지
						pageBar += "&nbsp;<span class = 'active' style='display:inline-block;'>"+pageNo+"</span>&nbsp;";
							//	= "&nbsp;<span style = 'border : solid 2px gray; padding : 2px;>'"+pageNo+"</span>&nbsp;";
					}
					else {
						pageBar += "&nbsp;<a class = 'pageNumber' href = '/Semi/myshop/order/list.sa?currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
					}
					
					pageNo++;	// 1 부터 10 까지
								// 11 부터 20 까지
								// 21 부터 30 까지
								// 31 부터 40 까지
								// 41 
					loop++;
					// 매번 loop 가 1씩 증가	
				} // end of while() -------------------
			
				// 다음 만들기
				if(pageNo <= totalPage) {
					pageBar += "&nbsp;<a href = '/artree/reviewList.artree?currentShowPageNo="+pageNo+"'></i></a>&nbsp;";
				} else {
					pageBar += "&nbsp;<a href = '/artree/reviewList.artree?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-right' style='font-size:32px'></i></a>&nbsp;";
					
				}
				pageBar += "&nbsp;<a href = '/artree/reviewList.artreea?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:32px'></i></a>&nbsp;";
				
				request.setAttribute("sizePerPage", sizePerPage);
				request.setAttribute("pageBar", pageBar);*/
				
		return "board/community/communityList.tiles";
	} // end of communityList -------------------------------------------
	
	@RequestMapping(value="/communityDetail.at")
	public String communityDetail(HttpServletRequest request) {
		
		return "board/community/communityDetail.tiles";
	} // end of communityDetail -------------------------------------------
	
	
	@RequestMapping(value="/addCommunity.at")
	public String addCommunity(HttpServletRequest request) {
		
		// 현재시간을 얻어와서 넘긴다 (작성일자)
		SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String writeDay = format.format(time);
		
		request.setAttribute("writeDay", writeDay);
		
		// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
		String searchWord = "";
		List<HashMap<String,String>> exhibitionList = service.getExhibit(searchWord);
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "board/community/addCommunity.tiles";
	} // end of addCommunity --------------------------------------------
	

	// 새 글 입력 모달창에서 전시회 검색하기
	@ResponseBody
	@RequestMapping(value="/searchExhibitInModal.at", produces="text/plain;charset=UTF-8")
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
	

	// 새 글 입력하기
	@RequestMapping(value="/addCommunityEnd.at")
	public void requireLogin_addCommunityEnd(HttpServletRequest request, HttpServletResponse response) {

		String title = request.getParameter("title");
		String content = request.getParameter("contents");
		String fk_exhibitionno = request.getParameter("no");
		
		System.out.println(fk_exhibitionno);
		//#{fk_exhibitionno}, #{title}, #{content},#{fk_idx}, 0)
		HashMap<String,String> addCommunity = new HashMap<String,String>();
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		if(loginuser != null) {
			addCommunity.put("fk_idx", loginuser.getIdx());
		}
		addCommunity.put("title", title);
		addCommunity.put("content",content);
		addCommunity.put("fk_exhibitionno", fk_exhibitionno);
		
		// 새 글 추가하기
		int n = service.addCommunity(addCommunity);
		
		try {
			String msg = "";
			
			if(n==1) { msg = "글쓰기 완료!"; }
			else { msg = "에러가 발생했습니다."; 
			}
			
			String loc = "/artree/communityList.at";
			
			request.setAttribute("msg", msg); 
			request.setAttribute("loc", loc);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			dispatcher.forward(request, response);
				
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
		
	} // end of requireLogin_addCommunityEnd --------------------------------------------
	
	
	
	
}
