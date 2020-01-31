//package masterpiece.exhibition.event.controller;
//
//import java.io.IOException;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Set;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.json.JSONArray;
//import org.json.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//import masterpiece.exhibition.board.community.service.InterCommunityService;
//import masterpiece.exhibition.common.MyUtil;
//import masterpiece.exhibition.event.model.InterEventService;
//import masterpiece.exhibition.member.model.MemberVO;
//
//@Controller
//public class EventController {
//	
//	@Autowired
//	InterCommunityService service;
//	
//	@Autowired
//	InterEventService eventService;
//	
//	@RequestMapping(value="/aboutbin.at")
//	public String aboutbin(HttpServletRequest request) {		
//		
//		return "board/events/aboutbin.tiles";
//	}
//	
//	@RequestMapping(value="/event.at")
//	public String eventbin(HttpServletRequest request) {		
//		
//		HashMap<String,String> map = new HashMap<String,String>();
//		HttpSession session = request.getSession();
//		String goBackURL = MyUtil.getCurrentURL(request);
//		session.setAttribute("goBackURL",goBackURL);					
//		
//		// 페이징 처리 ----------------------------------------------------
//			 String str_currentShowPageNo = request.getParameter("currentShowPageNo");
//		      
//		     int totalCount = 0; // 총게시물 건수
//		     int sizePerPage = 4; // 한 페이지당 보여줄 게시물 수
//		     int currentShowPageNo = 0;
//		     int totalPage = 0; // 총 페이지 수
//		     int startRno = 0; // 시작 행번호
//		     int endRno = 0; // 끝 행번호		      
//			
//			//--------------------------------------------------------
//			// 현재까지 조건에 해당되는 모든 게시글의 수 (count용)
//		    List<HashMap<String,String>> EventList = eventService.EventList();
//			totalCount = EventList.size();
//			totalPage = (int)Math.ceil( (double)totalCount/sizePerPage );
//			
//			// 초기화면의 페이지수 == 1
//		      if(str_currentShowPageNo == null) {
//		    	  currentShowPageNo = 1;
//		      } 
//		      else {
//		    	  try {
//		    		  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
//		    		  if( currentShowPageNo < 1 || currentShowPageNo> totalPage ) {
//		    			  currentShowPageNo = 1;
//		    		  }
//		    	  } catch (NumberFormatException e) {
//		    		  currentShowPageNo = 1;
//		    	  }
//		      }
//			
//		      // 가져올 게시글의 범위를 구한다 (공식) 
//		      startRno = ((currentShowPageNo-1)*sizePerPage)+1;
//		      endRno = startRno+sizePerPage-1;
//		      
//		      map.put("startRno", String.valueOf(startRno));
//		      map.put("endRno", String.valueOf(endRno));
//		      
//		      // 페이징 적용한 게시글 리스트
//		      EventList = eventService.EventListPage(map);
//		      
//		      // === 페이징 바 만들기 ===
//		      int pageNo = 1;
//		      // pageNo 가 페이지바에서 보여지는 첫번째 페이지 번호이다.
//		      int blockSize = 3;
//		      // blockSize 는 블럭(토막) 당 보여지는 페이지 번호의 갯수이다.
//		      int loop = 1;
//		      // loop 는 1 부터 증가하여 1 개 블럭을 이루는 페이지번호의 갯수(지금은 10개)까지는 증가하는 용도이다.
//		      pageNo = (((currentShowPageNo) - 1 )/ blockSize ) * blockSize + 1; 
//		      String pageBar = "";
//	      
//		      pageBar += "<a href = '/artree/event.at?currentShowPageNo="+1+"'><i class='fa fa-angle-double-left' style='font-size:20px'></i></a>";
//				
//				if(pageNo!=1) {
//					pageBar += "&nbsp;<a href = '/artree/event.at?currentShowPageNo="+ (pageNo-1)+"'><i class='fa fa-angle-left' style='font-size:20px'></i></a>&nbsp;";
//				} else {
//					pageBar += "&nbsp;<a href = '/artree/event.at?currentShowPageNo="+ (pageNo) +"'><i class='fa fa-angle-left' style='font-size:20px'></i></a>&nbsp;";
//				}
//				
//				while(!( loop > blockSize || pageNo > totalPage )) {	// 반복 횟수 ; 10번 반복
//					
//					if(pageNo == currentShowPageNo) {	// 보고자 하는 페이지 == 현재 페이지
//						pageBar += "&nbsp;<span class = 'active' style='display:inline-block;'>"+pageNo+"</span>&nbsp;";
//					}
//					else {
//						pageBar += "&nbsp;<a class = 'pageNumber' href = '/artree/event.at?currentShowPageNo="+ pageNo +"'>"+pageNo+"</a>&nbsp;";
//					}
//					
//					pageNo++;	// 1 부터 10 까지
//								// 11 부터 20 까지
//								// 21 부터 30 까지
//								// 31 부터 40 까지
//								// 41 
//					loop++;     // 매번 loop 가 1씩 증가	
//				} // end of while() -------------------
//			
//				// 다음 만들기
//				if(pageNo <= totalPage) {
//					pageBar += "&nbsp;<a href = '/artree/event.at?currentShowPageNo="+pageNo+"'><i class='fa fa-angle-right' style='font-size:20px'></i></a>&nbsp;";
//				} else {
//					pageBar += "&nbsp;<a href = '/artree/event.at?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-right' style='font-size:20px'></i></a>&nbsp;";
//					
//				}
//				pageBar += "&nbsp;<a href = '/artree/event.at?currentShowPageNo="+totalPage+"'><i class='fa fa-angle-double-right' style='font-size:20px'></i></a>&nbsp;";
//												
//				request.setAttribute("pageBar", pageBar);
//
//				// 이벤트리스트 조회			
//				String content = ""; 
//				for (int i=0; i<EventList.size(); i++) {
//					content += "<div data-toggle=\"modal\" data-target=\"#myModal\" class=\"contentBin\">";
//					content += "	<div><img style=\"width: 280px; height: 280px;\" src=\""+EventList.get(i).get("MAINPOSTER")+"\"></div>";
//					content += "	<div style=\"margin: 10px 0px; line-height: 1.6; \">";
//					content += "		<div style=\"font-weight: bold; font-size: 17px;\" >"+EventList.get(i).get("EVENTNAME")+"</div>";		
//					content += "		<div style=\"font-size: 15px;\">"+EventList.get(i).get("STARTDATE")+" ~ "+EventList.get(i).get("ENDDATE")+"</div>";
//					content += "		<div><input id=\"eventNo\" name=\"eventNo\" hidden=\"hidden\" value=\""+EventList.get(i).get("NO")+"\"></div>";
//					content += "	</div>";
//					content += "</div>";
//					content += "";
//				}		
//				request.setAttribute("content", content);
//		
//		return "board/events/eventList.tiles";
//	}
//	
//	@RequestMapping(value="/addEvent.at")
//	public String addCommunity(HttpServletRequest request) {
//				
//		// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
//		String searchWord = "";
//		List<HashMap<String,String>> exhibitionList = service.getExhibit(searchWord);
//		request.setAttribute("exhibitionList", exhibitionList);
//		
//		return "board/events/addEvent.tiles";
//	} // end of addCommunity --------------------------------------------
//	
//	@RequestMapping(value="/addEventEnd.at")
//	public void addEventEnd(HttpServletRequest request, HttpServletResponse response) {
//		
//		String title = request.getParameter("title");
//		String content = request.getParameter("contents");
//		String fk_exhibitionno = request.getParameter("no");
//		String period = request.getParameter("period");
//		String periodEnd = request.getParameter("periodEnd");
//		
//		HashMap<String,String> addEvent = new HashMap<String,String>();
//		
//		HttpSession session = request.getSession();
//		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
//		if(loginuser != null) {
//			addEvent.put("fk_idx", loginuser.getIdx());
//		}
//		addEvent.put("title", title);
//		addEvent.put("content",content);
//		addEvent.put("fk_exhibitionno", fk_exhibitionno);
//		addEvent.put("period", period);
//		addEvent.put("periodEnd", periodEnd);
//		
//		// 새 글 추가하기
//		int n = eventService.addEvent(addEvent);
//		
//		try {
//			String msg = "";
//			
//			if(n==1) { msg = "글쓰기 완료!"; }
//			else { msg = "에러가 발생했습니다."; 
//			}
//			
//			String loc = "/artree/event.at";
//			
//			request.setAttribute("msg", msg); 
//			request.setAttribute("loc", loc);
//			
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
//			dispatcher.forward(request, response);
//				
//		} catch (ServletException | IOException e) {
//			e.printStackTrace();
//		} 
//	} // end of addEvent --------------------------------------------
//	
//	// 이벤트 상세 조회 
//	@ResponseBody
//	@RequestMapping(value = "/eventDetail.at", produces = "text/plain;charset=UTF-8")
//	public String eventDetail(HttpServletRequest request) {				
//		String eventNo =request.getParameter("eventNo");				
//		List<HashMap<String, String>> eventDetail = eventService.eventDetail(eventNo);		
//		String jsonStr = "";
//		
//		JSONObject jsonObj = new JSONObject();
//			
//			Set key = eventDetail.get(0).keySet();
//			Iterator iterator = key.iterator();		
//			for (iterator = key.iterator(); iterator.hasNext();) {
//			   String keyName = (String) iterator.next();		
//			   jsonObj.put(keyName, eventDetail.get(0).get(keyName));			   
//			}
//			
//		jsonStr = jsonObj.toString();		
//		return jsonStr;
//	}
//	
//}
