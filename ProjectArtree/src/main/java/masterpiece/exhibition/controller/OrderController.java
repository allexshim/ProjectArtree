package masterpiece.exhibition.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	@RequestMapping(value="/ticketsbin.at")
	public String ticketsbin(HttpServletRequest request) {
		
		//request.getParameter("No");
		int price = 12000;
		double price20 = (double) price*0.8;
		double price30 = (double) price*0.7;
		double price50 = (double) price*0.5;
					
		request.setAttribute("price", price);
		request.setAttribute("price20", price20);
		request.setAttribute("price30", price30);
		request.setAttribute("price50", price50);						
		
		return "order/ticketsbin.tiles";
	}
	
	@RequestMapping(value="/datebin.at")
	public String datebin(HttpServletRequest request) {
		String[] qt = request.getParameterValues("qt");
		HttpSession session = request.getSession();
		session.setAttribute("qt", qt);
		
		return "order/datebin.tiles";
	}
	
	@RequestMapping(value="/detailsbin.at")
	public String detailsbin(HttpServletRequest request) {
		return "order/detailsbin.tiles";
	}
	
	@RequestMapping(value="/paymentbin.at")
	public String paymentbin(HttpServletRequest request) {
		return "order/paymentbin.tiles";
	}
	
	@RequestMapping(value="/paymentGatebin.at")
	public String paymentGatebin(HttpServletRequest request) {
		return "order/paymentGateway";
	}
}
