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
		List<HashMap<String, Object>> ExhListMap = dao.getExhList(paraMap);
		return ExhListMap;
	}

}
