package masterpiece.exhibition.exhibits.model;

public class ExhibitsVO {

	private String exhibitionno;
	private String fk_galleryno;
	private String exhibitionname;
	private String applier;
	private String author;
	private String startdate;
	private String enddate;
	private String email;
	private String tel;
	private String genre;
	private String tag;
	private String authorinfo;
	private String exhibitioninfo;
	private String price; 
	private String foodordrink;
	private String extrarestriction;
	private String photo;
	private String openclosetime;
	private String status;
	private String readcount;
	
	public ExhibitsVO() { }

	public ExhibitsVO(String exhibitionno, String fk_galleryno, String exhibitionname, String applier, String author,
			String startdate, String enddate, String email, String tel, String genre, String tag, String authorinfo,
			String exhibitioninfo, String price, String foodordrink, String extrarestriction, String photo,
			String openclosetime, String status, String readcount) {
		super();
		this.exhibitionno = exhibitionno;
		this.fk_galleryno = fk_galleryno;
		this.exhibitionname = exhibitionname;
		this.applier = applier;
		this.author = author;
		this.startdate = startdate;
		this.enddate = enddate;
		this.email = email;
		this.tel = tel;
		this.genre = genre;
		this.tag = tag;
		this.authorinfo = authorinfo;
		this.exhibitioninfo = exhibitioninfo;
		this.price = price;
		this.foodordrink = foodordrink;
		this.extrarestriction = extrarestriction;
		this.photo = photo;
		this.openclosetime = openclosetime;
		this.status = status;
		this.readcount = readcount;
	}

	public String getExhibitionno() {
		return exhibitionno;
	}

	public void setExhibitionno(String exhibitionno) {
		this.exhibitionno = exhibitionno;
	}

	public String getFk_galleryno() {
		return fk_galleryno;
	}

	public void setFk_galleryno(String fk_galleryno) {
		this.fk_galleryno = fk_galleryno;
	}

	public String getExhibitionname() {
		return exhibitionname;
	}

	public void setExhibitionname(String exhibitionname) {
		this.exhibitionname = exhibitionname;
	}

	public String getApplier() {
		return applier;
	}

	public void setApplier(String applier) {
		this.applier = applier;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getStartdate() {
		return startdate;
	}

	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}

	public String getEnddate() {
		return enddate;
	}

	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getAuthorinfo() {
		return authorinfo;
	}

	public void setAuthorinfo(String authorinfo) {
		this.authorinfo = authorinfo;
	}

	public String getExhibitioninfo() {
		return exhibitioninfo;
	}

	public void setExhibitioninfo(String exhibitioninfo) {
		this.exhibitioninfo = exhibitioninfo;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getFoodordrink() {
		return foodordrink;
	}

	public void setFoodordrink(String foodordrink) {
		this.foodordrink = foodordrink;
	}

	public String getExtrarestriction() {
		return extrarestriction;
	}

	public void setExtrarestriction(String extrarestriction) {
		this.extrarestriction = extrarestriction;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getOpenclosetime() {
		return openclosetime;
	}

	public void setOpenclosetime(String openclosetime) {
		this.openclosetime = openclosetime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getReadcount() {
		return readcount;
	}

	public void setReadcount(String readcount) {
		this.readcount = readcount;
	}
	
}
