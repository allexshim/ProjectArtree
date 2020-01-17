package masterpiece.exhibition.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.common.AES256;
import masterpiece.exhibition.admin.model.AppliedExhibitionVO;
import masterpiece.exhibition.admin.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService {

	// 의존객체 주입 ( DI: Dependency Injection )
		@Autowired
		private InterAdminDAO dao;
		
		// 양방향 암호화 알고리즘인 AES256 을 사용해 암호화/복호화 를 하기 위한 클래스 의존객체 주입 ( DI : Dependency Injection )
		@Autowired
		private AES256 aes;

		// 전시회등록
		@Override
		public int addExhibition(AppliedExhibitionVO avo) {
			int n = dao.addExhibition(avo);
			return n;
		}
	
}
