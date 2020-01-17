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
	
	@Override
	public List<HashMap<String, String>> getEx(HashMap<String, String> map) {
		List<HashMap<String, String>> exList = dao.getEx(map);
		return exList;
	}
	
}
