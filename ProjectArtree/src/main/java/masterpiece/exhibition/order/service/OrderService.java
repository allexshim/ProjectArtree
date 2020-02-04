package masterpiece.exhibition.order.service;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import masterpiece.exhibition.mail.GoogleMail;
import masterpiece.exhibition.mail.GoogleMailOrder;
import masterpiece.exhibition.order.model.InterOrderDAO;

@Service
public class OrderService implements InterOrderService {
	
	@Autowired
	private InterOrderDAO dao;
	
	
	
	@Autowired
	private GoogleMailOrder mail;
	
	// 전시회 조회
	@Override
	public List<HashMap<String, String>> getEx(HashMap<String, String> map) {
		List<HashMap<String, String>> exList = dao.getEx(map);
		return exList;
	}

	// 장바구니 입력
	@Override
	public int insertCart(HashMap<String, String> paraMap) {
		int n = dao.insertCart(paraMap);
		return n;
	}

	// 장바구니 번호 불러오기
	@Override
	public String selectCartNo(String idx) {
		String selectCartNo = dao.selectCartNo(idx);
		return selectCartNo;
	}

	// 장바구니 상세 입력
	@Override
	public int insertCartDetail(HashMap<String, String> paraMap) {
		int n = dao.insertCartDetail(paraMap);
		return n;
	}

	// 장바구니 번호들 불러오기
	@Override
	public List<HashMap<String, String>> selectCartNoList(HashMap<String, String> map) {
		List<HashMap<String, String>> selectCartNoList = dao.selectCartNoList(map);
		return selectCartNoList;
	}

	// 장바구니 상세 조회
	@Override
	public List<HashMap<String, String>> cartDetailList(String string) {
		List<HashMap<String, String>> cartDetailList = dao.cartDetailList(string);
		return cartDetailList;
	}

	// 장바구니 상세 삭제
	@Override
	public void delCartDetail(String cartNo) {
		dao.delCartDetail(cartNo);	
		
	}
	
	// 장바구니 삭제
	@Override
	public void delCart(String cartNo) {
		dao.delCart(cartNo);		
	}

	// 주문 완료, 장바구니12 삭제, 주문123 인설트 
	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation= Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int order(HashMap<String, String> map) {	
		int n=0;
		int m=0;
		int a=0;
		int c=0;
		int d=0;
		int result=1;		
		List<HashMap<String, String>> cart = dao.selectCartNoList(map);		
		for (int i=0; i<cart.size(); i++ ) {					
			
			// 키값 꺼내서 리퀘스트셋
			Set key = cart.get(i).keySet();
			Iterator iterator = key.iterator();		
			for (iterator = key.iterator(); iterator.hasNext();) {
			   String keyName = (String) iterator.next();		   		   
			   map.put(keyName, cart.get(i).get(keyName));
			}
			
			String cartno = cart.get(i).get("cartno");			
			String idx = cart.get(i).get("fk_idx");
			map.put("idx", idx);
			
			if (i==0) {
				n = dao.insertReser(map);
				result *= n;
				String reserNo = dao.selectReserNo(map);
				map.put("reserNo", reserNo);
			}
			
			m = dao.insertReserDetail(map);	
			result *= m;
			String reserDetailNo = dao.selectReserDetailNo(map);
			map.put("reserDetailNo", reserDetailNo);
			
			List<HashMap<String, String>> cartDetail = dao.cartDetailList(cartno);
			for(int b=0; b<cartDetail.size(); b++) {
								
				// 키값 꺼내서 리퀘스트셋
				Set key2 = cartDetail.get(b).keySet();
				Iterator iterator2 = key2.iterator();		
				for (iterator2 = key2.iterator(); iterator2.hasNext();) {
				   String keyName = (String) iterator2.next();		   		
				   map.put(keyName, cartDetail.get(b).get(keyName));				   			
				}								
				a = dao.insertEx(map);
				result *= a;
			}	
			d = dao.delCartDetail(cartno);
			result *= d;
			c = dao.delCart(cartno);
			result *= c;
			
		}				
		return result;
	}
	
