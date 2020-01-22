package masterpiece.exhibition.order.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	
	
}
