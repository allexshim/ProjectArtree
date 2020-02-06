package masterpiece.exhibition.board.preview.service;

import java.util.HashMap;
import java.util.List;

public interface InterPreviewService {

	List<HashMap<String, String>> getModalExhList(String key); // 전시회명 검색 - 모달에 띄울 전시회 리스트 

	int addEnd(HashMap<String, String> paraMap); // 기대평 글쓰기 및 수정하기

	List<HashMap<String, String>> getPreviewList(HashMap<String, String> paraMap); // 기대평 글 목록 

	int getTotalCount(HashMap<String, String> paraMap); // 기대평 게시물 총 갯수

	HashMap<String, String> getPreviewDetail(String bno); // 기대평 상세페이지

	int goDeletePreview(String bno); // 기대평 게시물 삭제하기

	List<HashMap<String, String>> getCommentList(String bno); // 기대평 - 특정 게시물의 댓글 목록

	int addComment(HashMap<String, String> paraMap); // 기대평 - 특정 게시물의 댓글 등록

	int delComment(HashMap<String, String> paraMap); // 기대평 - 특정 게시물의 댓글 수정

	int editComment(HashMap<String, String> paraMap); // 기대평 - 특정 게시물의 댓글 삭제

	void addReadcount(String bno); // 글 조회수 증가 

	HashMap<String, String> getPreviewWriteHelper(String eno); // 전시회 목록에서 기대평 작성 시 해당 전시회 정보 불러오기

	String getPwdCheck(String idx); // 마지막 비번 변경 시점 6개월 체크 
	
	void sendEmailForChangePwd() throws Exception; // 마지막 비번 변경 시점 6개월 지난 회원 이메일 목록 ( 이메일 전송용 )

}
