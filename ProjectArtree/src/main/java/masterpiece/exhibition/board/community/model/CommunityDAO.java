package masterpiece.exhibition.board.community.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO implements InterCommunityDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	// 목록 불러오기
	@Override
	public List<HashMap<String, String>> getCommunity(HashMap<String, String> searchMap) {

		List<HashMap<String, String>> communityList = sqlsession.selectList("community.getCommunity",searchMap);
		return communityList;
	}
	
	// 모든 전시회 정보를 가져와서 넘긴다 (전시회 검색용)
	@Override
	public List<HashMap<String, String>> getExhibit(String searchWord) {
		List<HashMap<String, String>> exhibitionList = sqlsession.selectList("community.getExhibit", searchWord);
		return exhibitionList;
	}
	
	// 새 글 추가하기
	@Override
	public int addCommunity(HashMap<String, String> addCommunity) {
		int n = sqlsession.insert("community.addCommunity",addCommunity);
		return n;
	}

	// 조회수 증가시키기
	@Override
	public int updateReadCount(HashMap<String, String> map) {
		int n = sqlsession.update("community.updateReadCount", map);
		return n;
	}
	
	// 해당 글번호의 글 정보 가져오기
	@Override
	public HashMap<String, String> getCommunityDetail(String no) {
		HashMap<String, String> communityDetail = sqlsession.selectOne("community.getCommunityDetail", no);
		return communityDetail;
	}

	// 글 수정하기 
	@Override
	public int modifyCommunity(HashMap<String, String> modifycommu) {
		int n = sqlsession.update("community.modifyCommunity",modifycommu);
		return n;
	}

	// 새 댓글 등록하기
	@Override
	public int addComment(HashMap<String, String> comment) {
		int n = sqlsession.insert("community.addComment",comment);
		return n;
	}

	// 해당 글번호에 달린 댓글 가져오기
	@Override
	public List<HashMap<String,String>> getCommunityComment(String no) {
		List<HashMap<String,String>> commentList = new ArrayList<HashMap<String,String>>();
		commentList = sqlsession.selectList("community.getComment",no);
		return commentList;
	}

	// 수정한 댓글 update하기
	@Override
	public int modifyComment(HashMap<String, String> comment) {
		int n = sqlsession.update("community.modifyComment",comment);
		return n;
	}

	// 댓글 삭제하기
	@Override
	public int deleteComment(String commentNo) {
		int n = sqlsession.update("community.deleteComment",commentNo);
		return n;
	}

	// 각각 게시글에 달린 댓글 개수 알아오기
	@Override
	public int getNumberOfComment(String no) {
		int CmtCount  = sqlsession.selectOne("community.getNumberOfComment",no);
		return CmtCount;
	}

	// 해당 글의 댓글 삭제
	@Override
	public int deleteCommunityComment(String no) {
		int n = sqlsession.delete("community.deleteCommunityComment", no);
		return n;
	}

	// 해당 글 삭제
	@Override
	public int deleteCommunity(String no) {
		int n = sqlsession.delete("community.deleteCommunity", no);
		return n;
	}


	
	
}
