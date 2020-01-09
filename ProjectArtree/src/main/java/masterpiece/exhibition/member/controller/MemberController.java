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
	
	@RequestMapping(value="/passwordFind.at")
	public String passwordFind(HttpServletRequest request) {
		
		return "member/login/passwordFind.tiles";
	} // end of passwordFind --------------------------------------------
	
}