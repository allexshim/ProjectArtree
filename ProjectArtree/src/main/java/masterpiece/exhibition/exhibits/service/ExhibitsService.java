package masterpiece.exhibition.exhibits.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.Schedules;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.exhibits.model.InterExhibitsDAO;

@Service
public class ExhibitsService implements InterExhibitsService {

	@Autowired
	private InterExhibitsDAO dao;
	
	//////////////////// 전시회 목록 불러오기 ////////////////////////
	@Override
	public List<HashMap<String, Object>> getExhList(HashMap<String, String> paraMap) {
		List<HashMap<String, Object>> ExhList = dao.getExhList(paraMap);
		return ExhList;
	}

	//////////////////// 전시회, 갤러리 총 게시물 갯수 알아오기 ////////////////////////
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int totCount = dao.getTotalCount(paraMap);
		return totCount;
	}

	//////////////////// 전시회 디테일 페이지 채우기 ////////////////////////
	@Override
	public HashMap<String, String> getExhDetail(String eno) {
		HashMap<String, String> ExhDetail = dao.getExhDetail(eno);
		return ExhDetail;
	}

	//////////////////// 갤러리 목록 불러오기 ////////////////////////
	@Override
	public List<HashMap<String, String>> getGalList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> GalList = dao.getGalList(paraMap); 
		return GalList;
	}

	/////////////////// 갤러리 이번주 추천 공간 ////////////////////
	@Override
	public List<HashMap<String, String>> getGalRecomList() {
		List<HashMap<String, String>> galRecomList = dao.getGalRecomList();
		return galRecomList;
	}
	
	/////////////////// 갤러리 이번주 추천 공간 - 해당 갤러리의 전시회 진행 유무 //////////////////
	@Override
	public int getExhStatus(String gno) {
		int ExhStatus = dao.getExhStatus(gno);
		return ExhStatus;
	}

	////////////////// 이번주 추천 공간 - 해당 갤러리의 전시회 리스트 /////////////////
	@Override
	public List<HashMap<String, String>> getRecomExhList(String gno) {
		List<HashMap<String, String>> RecomExhList = dao.getRecomExhList(gno);
		return RecomExhList;
	}
	
	//////////////////// 갤러리 상세 페이지 ////////////////////
	@Override
	public HashMap<String, String> getGalDetail(String gno) {
		HashMap<String, String> GalDetail = dao.getGalDetail(gno);
		return GalDetail;
	}

	////////////////////////특정 갤러리의 전시중 전시회 목록 불러오기 /////////////////////
	@Override
	public List<HashMap<String, String>> getIngExhListMap(String gno) {
		List<HashMap<String, String>> IngExhListMap = dao.getIngExhListMap(gno);
		return IngExhListMap;
	}
	
	////////////////////////특정 갤러리의 전시예정 전시회 목록 불러오기 /////////////////////
	@Override
	public List<HashMap<String, String>> getComExhListMap(String gno) {
		List<HashMap<String, String>> ComExhListMap = dao.getComExhListMap(gno);
		return ComExhListMap;
	}
	
	////////////////////////특정 갤러리의 전시종료 전시회 목록 불러오기 /////////////////////
	@Override
	public List<HashMap<String, String>> getEndExhListMap(String gno) {
		List<HashMap<String, String>> EndExhListMap = dao.getEndExhListMap(gno);
		return EndExhListMap;
	}

	/////////////////////// 전시회 좋아요 체크 유무 확인 ////////////////////////
	@Override
	public int getCheckExhLike(HashMap<String, String> paraMap) {
		int CheckExhLike = dao.getCheckExhLike(paraMap);
		return CheckExhLike;
	}

	/////////////////////// 갤러리 좋아요 체크 유무 확인 ////////////////////////
	@Override
	public int getCheckGalLike(HashMap<String, String> paraMap) {
		int CheckGalLike = dao.getCheckGalLike(paraMap);
		return CheckGalLike;
	}

	/////////////////////// 전시회 좋아요 지정 및 해제  /////////////////////
	@Override
	public int goCheckExhLikeDis(HashMap<String, String> paraMap) {
		int check = dao.getCheckExhLike(paraMap);
		
		int result = 0;
		
		if(check == 1) {
			result = dao.goCheckDislikeExh(paraMap);
		}
		else {
			result = dao.goCheckLikeExh(paraMap);
		}
		
		return result;
	}

	/////////////////////// 갤러리 좋아요 지정 및 해제  /////////////////////
	@Override
	public int goCheckGalLikeDis(HashMap<String, String> paraMap) {
		int check = dao.getCheckGalLike(paraMap);
		
		int result = 0;
		
		if(check == 1) {
			result = dao.goCheckDislikeGal(paraMap);
		}
		else {
			result = dao.goCheckLikeGal(paraMap);
		}
		
		return result;
	}

	/////////////////////////// 성별 차트 ///////////////////////////
	@Override
	public List<HashMap<String, Object>> getGenderChart(String eno) {
		List<HashMap<String, Object>> GenderChart = dao.getGenderChart(eno);
		return GenderChart;
	}

	////////////////////////// 연령대별 차트 ///////////////////////
	@Override
	public List<HashMap<String, String>> getAgeChart(String eno) {
		List<HashMap<String, String>> AgeChart = dao.getAgeChart(eno);
		return AgeChart;
	}

	///////////////////////// 페이징 처리를 위한 미니 리뷰 게시판 게시물 총 갯수 ////////////////////////////
	@Override
	public int getMiniReviewTotalCount(HashMap<String, String> paraMap) {
		int result = dao.getMiniReviewTotalCount(paraMap);
		return result;
	}

	/////////////////////////// 미니 리뷰 게시판 목록 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getMiniReivewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> MiniReviewList = dao.getMiniReivewList(paraMap);
		return MiniReviewList;
	}

	/////////////////////////// 페이징 처리를 위한 미니 기대 게시판 게시물 총 갯수 ////////////////////////////
	@Override
	public int getMiniPreviewTotalCount(HashMap<String, String> paraMap) {
		int result = dao.getMiniPreviewTotalCount(paraMap);
		return result;
	}

	/////////////////////////// 미니 기대평 게시판 목록  ////////////////////////////
	@Override
	public List<HashMap<String, String>> getMiniPreivewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> MiniPreivewList = dao.getMiniPreivewList(paraMap);
		return MiniPreivewList;
	}

	/////////////////////////// 전시회 STATUS 업데이트하는 스케줄러 ///////////////////////
	@Scheduled(cron="0 0 0 * * *")
	@Override
	public void updateExhibitsStatus() throws Exception {

		dao.updateExhibitsStatus();
		
	}



}
