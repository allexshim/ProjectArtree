package masterpiece.exhibition.aop;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.common.MyUtil;

@Aspect
@Component
public class LoginCheck {
	/* requireLogin_ 으로 시작하는 모든 메소드 */
	// === PointCut을 생성한다 === * Controller에서 해당 advice가 필요한 메소드 이름을 require기능_~으로 명명한다.
		@Pointcut("execution(public * masterpiece.exhibition..*Controller.requireLogin_*(..)) ")
		public void requireLogin() {}
		
		// === Before Advice를 구현한다 === //
		@Before("requireLogin()")
		public ModelAndView before(JoinPoint joinpoint, ModelAndView mav) {
			// joinpoint : 포인트 컷 된 주업무의 method
			
			// 로그인 유무 확인 ~ 주업무 메소드의 parameter, request를 얻어온다.
			HttpServletRequest request = (HttpServletRequest)joinpoint.getArgs()[0];
			HttpServletResponse response = (HttpServletResponse)joinpoint.getArgs()[1];
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginuser") == null) {
				try {
					String msg = "먼저 로그인하세요!"; 
					String loc = request.getContextPath()+"/mainartree.at";
					
					mav.addObject("msg",msg);
					mav.addObject("loc",loc);		
					mav.setViewName("msg");
					
					// 로그인 한 후 로그인 하기 전 페이지로 돌아가는 작업 : goBackURL
					// === 현재 페이지의 주소(URL) 알아내기 ===
					String url = MyUtil.getCurrentURL(request);
					session.setAttribute("gobackURL", url); // 세션에 url 정보를 저장시킨다.
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/msg.jsp");
					
					dispatcher.forward(request, response);
				} catch (ServletException | IOException e) {
					e.printStackTrace();
				} 
			} // end of if ------------------------------------------------	
			return mav;
		} // end of before ----------------------------------------------------------
}
