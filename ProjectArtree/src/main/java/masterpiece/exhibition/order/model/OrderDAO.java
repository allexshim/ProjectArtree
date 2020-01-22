package masterpiece.exhibition.order.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDAO implements InterOrderDAO {
	
	@Autowired
	private SqlSessionTemplate sqlsession;	
	
	// 전시회 조회
	@Override
	public List<HashMap<String,String>> getEx(HashMap<String, String> map) {
		List<HashMap<String,String>> exList =  sqlsession.selectList("order.exList",map);
		return exList;
	}

	// 장바구니 입력
	@Override
	public int insertCart(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("order.inserCart",paraMap);
		return n;
	}

	// 장바구니 번호 불러오기
	@Override
	public String selectCartNo(String idx) {
		String selectCartNo = sqlsession.selectOne("order.selectCartNo",idx);
		return selectCartNo;
	}

	// 장바구니 상세 입력
	@Override
	public int insertCartDetail(HashMap<String, String> paraMap) {
		int n = sqlsession.insert("order.insertCartDetail",paraMap);
		return n;
	}

	// 장바구니 번호들 조회
	@Override
	public List<HashMap<String, String>> selectCartNoList(HashMap<String, String> map) {
		List<HashMap<String, String>> selectCartNoList = sqlsession.selectList("order.selectCartNoList",map);	
		return selectCartNoList;
	}

	// 장바구니 상세 조회
	@Override
	public List<HashMap<String, String>> cartDetailList(String string) {
		List<HashMap<String, String>> cartDetailList = sqlsession.selectList("order.cartDetailList",string);		
		return cartDetailList;
	}

	//장바구니 상세 삭제
	@Override
	public void delCartDetail(String cartNo) {
		sqlsession.delete("order.delCartDetail",cartNo);		
	}	
	
	//장바구니 삭제
	@Override
	public void delCart(String cartNo) {		
		sqlsession.delete("order.delCart",cartNo);		
	}

	
}
