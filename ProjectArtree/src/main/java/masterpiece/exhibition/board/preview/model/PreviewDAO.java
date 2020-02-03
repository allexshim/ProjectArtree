package masterpiece.exhibition.board.preview.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
  
@Repository
public class PreviewDAO implements InterPreviewDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	////////////////////////// 전시회명 검색 - 모달에 띄울 전시회 리스트 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getModalExhList(String key) {
		List<HashMap<String, String>> ModalExhList = sql.selectList("preview.getModalExhList", key);
		return ModalExhList;
	}

	//////////////////////// 기대평 글 쓰기 //////////////////////////////
	@Override
	public int addEnd(HashMap<String, String> paraMap) {
		int result = sql.insert("preview.addEnd", paraMap);
		return result;
	}

	/////////////////////// 기대평 글 목록 가져오기 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getPreviewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> PreviewList = sql.selectList("preview.getPreviewList", paraMap);
		return PreviewList;
	}

	////////////////////// 기대평 게시물 총 갯수 ///////////////////////////
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int TotalCount = sql.selectOne("preview.getTotalCount", paraMap);
		return TotalCount;
	}

}