	@Override
	public String selectReserNo(HashMap<String, String> map) {
		String reserNo = dao.selectReserNo(map);
		return reserNo;
	}

	@Override
	public List<HashMap<String, String>> selectReser(HashMap<String, String> map) {
		List<HashMap<String, String>> reserList = dao.selectReser(map);
		return reserList;
	}

	@Override
	public List<HashMap<String, String>> selectReserDetail(HashMap<String, String> map) {
		List<HashMap<String, String>> selectReserDetail = dao.selectReserDetail(map);
		return selectReserDetail;
	}

	@Override
	public List<HashMap<String, String>> selectReserEx(HashMap<String, String> map) {
		List<HashMap<String, String>> selectReserEx = dao.selectReserEx(map);
		return selectReserEx;		
	}

	@Override
	public List<HashMap<String, String>> monthlySalesList(HashMap<String, String> map) {
		List<HashMap<String, String>> monthlySalesList = dao.monthlySalesList(map);
		return monthlySalesList;
	}

	@Override
	public List<HashMap<String, String>> dailySalesList(HashMap<String, String> map) {
		List<HashMap<String, String>> dailySalesList = dao.dailySalesList(map);
		return dailySalesList;
	}

	@Override
	public List<HashMap<String, String>> reserList(HashMap<String, String> map) {
		List<HashMap<String, String>> reserList = dao.reserList(map);
		return reserList;
	}

	@Override
	public List<HashMap<String, String>> reserDetailNo(HashMap<String, String> map) {
		List<HashMap<String, String>> reserDetailNo = dao.reserDetailNo(map);
		return reserDetailNo;
	}

	@Override
	public List<String> reserExNo(String detailNo) {
		List<String> reserExNo = dao.reserExNo(detailNo);
		return reserExNo;
	}

	@Override
	public void delReserEx(String detailNo) {
		dao.delReserEx(detailNo);		
	}

	@Override
	public void delReserDetail(String reserNo) {
		dao.delReserDetail(reserNo);		
	}

	@Override
	public void delReser(String reserNo) {
		dao.delReser(reserNo);		
	}
	
