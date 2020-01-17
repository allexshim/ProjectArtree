package masterpiece.exhibition.board.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping(value="/reviewList.at")
	public String reviewList(HttpServletRequest request) {
		
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
		
		return "board/review/reviewList.tiles";
	} // end of reviewList --------------------------------------------
	
	
	@RequestMapping(value="/reviewDetail.at")
	public String reviewDetail(HttpServletRequest request) {
		
		return "board/review/reviewDetail.tiles";
	} // end of reviewDetail --------------------------------------------
	
	@RequestMapping(value="/addReview.at")
	public String addReview(HttpServletRequest request) {
		
		return "board/review/addReview.tiles";
	} // end of addReview --------------------------------------------
	
	
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
	
	@RequestMapping(value="/communityList.at")
	public String communityList(HttpServletRequest request) {
		
		return "board/community/communityList.tiles";
	} // end of communityList -------------------------------------------
	
	@RequestMapping(value="/communityDetail.at")
	public String communityDetail(HttpServletRequest request) {
		
		return "board/community/communityDetail.tiles";
	} // end of communityDetail -------------------------------------------
	
	@RequestMapping(value="/addCommunity.at")
	public String addCommunity(HttpServletRequest request) {
		
		return "board/community/addCommunity.tiles";
	} // end of addCommunity --------------------------------------------
	
	
	@RequestMapping(value="/eventList.at")
	public String eventList() {
		return "board/events/eventList.tiles";
	}
	
	@RequestMapping(value="/addEvent.at")
	public String addEvent() {
		
		return "board/events/addEvent.tiles";
	}
	
	// 공지 게시판
	@RequestMapping(value="/notice.at")
	public String notice() {
		return "board/notice/notice.tiles";
	}

	
}
