package masterpiece.exhibition.exhibits.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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

}
