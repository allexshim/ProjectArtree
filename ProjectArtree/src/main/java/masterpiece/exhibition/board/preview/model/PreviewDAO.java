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

	///////////////////// 기대평 상세페이지 //////////////////////
	@Override
	public HashMap<String, String> getPreviewDetail(String bno) {
		HashMap<String, String> PreviewDetail = sql.selectOne("preview.getPreviewDetail", bno);
		return PreviewDetail;
	}

	//////////////////// 기대평 게시물 수정 /////////////////////
	@Override
	public int editEnd(HashMap<String, String> paraMap) {
		int result = sql.update("preview.editEnd", paraMap);
		return result + 1;
	}

	/////////////////// 기대평 게시물 삭제하기 ////////////////////
	@Override
	public int goDeletePreview(String bno) {
		int result = sql.delete("preview.goDeletePreview", bno);
		return result;
	}

	/////////////////// 기대평 - 특정 게시물의 댓글 목록 ////////////////////
	@Override
	public List<HashMap<String, String>> getCommentList(String bno) {
		List<HashMap<String, String>> CommentList = sql.selectList("preview.getCommentList", bno);
		return CommentList;
	}

	/////////////////// 기대평 - 특정 게시물의 댓글 등록 ////////////////////
	@Override
		public int addComment(HashMap<String, String> paraMap) {
		int result = sql.insert("preview.addComment", paraMap);
		return result;
	}

	//////////////////기대평 - 특정 게시물의 댓글 삭제 /////////////////////
	@Override
	public int delComment(HashMap<String, String> paraMap) {
		int result = sql.delete("preview.delComment", paraMap);
		return result;
	}
	
	////////////////// 기대평 - 특정 게시물의 댓글 수정 /////////////////////
	@Override
	public int editComment(HashMap<String, String> paraMap) {
		int result = sql.update("preview.editComment", paraMap);
		return result;
	}

	/////////////////// 글 조회수 증가 ///////////////////
	@Override
	public void addReadcount(String bno) {
		sql.update("preview.addReadcount", bno);
	}

	//////////////////// 댓글 등록 시 원 게시물의 댓글 갯수 증가 /////////////////
	@Override
	public int addCommentCnt(HashMap<String, String> paraMap) {
		int result = sql.update("preview.addCommentCnt", paraMap);
		return result;
	}

	//////////////////// 댓글 삭제 시 원 게시물의 댓글 갯수 감소 /////////////////
	@Override
	public int delCommentCnt(HashMap<String, String> paraMap) {
		int result = sql.update("preview.delCommentCnt", paraMap);
		return result;
	}

	////////////////////////// 전시회 목록에서 기대평 작성 시 해당 전시회 정보 불러오기 /////////////////////////
	@Override
	public HashMap<String, String> getPreviewWriteHelper(String eno) {
		HashMap<String, String> PreviewWriteHelper = sql.selectOne("preview.getPreviewWriteHelper", eno);
		return PreviewWriteHelper;
	}

	//////////////////////////// 마지막 비번 변경 시점 6개월 체크  ////////////////////////
	@Override
	public String getPwdCheck(String idx) {
		String bool = sql.selectOne("preview.getPwdCheck", idx);
		return bool;
	}

	///////////////// 마지막 비번 변경 시점 6개월 지난 회원 목록 (이메일 전송용 ) ///////////////
	@Override
	public List<HashMap<String, String>> getMemberNeedChangePwd() {
		List<HashMap<String, String>> MemberNeedChangePwd = sql.selectList("preview.getMemberNeedChangePwd");
		return MemberNeedChangePwd;
	}
	

}
