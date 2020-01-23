package masterpiece.exhibition.board.review.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReviewController {

	@RequestMapping(value="/reviewList.at")
	public String reviewList(HttpServletRequest request) {

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
	
	
	
}
