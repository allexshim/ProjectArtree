package masterpiece.exhibition.order.service;

import java.util.HashMap;
import java.util.List;

public interface InterOrderService {

	List<HashMap<String, String>> getEx(HashMap<String, String> map); // 전시회 정보 조회

	int insertCart(HashMap<String, String> paraMap); // 장바구니 입력

	String selectCartNo(String idx); // 장바구니 번호 불러오기

	int insertCartDetail(HashMap<String, String> paraMap); // 장바구니 상세 입력

	List<HashMap<String, String>> selectCartNoList(HashMap<String, String> map); // 장바구니 번호들 조회

	List<HashMap<String, String>> cartDetailList(String string); // 상세 조회
	
	void delCartDetail(String cartNo); // 장바구니 상세 삭제
	void delCart(String cartNo); // 장바구니 삭제

	int order(HashMap<String, String> map); // 트랜잭션 장바구니 삭제, 주문완료, 주문내역

	String selectReserNo(HashMap<String, String> map); // 가장 최근 예매번호

	List<HashMap<String, String>> selectReser(HashMap<String, String> map); // 예매번호 조회

	List<HashMap<String, String>> selectReserDetail(HashMap<String, String> map); // 예매상세 조회

	List<HashMap<String, String>> selectReserEx(HashMap<String, String> map); // 예매전시 조회

	List<HashMap<String, String>> monthlySalesList(HashMap<String, String> map); // 월별매출 조회

	List<HashMap<String, String>> dailySalesList(HashMap<String, String> map); // 일별매출 조회

	List<HashMap<String, String>> reserList(HashMap<String, String> map); // 예매 리스트 조회 

	List<HashMap<String, String>> reserDetailNo(HashMap<String, String> map); // 예매상세 번호조회

	List<String> reserExNo(String detailNo); // 예매전시 번호조회

	void delReserEx(String reserExNoList); // 예매전시 삭제

	void delReserDetail(String reserNo); // 예매상세 삭제

	void delReser(String reserNo); // 예매삭제

	void ddayAlarmEmail() throws Exception; // 하루전 이메일

	void upReserEx(String detailNo); // 예매전시 삭제 업데이트

	void upReserDetail(String reserNo); // 예매상세 삭제 업데이트

	void upReser(String reserNo); // 예매 삭제 업데이트

	String reserStat(String reserNo); // 예매 삭제 확인


}
