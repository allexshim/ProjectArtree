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
	public int delCartDetail(String cartNo) {
		int n =sqlsession.delete("order.delCartDetail",cartNo);
		return n;
	}	
	
	//장바구니 삭제
	@Override
	public int delCart(String cartNo) {		
		int n = sqlsession.delete("order.delCart",cartNo);
		return n;
	}

	@Override
	public int insertReser(HashMap<String, String> map) {
		int n = sqlsession.insert("order.insertReser",map);	
		return n;
	}
	
	//예매번호 조회
	@Override
	public String selectReserNo(HashMap<String, String> map) {
		String selectReserNo = sqlsession.selectOne("order.selectReserNo",map);
		return selectReserNo;
	}

	@Override
	public int insertReserDetail(HashMap<String, String> map2) {
		int n = sqlsession.insert("order.insertReserDetail",map2);	
		return n;
	}

	@Override
	public String selectReserDetailNo(HashMap<String, String> map) {
		String selectReserDetailNo = sqlsession.selectOne("order.selectReserDetailNo",map);
		return selectReserDetailNo;
	}

	@Override
	public int insertEx(HashMap<String, String> map) {
		int n = sqlsession.insert("order.insertEx",map);	
		return n;
	}

	@Override
	public List<HashMap<String, String>> selectReser(HashMap<String, String> map) {
		List<HashMap<String, String>> selectReser = sqlsession.selectList("order.selectReser",map);
		return selectReser;
	}

	@Override
	public List<HashMap<String, String>> selectReserDetail(HashMap<String, String> map) {
		List<HashMap<String, String>> selectReserDetail = sqlsession.selectList("order.selectReserDetail",map);
		return selectReserDetail;
	}

	@Override
	public List<HashMap<String, String>> selectReserEx(HashMap<String, String> map) {
		List<HashMap<String, String>> selectReserEx = sqlsession.selectList("order.selectReserEx",map);
		return selectReserEx;
	}

	@Override
	public List<HashMap<String, String>> monthlySalesList(HashMap<String, String> map) {
		List<HashMap<String, String>> monthlySalesList = sqlsession.selectList("order.monthlySalesList",map);
		return monthlySalesList;
	}

	@Override
	public List<HashMap<String, String>> dailySalesList(HashMap<String, String> map) {
		List<HashMap<String, String>> dailySalesList = sqlsession.selectList("order.dailySalesList",map);
		return dailySalesList;
	}

	@Override
	public List<HashMap<String, String>> reserList(HashMap<String, String> map) {
		List<HashMap<String, String>> reserList = sqlsession.selectList("order.reserList",map);
		return reserList;
	}

	@Override
	public List<HashMap<String, String>> reserDetailNo(HashMap<String, String> map) {
		List<HashMap<String, String>> reserDetailNo = sqlsession.selectList("order.reserDetailNo",map);
		return reserDetailNo;
		
	}

	@Override
	public List<String> reserExNo(String detailNo) {
		List<String> reserExNo = sqlsession.selectList("order.reserExNo",detailNo);
		return reserExNo;
	}

	@Override
	public void delReserEx(String detailNo) {
		sqlsession.delete("order.delReserEx",detailNo);		
	}

	@Override
	public void delReserDetail(String reserNo) {
		sqlsession.delete("order.delReserDetail",reserNo);		
	}

	@Override
	public void delReser(String reserNo) {
		sqlsession.delete("order.delReser",reserNo);			
	}

	// 예약 이메일 리스트 
	@Override
	public List<HashMap<String, String>> reserEmailList(String strDate) {
		List<HashMap<String, String>> reserEmailList = sqlsession.selectList("order.reserEmailList",strDate);
		return reserEmailList;
	}

	// 예매 삭제 업데이트
	@Override
	public void upReserEx(String detailNo) {
		sqlsession.update("order.upReserEx",detailNo);		
	}

	@Override
	public void upReserDetail(String reserNo) {
		sqlsession.update("order.upReserDetail",reserNo);		
	}

	@Override
	public void upReser(String reserNo) {
		sqlsession.update("order.upReser",reserNo);		
	}
	
}
