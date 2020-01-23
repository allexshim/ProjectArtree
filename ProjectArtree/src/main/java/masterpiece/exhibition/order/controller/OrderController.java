package masterpiece.exhibition.order.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		   request.setAttribute(keyName, exList.get(0).get(keyName));
		}		
		
		request.setAttribute("exList", exList);
		
		int price = Integer.parseInt(exList.get(0).get("price"));
		String img ="base.jpg";
		
		int price20 = (int) (price*0.8);
		int price30 = (int) (price*0.7);
		int price50 = (int) (price*0.5);
					
		request.setAttribute("price", price);
		request.setAttribute("price20", price20);
		request.setAttribute("price30", price30);
		request.setAttribute("price50", price50);								
		request.setAttribute("img", img);
					
		HttpSession session = request.getSession();	
		session.setAttribute("no", no);
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
		return "order/paymentbin.tiles";
	}
		
	@RequestMapping(value="/insertCart.at")
	public ModelAndView insertCart(HttpServletRequest request, ModelAndView mav) {
		
		HttpSession session = request.getSession();
		HashMap<String,String> map = new HashMap<String,String>();	
		String dateBin = request.getParameter("dateBin");		
		String exname = request.getParameter("exhibitionname");
	
		map.put("date", dateBin);
		map.put("exname", exname);			
		
		// 장바구니 입력
		String idx = "1";
		map.put("idx", idx);
		String no = (String)session.getAttribute("no");
		map.put("no", no);
		if ( dateBin != null ) 
		service.insertCart(map);		
		
		String cartNo = service.selectCartNo(idx);
		map.put("cartNo", cartNo);
		
		String[] qt = request.getParameterValues("qt");		
		session.setAttribute("qt", qt);
		String[] type = request.getParameterValues("type");
		String[] price = request.getParameterValues("price");							
		
		if(dateBin != null) {
			if ( qt != null && type != null && price != null ) {
				for (int i=0; i<qt.length; i++){	
					if(Integer.parseInt(qt[i])==0) {
						continue;
					}				
					else {
						// 장바구니 상세 입력 수량,타입
						map.put("qt", qt[i]);
						map.put("type", type[i]);
						map.put("price", price[i]);	
						if ( dateBin != null ) 
						service.insertCartDetail(map);							
					}							
				}											
			}					
		}											
										
		session.setAttribute("exhibitionname", exname);
		session.setAttribute("dateBin", dateBin);					
					
		String msg = null;
		String loc = request.getContextPath()+"/paymentbin.at";
						
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);		
		mav.setViewName("msg");
		return mav;
	}
	
	@RequestMapping(value="/paymentGatebin.at")
	public String paymentGatebin(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String exhibitionname = (String)session.getAttribute("exhibitionname");	
		
		request.setAttribute("exhibitionname", exhibitionname);		
		return "order/paymentGateway";
	}
	
	@RequestMapping(value="/orderEnd.at") // 여기서 트랜잭션
	public String orderEnd(HttpServletRequest request, HashMap<String,String> map) {
		
		String Subtotal = (String)request.getAttribute("Subtotal");
		String Discount = (String)request.getAttribute("Discount");
		String orderpri = (String)request.getAttribute("orderpri");
		map.put("Subtotal", Subtotal);
		map.put("Discount", Discount);
		map.put("orderpri", orderpri);
		
		String idx = "1";
		map.put("idx", idx);
		int n = service.order(map);		
		
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
		
	@ResponseBody
	@RequestMapping(value="/delCart.at")
	public String delCart(HttpServletRequest request) {			
		String jsonStr = "";
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();		
		String delCartNo = request.getParameter("delCartNo");			
		service.delCartDetail(delCartNo);
		service.delCart(delCartNo);									    	
    	jsonArr.put(jsonObj);
    	jsonStr = jsonArr.toString();
		return jsonStr;
	}			
	
	@ResponseBody
	@RequestMapping(value="/cartList.at", produces="text/plain;charset=UTF-8")
	public String cartList(HttpServletRequest request) {			
		
		String jsonStr = "";
		JSONArray jsonArr = new JSONArray();		
		HashMap<String,String> map = new HashMap<String,String>();		
		String idx = "1";
		map.put("idx", idx);		
		String cartNo = "";				
		
		// 장바구니 번호들 불러와서 상세 조회
		List<HashMap<String,String>> CartNoList = service.selectCartNoList(map);				
		
		for ( int i=0; i<CartNoList.size(); i++) {
			cartNo = CartNoList.get(i).get("cartno");		
			String dday = CartNoList.get(i).get("dday");
			String exnameList = CartNoList.get(i).get("exname");			
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("cartNo", cartNo);
			jsonObj.put("dday", dday);
			jsonObj.put("exname", exnameList);
			
			jsonArr.put(jsonObj);								
			}					
		
		jsonStr = jsonArr.toString();
    	return jsonStr;
	}			
	
	@ResponseBody
	@RequestMapping(value="/cartDetailList.at", produces="text/plain;charset=UTF-8")
	public String cartDetailList(HttpServletRequest request) {		
		String cartNo = request.getParameter("cartNo");		
		List<HashMap<String,String>> cartDetailList =service.cartDetailList(cartNo);		
		String jsonStr = "";
		JSONArray jsonArr = new JSONArray();					
		int n = 0;									
	
		for ( int a=0; a<cartDetailList.size(); a++) {
			String qtList = cartDetailList.get(a).get("qt");					
			String priceList = cartDetailList.get(a).get("price");
			String purtype = cartDetailList.get(a).get("purtype");		
			n += Integer.parseInt(qtList)*Integer.parseInt(priceList);				
			JSONObject jsonObj = new JSONObject();
			
			jsonObj.put("qt", qtList);
			jsonObj.put("purtype", purtype);			
			jsonObj.put("price", priceList);
			jsonObj.put("subtotal", n);				
			
			jsonArr.put(jsonObj);								
		}		
			
		jsonStr = jsonArr.toString();											
										
    	return jsonStr;
	}		
	
}
