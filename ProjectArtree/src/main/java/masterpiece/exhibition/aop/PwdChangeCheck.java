package masterpiece.exhibition.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.board.preview.service.InterPreviewService;
import masterpiece.exhibition.member.model.MemberVO;

@Aspect
@Component
public class PwdChangeCheck {
	
	@Autowired
	private InterPreviewService service;


	@Pointcut("execution(public * masterpiece.exhibition..*Controller.loginEnd(..)) ")
	public void PwdCheck() {}
    // 해당 패키지의 Core클래스의 m1() 이라는 메소드를 Pointcut 으로 지정한다.
	
	@After("PwdCheck()")
	public ModelAndView After(JoinPoint joinPoint) throws Throwable {
		
		HttpServletRequest request = (HttpServletRequest)joinPoint.getArgs()[0];
		ModelAndView mav = (ModelAndView)joinPoint.getArgs()[1];
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(loginuser != null) {
			
			String idx = loginuser.getIdx();
			
			String bool = service.getPwdCheck(idx);

			if("true".equals(bool)) {
				String confirm = "비밀번호를 변경하신지 6개월이 지났습니다. 지금 변경하시겠습니까?"; 
				String loc = "/artree";
				
				mav.addObject("confirm", confirm);
				mav.addObject("loc", loc);
				
				mav.setViewName("msg");

			}
			
		}// end of if --------------------
		
		return mav;
	}

	
	
	
}
