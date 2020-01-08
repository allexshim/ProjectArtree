package masterpiece.exhibition.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService {

	// 의존객체주입(DI: Dependency Injection)
	@Autowired
	private InterAdminDAO dao;
	
}
