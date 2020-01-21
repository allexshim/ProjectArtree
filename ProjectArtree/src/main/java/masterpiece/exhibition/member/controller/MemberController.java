package masterpiece.exhibition.member.controller;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public String join(HttpServletRequest request, ModelAndView mav) {
		return "member/join/join.tiles";
		
	} // end of join --------------------------------------------
	
	@RequestMapping(value="/joinInsert.at")
	public ModelAndView joinInsert(HttpServletRequest request, ModelAndView mav) {
		
		/////////////////// 회원가입 ////////////////////
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String agegroup = request.getParameter("agegroup");
		String gender = request.getParameter("gender");
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
		
		// 데이터베이스에 회원가입 데이터 insert
		int n = service.joinInsert(mvo);
		
		if(n==1) {
			MemberVO loginuser = service.getLoginMember(mvo);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginuser", loginuser);
			
			String msg = "회원가입 성공";
			String loc = "/artree/joinEnd.at";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
		}
		
		else {
			String msg = "회원가입 실패";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
		}	
		
		return mav;
	} // end of joinInsert --------------------------------------------
	
	@RequestMapping(value="/joinEnd.at")
	public ModelAndView joinEnd(HttpServletRequest request, ModelAndView mav, MemberVO mvo) {
		
		mav.setViewName("member/join/joinEnd");
		
		return mav;
		
	} // end of joinEnd --------------------------------------------
	
	@ResponseBody
	@RequestMapping(value="/joinEndInsert.at")
	public ModelAndView joinEndInsert(HttpServletRequest request, ModelAndView mav, MemberVO mvo) {
		
		String finalGender = request.getParameter("finalGender");
		String finalAgegroup = request.getParameter("finalAgegroup");
		String finalArea = request.getParameter("finalArea");
		String exhibitionno1 = request.getParameter("exhibitionno1");
		String galleryno1 = request.getParameter("galleryno1");
		String exhibitionno2 = request.getParameter("exhibitionno2");
		String galleryno2 = request.getParameter("galleryno2");
		
		HttpSession session = request.getSession();
	    MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("idx", String.valueOf(loginuser.getIdx()));
		paraMap.put("gender", finalGender);
		paraMap.put("agegroup", finalAgegroup);
		paraMap.put("area", finalArea);
		paraMap.put("exhibitionno1", exhibitionno1);
		paraMap.put("galleryno1", galleryno1);
		paraMap.put("exhibitionno2", exhibitionno2);
		paraMap.put("galleryno2", galleryno2);
		
		List<HashMap<String, String>> myFavorList = service.joinFinalInsert(paraMap);
		
		mav.addObject("myFavorList", myFavorList);
		mav.setViewName("jsonView");  
		
		return mav;
		
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
