package masterpiece.exhibition.board.notice.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import masterpiece.exhibition.board.notice.service.InterNoticeService;
import masterpiece.exhibition.common.MyUtil;

@Controller
public class NoticeController {
	
	@Autowired
	InterNoticeService service;

	// 공지 게시판
	@RequestMapping(value="/notice.at")
	public String notice(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String goBackURL = MyUtil.getCurrentURL(request);	
		session.setAttribute("goBackURL", goBackURL);
		
		// 새로고침할때 조회수 증가 막기
		session.setAttribute("readCountPermission", "yes");
		
		// 페이징 처리 ----------------------------------------------------
		 String str_currentShowPageNo = request.getParameter("currentShowPageNo");
	      
	     int totalCount = 0; // 총게시물 건수
	     int sizePerPage = 10; // 한 페이지당 보여줄 게시물 수
	     int currentShowPageNo = 0;
	     int totalPage = 0; // 총 페이지 수
	     int startRno = 0; // 시작 행번호
	     int endRno = 0; // 끝 행번호
	      
	     String searchType = request.getParameter("searchType");
	     String searchWord = request.getParameter("searchWord");
	      
	     if(searchWord == null || searchWord.trim().isEmpty()) {
	         searchWord = "";
	     }

		// -------------------------------------------------------------
		HashMap<String,String> searchMap = new HashMap<String,String>();
		searchMap.put("searchWord", searchWord);
		searchMap.put("searchType", searchType);
		//--------------------------------------------------------
		// 현재까지 조건에 해당되는 모든 게시글의 수 (count용)
		List<HashMap<String,String>> noticeList = service.getNotice(searchMap);
		totalCount = noticeList.size();
		totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
		
		// 초기화면의 페이지수 == 1
	      if(str_currentShowPageNo == null) {
	    	  currentShowPageNo = 1;
	      } 
	      else {
	    	  try {
	    		  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
	    		  if( currentShowPageNo < 1 || currentShowPageNo> totalPage ) {
	    			  currentShowPageNo = 1;
	    		  }
	    	  } catch (NumberFormatException e) {
	    		  currentShowPageNo = 1;
	    	  }
	      }
		
	      // 가져올 게시글의 범위를 구한다 (공식) 
	      startRno = ((currentShowPageNo-1)*sizePerPage)+1;
	      endRno = startRno+sizePerPage-1;

	      searchMap.put("startRno", String.valueOf(startRno));
	      searchMap.put("endRno", String.valueOf(endRno));
	      
	      // 페이징 적용한 게시글 리스트
	      noticeList = service.getNotice(searchMap);
	      
	      // === 페이징 바 만들기 ===
	      int pageNo = 1;
	      // pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
	      int blockSize = 3;
	      // blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
	      int loop = 1;
	      // loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지는 증가하는 용도이다.
	      pageNo = (((currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 
	      String pageBar = "";
      
	      pageBar += "<a href = '/artree/notice.at?currentShowPageNo="+1+"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-double-left' style='font-size:20px'></i></a>";
			
			if(pageNo!=1) {
				pageBar += "&nbsp;<a href = '/artree/notice.at?currentShowPageNo="+ (pageNo-1)+"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-left' style='font-size:20px'></i></a>&nbsp;";
			} else {
				pageBar += "&nbsp;<a href = '/artree/notice.at?currentShowPageNo="+ (pageNo) +"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-left' style='font-size:20px'></i></a>&nbsp;";
			}
			
			while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
				
				if(pageNo == currentShowPageNo) {	// 보고자 하는 페이지 == 현재 페이지
					pageBar += "&nbsp;<span class = 'active' style='display:inline-block;'>"+pageNo+"</span>&nbsp;";
				}
				else {
					pageBar += "&nbsp;<a class = 'pageNumber' href = '/artree/notice.at?currentShowPageNo="+ pageNo +"&searchType="+searchType+"&searchWord="+searchWord+"'>"+pageNo+"</a>&nbsp;";
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
				pageBar += "&nbsp;<a href = '/artree/notice.at?currentShowPageNo="+pageNo+"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-right' style='font-size:20px'></i></a>&nbsp;";
			} else {
				pageBar += "&nbsp;<a href = '/artree/notice.at?currentShowPageNo="+totalPage+"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-right' style='font-size:20px'></i></a>&nbsp;";
				
			}
			pageBar += "&nbsp;<a href = '/artree/notice.at?currentShowPageNo="+totalPage+"&searchType="+searchType+"&searchWord="+searchWord+"'><i class='fa fa-angle-double-right' style='font-size:20px'></i></a>&nbsp;";
			
			request.setAttribute("sizePerPage", sizePerPage);
			request.setAttribute("pageBar", pageBar);

			request.setAttribute("noticeList", noticeList);
		
		return "board/notice/notice.tiles";
	}
	
	// 새 글 입력하기
	@RequestMapping(value="/addNotice.at")
	public void addNotice(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		String notTitle = request.getParameter("notTitle");
		String notContent = request.getParameter("notContent");
		
		HashMap<String,String> addNotice = new HashMap<String,String>();
		
		addNotice.put("notTitle", notTitle);
		addNotice.put("notContent",notContent);
		
		System.out.println(notTitle);
		System.out.println(notContent);
		// 새 글 추가하기
		int n = service.addNotice(addNotice);
		
		try {
			String msg = "";
			
			if(n==1) { msg = "글쓰기 완료!"; }
			else { msg = "에러가 발생했습니다."; 
			}
			
			String loc = "/artree/notice.at";
			
			request.setAttribute("msg", msg); 
			request.setAttribute("loc", loc);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
			dispatcher.forward(request, response);
				
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		} 
	}
	
}
