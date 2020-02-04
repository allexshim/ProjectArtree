package masterpiece.exhibition.order.model;

import java.util.HashMap;
import java.util.List;

public interface InterOrderDAO {
	
	List<HashMap<String, String>> getEx(HashMap<String, String> map); // 전시회 정보 조회 

	int insertCart(HashMap<String, String> paraMap); // 장바구니 입력

	String selectCartNo(String idx); // 장바구니 번호 불러오기

	int insertCartDetail(HashMap<String, String> paraMap); // 장바구니 상세 입력

	List<HashMap<String, String>> selectCartNoList(HashMap<String, String> map); // 장바구니 번호들 조회

	List<HashMap<String, String>> cartDetailList(String string); // 장바구니 상세 조회

	int delCartDetail(String cartNo); // 장바구니 상세 삭제
	int delCart(String cartNo); // 장바구니 삭제	

	int insertReser(HashMap<String, String> map); // 예매 입력

	String selectReserNo(HashMap<String, String> map); // 예매번호 조회

	int insertReserDetail(HashMap<String, String> map2); // 예매 상세 입력 

	String selectReserDetailNo(HashMap<String, String> map); // 예매상세번호 조회

	int insertEx(HashMap<String, String> map); // 예매 전시회 입력 	

	List<HashMap<String, String>> selectReser(HashMap<String, String> map); // 예매 조회

	List<HashMap<String, String>> selectReserDetail(HashMap<String, String> map); // 예매상세 조회

	List<HashMap<String, String>> selectReserEx(HashMap<String, String> map); // 예매전시 조회

	List<HashMap<String, String>> monthlySalesList(HashMap<String, String> map); // 월별매출 조회

	List<HashMap<String, String>> dailySalesList(HashMap<String, String> map); // 일별매출 조회

	List<HashMap<String, String>> reserList(HashMap<String, String> map); // 예매 리스트 조회

	List<HashMap<String, String>> reserDetailNo(HashMap<String, String> map); // 예매상세 번호 조회

	List<String> reserExNo(String detailNo); // 예매전시 번호 조회

	void delReserEx(String reserExNoList); // 예매전시 삭제

	void delReserDetail(String reserNo); // 예매상세 삭제

	void delReser(String reserNo); // 예매삭제

	List<HashMap<String, String>> reserEmailList(String strDate); // 예약 이메일 리스트 

	void upReserEx(String detailNo); // 예매 삭제 업데이트

	void upReserDetail(String reserNo); // 

	void upReser(String reserNo); // 

}
