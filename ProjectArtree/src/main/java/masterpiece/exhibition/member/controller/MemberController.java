package masterpiece.exhibition.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.common.AES256;
import masterpiece.exhibition.common.SHA256;
import masterpiece.exhibition.member.model.MemberVO;
import masterpiece.exhibition.member.service.InterMemberService;

@Component
@Controller
public class MemberController {
	
	// 의존객체 주입
	@Autowired   
	private InterMemberService service;

	@Autowired   
	private AES256 aes;
	
	@RequestMapping(value="/join.at")
	public String join(HttpServletRequest request) {
		
		return "member/join/join.tiles";
	} // end of join --------------------------------------------
	
	@RequestMapping(value="/joinEnd.at")
	public String joinEnd(HttpServletRequest request) {
		
		/////////////////// 회원가입 ////////////////////
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		int agegroup = Integer.parseInt(request.getParameter("agegroup"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		String area = request.getParameter("area");
		String hp = request.getParameter("hp");
	
		// 클라이언트의 IP 주소 알아오기
		String clientIP = request.getRemoteAddr();
		
		MemberVO mvo = new MemberVO();
		mvo.setEmail(email);
		mvo.setName(name);
		mvo.setPassword(SHA256.encrypt(password));
		mvo.setAgegroup(agegroup);
		mvo.setGender(gender);
		mvo.setArea(area);
		
		try {
			mvo.setHp(aes.encrypt(hp));
		} catch (UnsupportedEncodingException | GeneralSecurityException e) {
			e.printStackTrace();
		}
		
		mvo.setClientIP(clientIP);
		////////////////////////////////////////////////////
	
		/////////////////// 선호 전시회 설정 ////////////////////
		
		////////////////////////////////////////////////////

		// 데이터베이스에 회원가입 데이터 insert
		int n = service.joinInsert(mvo);
		
		int m = 0;
		
		if(n==1) {
		}
		
		else {
			String msg = "회원가입 실패";
			String loc = "javascript:history.back()";
			 
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);			
		}
		
		return "member/join/joinEnd";
		
	} // end of joinEnd --------------------------------------------
	
	@RequestMapping(value="/joinEndTwo.at")
	public String joinEndTwo(HttpServletRequest request) {
		
		return "member/join/joinEndTwo";
	} // end of joinEnd --------------------------------------------
	
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
