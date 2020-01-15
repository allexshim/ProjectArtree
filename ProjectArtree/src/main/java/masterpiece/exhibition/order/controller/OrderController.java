package masterpiece.exhibition.order.controller;

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
	
		HttpSession session = request.getSession();
		String[] qt = null;
		String bin = "";
		qt = (String[])session.getAttribute("qt");
		if ( qt != null ) {
			for (int i=0; i<qt.length; i++) {
				if(i==0) {
					bin+= qt[i];
				}
				else {
					bin += ","+qt[i];
				}	
			}
			request.setAttribute("bin", bin);
		}					
		
		return "order/ticketsbin.tiles";
	}
	
	@RequestMapping(value="/datebin.at")
	public String datebin(HttpServletRequest request) {
		String[] qt = request.getParameterValues("qt");
		String totalBin = request.getParameter("totalBin");		
		
		HttpSession session = request.getSession();
		session.setAttribute("qt", qt);
		session.setAttribute("totalBin", totalBin);
		
		return "order/datebin.tiles";
	}
	
	@RequestMapping(value="/detailsbin.at")
	public String detailsbin(HttpServletRequest request) {
		String date = request.getParameter("dateBin");
		HttpSession session = request.getSession();
		session.setAttribute("dateBin", date);		
		
		return "order/detailsbin.tiles";
	}
	
	@RequestMapping(value="/paymentbin.at")
	public String paymentbin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String[] qt = (String[])session.getAttribute("qt");
		String totalBin = (String)session.getAttribute("totalBin");	
		String dateBin = (String)session.getAttribute("dateBin");
		
		request.setAttribute("qt", qt);
		request.setAttribute("totalBin", totalBin);
		request.setAttribute("dateBin", dateBin);
		return "order/paymentbin.tiles";
	}
	
	@RequestMapping(value="/paymentGatebin.at")
	public String paymentGatebin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		String totalBin = (String)session.getAttribute("totalBin");		
		String dateBin = (String)session.getAttribute("dateBin");
		
		request.setAttribute("totalBin", totalBin);
		request.setAttribute("dateBin", dateBin);
		return "order/paymentGateway";
	}
	
	@RequestMapping(value="/orderEnd.at")
	public String orderEnd(HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		String totalBin = (String)session.getAttribute("totalBin");		
		String dateBin = (String)session.getAttribute("dateBin");
		
		request.setAttribute("totalBin", totalBin);
		request.setAttribute("dateBin", dateBin);
		return "order/orderEnd.tiles";
	}	
	
	@RequestMapping(value="/refundBin.at")
	public String refundBin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();		
		String totalBin = (String)session.getAttribute("totalBin");		
		String dateBin = (String)session.getAttribute("dateBin");
		
		request.setAttribute("totalBin", totalBin);
		request.setAttribute("dateBin", dateBin);
		return "order/orderEnd.tiles";
	}		
	
}
