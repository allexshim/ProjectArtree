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
import org.springframework.web.bind.annotation.RequestMethod;
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
			
			HashMap<String, String> paraMap = new HashMap<String, String>();
			paraMap.put("email", email);
			paraMap.put("password", SHA256.encrypt(password));
			
			MemberVO loginuser = service.getLoginMember(paraMap);
			
			System.out.println("loginuser : "+loginuser);
			
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
	
	@ResponseBody
	@RequestMapping(value="/duplicateCheck.at", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String duplicateCheck(HttpServletRequest request) {

		String email = request.getParameter("email");
		boolean isExistEmail;
		
		JSONObject jsonObj = new JSONObject();
		
		isExistEmail = service.duplicateCheck(email);
			
		if (isExistEmail) {
			jsonObj.put("msg", "이미 사용중인 이메일입니다.");
			jsonObj.put("bool", "true");
		}
		else if (!isExistEmail)  {
			jsonObj.put("msg", "사용 가능한 이메일입니다.");
			jsonObj.put("bool", "false");
		}

		String result = jsonObj.toString(); 
		
		return result;
	} // end of duplicateCheck --------------------------------------------
	
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
	
	@ResponseBody
	@RequestMapping(value="/loginEnd.at")
	public ModelAndView loginEnd(HttpServletRequest request, ModelAndView mav) {
		
		String email = request.getParameter("email_login");
		String password = request.getParameter("password_login");
		
		HashMap<String, String> paraMap = new HashMap<String, String>();
		
		paraMap.put("email", email);
		paraMap.put("password", SHA256.encrypt(password));
		
		// 로그인 확인
		MemberVO loginuser = service.getLoginMember(paraMap);
		
		HttpSession session = request.getSession();
		
		if(loginuser == null) {
			String msg = "로그인 정보가 일치하지 않습니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
			
			mav.setViewName("msg");
			
		}
		else {
			
			if(loginuser.isIdleStatus() == true) {
				// 로그인을 한지 1년이 지나서 휴면상태로 빠진 경우
				String msg = "로그인을 한지 1년이 지나서 휴면상태로 빠졌습니다. 관리자에게 문의 바랍니다.";
			
			    /// 로그인을 한지 1년이 지났으면 로그인을 하지 못하도록 막아버리는 것 ///
				//	String loc = "javascript:history.back()";
				////////////////////////////////////////////////////////
				
				////// 로그인을 한지 1년이 지났지만 정상적으로 로그인 처리를 해주는 것 ///
				String loc = "/artree";
				session.setAttribute("loginuser", loginuser);
				/////////////////////////////////////////////////////////
				
				mav.addObject("msg", msg);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");
			}
			else {
				if(loginuser.isRequirePwdChange() == true) {
					// 암호를 최근 3개월 동안 변경하지 않은 경우
					session.setAttribute("loginuser", loginuser);
					
					String msg = "암호를 최근 3개월 동안 변경하지 않으셨습니다. 암호변경을 위해 나의정보 페이지로 이동합니다."; 
					String loc = request.getContextPath()+"/mypage_set.at";
					
					mav.addObject("msg", msg);
					mav.addObject("loc", loc);
					
					mav.setViewName("msg");
				}
				else {
					// 아무런 이상없이 로그인 하는 경우
					session.setAttribute("loginuser", loginuser);
					
					if(session.getAttribute("gobackURL") != null) {
						// 세션에 저장된 돌아갈 페이지의 주소(gobackURL)이 있다라면
						
						String gobackURL = (String) session.getAttribute("gobackURL");
						mav.addObject("gobackURL", gobackURL); // request 영역에 저장시키는 것이다.
						
						session.removeAttribute("gobackURL");
					}
					
					mav.setViewName("member/login/loginEnd");
					
				}
			}
			
		}

		return mav;
	} // end of loginEnd --------------------------------------------
	
	@RequestMapping(value="logout.at")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mav) {
		HttpSession session = request.getSession();
	    session.invalidate();
		
	    String msg = "로그아웃 성공!!";
		String loc = "/artree";
	    
	    mav.addObject("msg", msg);
		mav.addObject("loc", loc);
	    
		mav.setViewName("msg");
		return mav;
	} // end of logout --------------------------------------------


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