	// 전시 하루전에 메일 보내기 
	@Scheduled(cron="0 0 0 * * *")
	@Override  
	public void ddayAlarmEmail() throws Exception {
		// <<주의>> 스케줄러로 사용되어지는 메소드는 반드시 파라미터가 없어야 한다.!!!!		
		DecimalFormat dec = new DecimalFormat("#,###");	
		Calendar cal = new GregorianCalendar(Locale.KOREA);
		cal.setTime(new Date());
		cal.add(Calendar.DAY_OF_YEAR, 1); // 하루를 더한다. 					
		SimpleDateFormat fm = new SimpleDateFormat("yy/MM/dd");
		String strDate = fm.format(cal.getTime());				
		List<HashMap<String, String>> reserEmailList = dao.reserEmailList(strDate);		
		// 메일 보내기 
		if(reserEmailList.size() > 0) {		   			   	
			for(int i=0; i<reserEmailList.size(); i++) {
				String NAME = reserEmailList.get(i).get("NAME");
				String EXNAME = reserEmailList.get(i).get("EXNAME");
				String FK_RESERNO = reserEmailList.get(i).get("FK_RESERNO");		
				String RESERDATE = reserEmailList.get(i).get("RESERDATE");
				String RESERSTAT = reserEmailList.get(i).get("RESERSTAT");
				int RESERSUBTOTAL = Integer.parseInt(reserEmailList.get(i).get("RESERSUBTOTAL")); 
				int RESERDISCOUNT = Integer.parseInt(reserEmailList.get(i).get("RESERDISCOUNT"));
				int RESERTOTAL = Integer.parseInt(reserEmailList.get(i).get("RESERTOTAL"));
				String PAYMENTOP = reserEmailList.get(i).get("PAYMENTOP");
				String MAINIMG = reserEmailList.get(i).get("MAINIMG");
				String DDAY = reserEmailList.get(i).get("DDAY");
				String RESERDETAILNO = reserEmailList.get(i).get("RESERDETAILNO");
				String EMAIL = reserEmailList.get(i).get("EMAIL");				
				
		   		String emailContents = 		   				
		   						""
		   						+ "<div style=\"padding-top:5%; margin-bottom: 1%; font-weight: bold; font-size: 22px;\">주문정보</div>"
		   						+ "<table style=\"line-height:1.4; text-align:left;\" class=\"table table-hover\">"
		   						+ "<tr>\r\n" + 
		   						"					<th style=\"width:206px; padding:8px; vertical-align:top;\">예매번호</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">"+FK_RESERNO+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">예매일자</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">"+RESERDATE+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">주문자</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">"+NAME+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">예매상태</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">"+RESERSTAT+"</td>\r\n" + 
		   						"				</tr>"
		   						+ "</table>"
		   						+ ""		   					
		   						+ ""
		   						+ "<div style=\"padding-top:5%; margin-bottom: 1%; font-weight: bold; font-size: 22px;\">결제정보</div>\r\n" + 
		   						"			<table style=\"line-height:1.4; text-align:left;\" class=\"table table-hover\">\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"width:206px; padding:8px; vertical-align:top;\">총 주문금액</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">&#8361;"+RESERSUBTOTAL+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">총 할인금액</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">&#8361;"+RESERDISCOUNT+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"				\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">총 결제금액</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">&#8361;"+RESERTOTAL+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"				<tr>\r\n" + 
		   						"					<th style=\"padding:8px; vertical-align:top;\">결제수단</th>\r\n" + 
		   						"					<td style=\"padding:8px; vertical-align:top;\">"+PAYMENTOP+"</td>\r\n" + 
		   						"				</tr>\r\n" + 
		   						"			</table>"
		   						+ ""
		   						+ ""
		   						+ ""
		   						+ ""		   								   								   					
	   							+ "<div class=\"mySlides\">"				
	   							+ "<div style=\"font-weight:bold; display:inline-block; margin-bottom: 1%; font-size: 22px; padding-top: 5%;\">주문 상품 정보</div>"	   							
	   							+ "<table style=\"line-height:1.4; text-align:left;\" class=\"table table-hover\">"				
	   							+ "<tr><th style=\"width:206px; padding:8px; vertical-align:top;\">이미지</th><td style=\"padding:8px; vertical-align:top;\"><img style=\"border-radius: 15px; width: 40%; height: 400px;\" src=\""+MAINIMG+"\"></td></tr>"
	   							+ "<tr><th style=\"padding:8px; vertical-align:top;\">상품정보</th><td style=\"padding:8px; vertical-align:top;\">"+EXNAME+"</td></tr>"
	   							+ "<tr><th style=\"padding:8px; vertical-align:top;\">관람일자</th><td style=\"padding:8px; vertical-align:top;\">"+DDAY+"</td></tr>"
	   							+ "<tr><th style=\"padding:8px; vertical-align:top;\">수량</th><td style=\"padding:8px; vertical-align:top;\"></td></tr>"
	   							+ "";	
		   		
		   						HashMap<String,String> map = new HashMap<String,String>();
		   						map.put("RESERDETAILNO", RESERDETAILNO);
	   							List<HashMap<String,String>> reserExList = dao.selectReserEx(map);	   							
	   							for(int c=0; c<reserExList.size(); c++) {
	   								String purtype = reserExList.get(c).get("PURTYPE");
	   								String qt = reserExList.get(c).get("QT");
	   								int price = Integer.parseInt(reserExList.get(c).get("PRICE"));
	   								emailContents += "<tr><td style=\"padding:8px; vertical-align:top;\">"+purtype+"</td><td style=\"padding:8px; vertical-align:top;\">"+qt+"&nbsp;Item(s)<span style=\"margin-left:25%;\">&#8361;"+dec.format(price)+"</span></td></tr>";										
	   							}		
	   							
	   			  emailContents += "</table>"				
		   						+ "</div>"
		   						+ ""		   									   						   								   								   						
		   						+ ""
		   						+ "<div style=\"margin-top: 5%;\" id=\"accordion\">		\r\n" + 
		   						"			<h3 style=\"text-align: left; font-size: 22px; font-weight: bold;\">▼예매 취소 시 유의사항</h3>\r\n" + 
		   						"			<div style=\"height:325px !important;\">\r\n" + 
		   						"				<div>\r\n" + 
		   						"					<div style=\"font-size: 14px; font-weight: bold;\">유의사항<br><br></div>\r\n" + 
		   						"					<div style=\"line-height:1.8; font-size: 14px;\">\r\n" + 
		   						"						예매티켓의 취소는 관람일 전일까지 가능합니다.<br>\r\n" + 
		   						"						취소마감시간 이후에는 티켓의 취소가 불가합니다.<br>\r\n" + 
		   						"						고객 귀책 사유로 티켓 분실이나 파손이 될 경우에는 티켓은 재발행 되지 않으며, 취소도 불가합니다.<br>\r\n" + 
		   						"						티켓 예매시 선택한 결제수단으로만 환불이 가능합니다.<br>\r\n" + 
		   						"						Artree 이외의 외부 예매처에서 예매한 티켓은 직접 예매한 곳으로 환불 절차를 문의해주시기 바랍니다.<br>\r\n" + 
		   						"						초대권으로 명시된 티켓은 환불이 불가합니다.<br><br>			\r\n" + 
		   						"					</div>\r\n" + 
		   						"				</div>\r\n" + 
		   						"				<div>\r\n" + 
		   						"					<div style=\"font-size: 14px; font-weight: bold;\">취소수수료<br><br></div>\r\n" + 
		   						"					<div style=\"line-height:1.8; font-size: 14px;\">\r\n" + 
		   						"						취소일 : 예매 후 7일 이내<br>\r\n" + 
		   						"						취소수수료 : 없음\r\n" + 
		   						"					</div>\r\n" + 
		   						"				</div>		\r\n" + 
		   						"			</div>\r\n" + 
		   						"			<h3 style=\"text-align: left; font-size: 22px; font-weight: bold;\">▼티켓 수령 안내</h3>\r\n" + 
		   						"			<div style=\"height:400px !important;\">\r\n" + 
		   						"				<div style=\"font-size: 14px; font-weight: bold;\">현장수령<br><br></div>\r\n" + 
		   						"				<div style=\"line-height:1.8; font-size: 14px;\">					\r\n" + 
		   						"					전시당일 뮤지엄 메인로비 '티켓 박스'에서 티켓을 발권 받을 수 있습니다.<br>\r\n" + 
		   						"					입장은 전시 관람 종료 30분 이전까지만 가능합니다.<br>\r\n" + 
		   						"					예매확인서 또는 신분증을 제시하시고 티켓을 수령하실 수 있습니다.\r\n" + 
		   						"				</div>\r\n" + 
		   						"			</div>			\r\n" + 
		   						"		</div>"
		   						+ ""		   		
		   						+ ""; 
		   		
		   	    mail.sendmail(EMAIL, emailContents, NAME, EXNAME);		   	    	
		   	}		   	
		}
	}
	
	// 예매, 상세, 전시 삭제 업데이트
	@Override
	public void upReserEx(String detailNo) {
		dao.upReserEx(detailNo);		
	}

	@Override
	public void upReserDetail(String reserNo) {
		dao.upReserDetail(reserNo);		
	}

	@Override
	public void upReser(String reserNo) {
		dao.upReser(reserNo);		
	}

	@Override
	public String reserStat(String reserNo) {
		String n = dao.reserStat(reserNo);
		return n;
	}
}
