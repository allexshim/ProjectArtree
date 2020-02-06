package masterpiece.exhibition.board.preview.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import masterpiece.exhibition.board.preview.model.InterPreviewDAO;
import masterpiece.exhibition.mail.GoogleMail;

@Service
public class PreviewService implements InterPreviewService {

	@Autowired
	private InterPreviewDAO dao;

	@Autowired
	private GoogleMail mail;
	
	////////////////////////// 전시회명 검색 - 모달에 띄울 전시회 리스트 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getModalExhList(String key) {
		List<HashMap<String, String>> ModalExhList = dao.getModalExhList(key);
		return ModalExhList;        
	}

	////////////////////////// 기대평 글 쓰기 및 수정하기 //////////////////////////////
	@Override
	public int addEnd(HashMap<String, String> paraMap) {
		
		int result = 0;
		
		String bno = paraMap.get("bno");
		System.out.println("??????????"+bno);
		if(bno != "") { // 수정 
			result = dao.editEnd(paraMap);
		}
		else { // 신규
			result = dao.addEnd(paraMap);
		}

		return result;
	}

	///////////////////// 기대평 글 목록 가져오기 ////////////////////////////
	@Override
	public List<HashMap<String, String>> getPreviewList(HashMap<String, String> paraMap) {
		List<HashMap<String, String>> PreviewList = dao.getPreviewList(paraMap);
		return PreviewList;
	}

	/////////////////// 기대평 게시물 총 갯수 /////////////////////
	@Override
	public int getTotalCount(HashMap<String, String> paraMap) {
		int TotalCount = dao.getTotalCount(paraMap);
		return TotalCount;
	}
	
	/////////////////// 기대평 상세페이지 /////////////////////
	@Override
	public HashMap<String, String> getPreviewDetail(String bno) {
		HashMap<String, String> PreviewDetail = dao.getPreviewDetail(bno);
		return PreviewDetail;
	}

	////////////////// 기대평 게시물 삭제하기 ////////////////////////
	@Override
	public int goDeletePreview(String bno) {
		int result = dao.goDeletePreview(bno);
		return result;
	}

	/////////////////// 기대평 - 특정 게시물의 댓글 목록 /////////////////////
	@Override
	public List<HashMap<String, String>> getCommentList(String bno) {
		List<HashMap<String, String>> CommentList = dao.getCommentList(bno);
		return CommentList;
	}

	/////////////////// 기대평 - 특정 게시물의 댓글 등록 ////////////////////
	@Override
	public int addComment(HashMap<String, String> paraMap) {
		int result = dao.addComment(paraMap);
		if(result == 1) {
			result = dao.addCommentCnt(paraMap);
		}
		return result;
	}

	////////////////// 기대평 - 특정 게시물의 댓글 삭제 /////////////////////
	@Override
	public int delComment(HashMap<String, String> paraMap) {
		int result = dao.delComment(paraMap);
		if(result == 1) {
			result = dao.delCommentCnt(paraMap);
		}
		return result;
	}

	////////////////// 기대평 - 특정 게시물의 댓글 수정 /////////////////////
	@Override
	public int editComment(HashMap<String, String> paraMap) {
		int result = dao.editComment(paraMap);
		return result;
	}

	//////////////////// 글 조회수 증가 ////////////////////
	@Override
	public void addReadcount(String bno) {
		dao.addReadcount(bno);
	}

	//////////////////////// 전시회 목록에서 기대평 작성 시 해당 전시회 정보 불러오기 /////////////////////////
	@Override
	public HashMap<String, String> getPreviewWriteHelper(String eno) {
		HashMap<String, String> PreviewWriteHelper = dao.getPreviewWriteHelper(eno);
		return PreviewWriteHelper;
	}

	/////////////////////// 마지막 비번 변경 시점 6개월 체크 //////////////////////
	@Override
	public String getPwdCheck(String idx) {
		String bool = dao.getPwdCheck(idx);
		return bool;
	}

	///////////////////// 마지막 비번 변경 시점 6개월 지난 회원 이메일 목록 ( 이메일 전송용 ) //////////////////
	@Scheduled(cron="0 30 12 * * *")
	@Override	
	public void sendEmailForChangePwd() throws Exception {
		
		List<HashMap<String, String>> memberList = dao.getMemberNeedChangePwd();

		// 메일 보내기 //
		if(memberList.size() > 0) {
			System.out.println("memberList.size() : "+memberList.size()); // memberList.size() : 1
			System.out.println("memberList : "+memberList); // memberList : [{EMAIL=forkhclass@gmail.com, NAME=김현지}]
		   	
			for(int i=0; i<memberList.size(); i++) {
 		
		   		String emailContents = "<div style='border: solid 1px #e6e6e6; display:block; padding: 50px 20px; color:#000'>"
		   							 + "<span style='font-size:50pt; font-weight: bold;'>THANK YOU</span>"
		   							 + "<br/><br/><br/>"
		   							 + "<span style='font-size:13pt; margin-bottom:10px; display:block;'>마지막으로 비밀번호를 변경하신지 6개월이 지났습니다.</span>"
		   							 + "<span>변경을 원하시면 아래의 <strong>버튼</strong>을 클릭해주세요.</span>"
		   							 + "<br/><br/><br/>"
		   							 + "<a href='http://localhost:9090/artree/mypage_set.at' style='color:#000; background-color:#e6e6e6; text-decoration: none; padding: 10px; border-radius:5px;'><span style='font-weight:bold;'>아트맵 페이지로 이동하기</span></a>"
		   							 + "</div>";
		   		
		   		String name = memberList.get(i).get("NAME");
		   		
		   		mail.sendmail_changePwd(memberList.get(i).get("EMAIL"), emailContents, name);
		   	}
			
		}// end of if -------------------
	} // end of public void sendEmailForChangePwd() -----------------

}
