package masterpiece.exhibition.order.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import masterpiece.exhibition.order.model.InterOrderDAO;

@Service
public class OrderService implements InterOrderService {
	@Autowired
	private InterOrderDAO dao;
	
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
}
