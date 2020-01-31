package masterpiece.exhibition.board.review.model;

public class ReviewVO {
	
	private String boardno;			// 게시판 번호
	private String revno;          	// 글번호 
	private String fk_idx;    		// 사용자 번호
	private String fk_name;         // 작성자 
	private String exhibitionname;	// 전시회 이름
	private String fk_exhibitionno;	// 전시회 번호
	private String revTitle;   	    // 글제목
	private String revContent;      // 글내용 
	private String readCount; 	    // 글조회수
	private String revWriteday;     // 글쓴시간
	private String status;       	// 글삭제여부 1:사용가능한 글,  0:삭제된글
	private String commentCount;	// 댓글 수
     
	private String previousno;      // 이전글번호
	private String previoustitle;  // 이전글제목
	private String nextno;          // 다음글번호
	private String nexttitle;      // 다음글제목
	
	public ReviewVO() {}
	
	public ReviewVO(String boardno, String revno, String fk_idx, String fk_name, String exhibitionname,
			String fk_exhibitionno, String revTitle, String revContent, String readCount, String revWriteday,
			String status, String commentCount, String previousno, String previoustitle, String nextno,
			String nexttitle) {
		super();
		this.boardno = boardno;
		this.revno = revno;
		this.fk_idx = fk_idx;
		this.fk_name = fk_name;
		this.exhibitionname = exhibitionname;
		this.fk_exhibitionno = fk_exhibitionno;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.readCount = readCount;
		this.revWriteday = revWriteday;
		this.status = status;
		this.commentCount = commentCount;
		this.previousno = previousno;
		this.previoustitle = previoustitle;
		this.nextno = nextno;
		this.nexttitle = nexttitle;
	}

	public String getBoardno() {
		return boardno;
	}

	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}

	public String getRevno() {
		return revno;
	}

	public void setRevno(String revno) {
		this.revno = revno;
	}

	public String getFk_idx() {
		return fk_idx;
	}

	public void setFk_idx(String fk_idx) {
		this.fk_idx = fk_idx;
	}

	public String getFk_name() {
		return fk_name;
	}

	public void setFk_name(String fk_name) {
		this.fk_name = fk_name;
	}

	public String getExhibitionname() {
		return exhibitionname;
	}

	public void setExhibitionname(String exhibitionname) {
		this.exhibitionname = exhibitionname;
	}

	public String getFk_exhibitionno() {
		return fk_exhibitionno;
	}

	public void setFk_exhibitionno(String fk_exhibitionno) {
		this.fk_exhibitionno = fk_exhibitionno;
	}

	public String getRevTitle() {
		return revTitle;
	}

	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public String getReadCount() {
		return readCount;
	}

	public void setReadCount(String readCount) {
		this.readCount = readCount;
	}

	public String getRevWriteday() {
		return revWriteday;
	}

	public void setRevWriteday(String revWriteday) {
		this.revWriteday = revWriteday;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(String commentCount) {
		this.commentCount = commentCount;
	}

	public String getPreviousno() {
		return previousno;
	}

	public void setPreviousno(String previousno) {
		this.previousno = previousno;
	}

	public String getPrevioustitle() {
		return previoustitle;
	}

	public void setPrevioustitle(String previoustitle) {
		this.previoustitle = previoustitle;
	}

	public String getNextno() {
		return nextno;
	}

	public void setNextno(String nextno) {
		this.nextno = nextno;
	}

	public String getNexttitle() {
		return nexttitle;
	}

	public void setNexttitle(String nexttitle) {
		this.nexttitle = nexttitle;
	}
	
	
	
}
