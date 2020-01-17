package masterpiece.exhibition.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.member.model.InterMemberDAO;
import masterpiece.exhibition.member.model.MemberVO;

@Service 
public class MemberService implements InterMemberService {

	@Autowired   // Type에 따라 알아서 Bean 을 주입해준다.
	private InterMemberDAO dao;
	
	@Override
	public int joinInsert(MemberVO mvo) {

		int n = dao.joinInsert(mvo);
	
		return n;
	}

}
