package masterpiece.exhibition.exhibits.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExhibitsDAO implements InterExhibitsDAO {

	@Autowired
	private SqlSessionTemplate sql;
	
	/////////////// 전시회 목록 불러오기 /////////////////
	@Override
	public List<HashMap<String, Object>> getExhList(HashMap<String, String> paraMap) {
		List<HashMap<String, Object>> ExhList = sql.selectList("exhibits.getExhList", paraMap);
		return ExhList;
	}

	/////////////// 전시회, 갤러리 총 게시물 갯수 알아오기 /////////////////
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totCount = sql.selectOne("exhibits.getTotalCount", paraMap);
		return totCount;
	}

	/////////////// 전시회 디테일 페이지 채우기 /////////////////
	@Override
	public HashMap<String, String> getExhDetail(String eno) {
		HashMap<String, String> ExhDetail = sql.selectOne("exhibits.getExhDetail", eno);
		return ExhDetail;
	}

	/////////////// 갤러리 목록 불러오기 /////////////////
	@Override
	public List<HashMap<String, String>> getGalList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> GalList = sql.selectList("exhibits.getGalList", paraMap);
		return GalList;
	}

	////////////////// 갤러리 이번주 추천 공간 ////////////////
	@Override
	public List<HashMap<String, String>> getGalRecomList() {
		List<HashMap<String, String>> galRecomList = sql.selectList("exhibits.getGalRecomList");
		return galRecomList;
	}
	
	/////////////////// 갤러리 이번주 추천 공간 - 해당 갤러리의 전시회 진행 유무 //////////////////
	@Override
	public int getExhStatus(String gno) {
		int ExhStatus = sql.selectOne("exhibits.getExhStatus", gno);
		return ExhStatus;
	}

	//////////////////이번주 추천 공간 - 해당 갤러리의 전시회 리스트 /////////////////
	@Override
	public List<HashMap<String, String>> getRecomExhList(String gno) {
		List<HashMap<String, String>> RecomExhList = sql.selectList("exhibits.getRecomExhList", gno);
		return RecomExhList;
	}
	
	////////////////////// 갤러리 상세 페이지 /////////////////////
	@Override
	public HashMap<String, String> getGalDetail(String gno) {
		HashMap<String, String> GalDetail = sql.selectOne("exhibits.getGalDetail", gno);
		return GalDetail;
	}

	///////////////////// 특정 갤러리의 전시중 전시회 목록 불러오기 /////////////////////////
	@Override
	public List<HashMap<String, String>> getIngExhListMap(String gno) {
		List<HashMap<String, String>> IngExhListMap = sql.selectList("exhibits.getIngExhListMap", gno);
		return IngExhListMap;
	}
	
	///////////////////// 특정 갤러리의 전시예정 전시회 목록 불러오기 /////////////////////////
	@Override
	public List<HashMap<String, String>> getComExhListMap(String gno) {
		List<HashMap<String, String>> ComExhListMap = sql.selectList("exhibits.getComExhListMap", gno);
		return ComExhListMap;
	}
	
	///////////////////// 특정 갤러리의 전시종료 전시회 목록 불러오기 /////////////////////////
	@Override
	public List<HashMap<String, String>> getEndExhListMap(String gno) {
		List<HashMap<String, String>> EndExhListMap = sql.selectList("exhibits.getEndExhListMap", gno);
		return EndExhListMap;
	}

	////////////////////////////// 전시회 좋아요 체크 유무 확인 /////////////////////////////////
	@Override
	public int getCheckExhLike(HashMap<String, String> paraMap) {
		int CheckExhLike = sql.selectOne("exhibits.getCheckExhLike", paraMap);
		return CheckExhLike;
	}

	////////////////////////////// 갤러리 좋아요 체크 유무 확인 /////////////////////////////////
	@Override
	public int getCheckGalLike(HashMap<String, String> paraMap) {
		int CheckGalLike = sql.selectOne("exhibits.getCheckGalLike", paraMap);
		return CheckGalLike;
	}

	//////////////////////////// 전시회 좋아요 지정 해제 ///////////////////////////
	@Override
	public int goCheckDislikeExh(HashMap<String, String> paraMap) {
		int CheckDislikeExh = sql.delete("exhibits.goCheckDislikeExh", paraMap);
		return CheckDislikeExh;
	}

	//////////////////////////// 전시회 좋아요 지정 ///////////////////////////
	@Override
	public int goCheckLikeExh(HashMap<String, String> paraMap) {
		int CheckLikeExh = sql.insert("exhibits.goCheckLikeExh", paraMap);
		return CheckLikeExh;
	}

	//////////////////////////// 갤러리 좋아요 지정 해제 ///////////////////////////
	@Override
	public int goCheckDislikeGal(HashMap<String, String> paraMap) {
		int CheckDislikeGal = sql.delete("exhibits.goCheckDislikeGal", paraMap);
		return CheckDislikeGal;
	}

	//////////////////////////// 갤러리 좋아요 지정  ///////////////////////////
	@Override
	public int goCheckLikeGal(HashMap<String, String> paraMap) {
		int CheckLikeGal = sql.insert("exhibits.goCheckLikeGal", paraMap);
		return CheckLikeGal;
	}

	///////////////////////////// 성별 차트 /////////////////////////////
	@Override
	public List<HashMap<String, Object>> getGenderChart(String eno) {
		List<HashMap<String, Object>> GenderChart = sql.selectList("exhibits.getGenderChart", eno);
		return GenderChart;
	}

	////////////////////////////// 연령대별 차트 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getAgeChart(String eno) {
		List<HashMap<String, String>> AgeChart = sql.selectList("exhibits.getAgeChart", eno);
		return AgeChart;
	}
	
	///////////////////////// 페이징 처리를 위한 미니 리뷰 게시판 게시물 총 갯수 ////////////////////////////
	@Override
	public int getMiniReviewTotalCount(HashMap<String, String> paraMap) {
		int result = sql.selectOne("exhibits.getMiniReviewTotalCount", paraMap);
		return result;
	}
	
	/////////////////////////// 미니 리뷰 게시판 목록 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getMiniReivewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> MiniReviewList = sql.selectList("exhibits.getMiniReivewList", paraMap);
		return MiniReviewList;
	}
	
	/////////////////////////// 페이징 처리를 위한 미니 기대 게시판 게시물 총 갯수 ////////////////////////////
	@Override
	public int getMiniPreviewTotalCount(HashMap<String, String> paraMap) {
		int result = sql.selectOne("exhibits.getMiniPreviewTotalCount", paraMap);
		return result;
	}
	
	/////////////////////////// 미니 기대평 게시판 목록  ////////////////////////////
	@Override
	public List<HashMap<String, String>> getMiniPreivewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> MiniPreivewList = sql.selectList("exhibits.getMiniPreivewList", paraMap);
		return MiniPreivewList;
	}


}
