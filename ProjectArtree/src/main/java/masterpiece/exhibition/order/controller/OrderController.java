package masterpiece.exhibition.order.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import masterpiece.exhibition.order.service.InterOrderService;

@Controller
public class OrderController {
	
	@Autowired
	private InterOrderService service;
	
	@RequestMapping(value="/ticketsbin.at")
	public String ticketsbin(HttpServletRequest request) {
		HashMap<String,String> map = new HashMap<String,String>();
				
		String no = "4901"; // 구매하기 눌렀을때 전시회 번호 받아와야함 지금은 임시
		if ( no==null || no.trim().isEmpty() ) {
			no = "";
		}
		
		map.put("no", no);
		
		List<HashMap<String, String>> exList = service.getEx(map);
		
		
		// 키값 꺼내서 리퀘스트셋
		Set key = exList.get(0).keySet();
		Iterator iterator = key.iterator();		
		for (iterator = key.iterator(); iterator.hasNext();) {
		   String keyName = (String) iterator.next();		   
		   System.out.println(keyName);
		   request.setAttribute(keyName, exList.get(0).get(keyName));
		}		
		
		request.setAttribute("exList", exList);
		
		int price = Integer.parseInt(exList.get(0).get("price"));
		String img ="base.jpg";
		
		double price20 = (double) price*0.8;
		double price30 = (double) price*0.7;
		double price50 = (double) price*0.5;
					
		request.setAttribute("price", price);
		request.setAttribute("price20", price20);
		request.setAttribute("price30", price30);
		request.setAttribute("price50", price50);								
		request.setAttribute("img", img);
					
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
	
	@RequestMapping(value="/paymentbin.at")
	public String paymentbin(HttpServletRequest request) {
						
		String html = "";
		
		String[] qt = request.getParameterValues("qt");				
		String[] type = request.getParameterValues("type");
		String[] price = request.getParameterValues("price");			
		
		if ( qt != null && type != null && price != null ) {
			for (int i=0; i<qt.length; i++){	
				if(Integer.parseInt(qt[i])==0) {
					html += "";
				}				
				else {
					html += "<div style='border-bottom: 1px solid white; color:#666; font-size:14px; padding:4px 10px; overflow: hidden; background-color: #f3f3f4;'>";
					html += "<div style='float: left; width: 25%; text-align: left;'>"+type[i]+"</div>";
					html += "<div style='float: left;'>"+qt[i]+"&nbsp;Item(s)</div>";
					html += "<div style='float: right;'>"+price[i]+"</div>";
					html += "</div>	";
				}							
			}		
			request.setAttribute("html", html);			
		}					
			
		String totalBin = request.getParameter("totalBin");
		String dateBin = request.getParameter("dateBin");			
		String exhibitionname = request.getParameter("exhibitionname");		
		
		HttpSession session = request.getSession();
		
		session.setAttribute("qt", qt);
		session.setAttribute("totalBin", totalBin);
		session.setAttribute("dateBin", dateBin);						
		
		request.setAttribute("totalBin", totalBin);
		request.setAttribute("dateBin", dateBin);
		request.setAttribute("exhibitionname", exhibitionname);
		
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
