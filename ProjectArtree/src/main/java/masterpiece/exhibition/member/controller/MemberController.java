package masterpiece.exhibition.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping(value="/join.at")
	public String join(HttpServletRequest request) {
		
		return "member/join/join.tiles";
	} // end of join --------------------------------------------
	
	@RequestMapping(value="/idFind.at")
	public String idFind(HttpServletRequest request) {
		
		return "member/login/idFind.tiles";
	} // end of idFind --------------------------------------------
	
	@RequestMapping(value="/idFindEnd.at")
	public String idFindEnd(HttpServletRequest request) {
		
		return "member/login/idFindEnd.tiles";
	} // end of idFind --------------------------------------------
	
	@RequestMapping(value="/passwordFind.at")
	public String passwordFind(HttpServletRequest request) {
		
		return "member/login/passwordFind.tiles";
	} // end of passwordFind --------------------------------------------
	
	@RequestMapping(value="/mypage.at")
	public String mypage(HttpServletRequest request) {
		
		return "member/mypage/mypage.tiles";
	} // end of mypage --------------------------------------------
	
	@RequestMapping(value="/mypage_order.at")
	public String mypage_order(HttpServletRequest request) {
		
		return "member/mypage/mypage_order.tiles";
	} // end of mypage_order --------------------------------------------
	
	@RequestMapping(value="/mypage_set.at")
	public String mypage_set(HttpServletRequest request) {
		
		return "member/mypage/mypage_set.tiles";
	} // end of mypage_set --------------------------------------------
	
}
