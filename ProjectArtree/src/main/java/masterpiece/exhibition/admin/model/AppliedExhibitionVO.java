package masterpiece.exhibition.admin.model;

import org.springframework.stereotype.Repository;

@Repository
public class AppliedExhibitionVO {

	private String applyingNo;
	private String fk_galleryNo;
	private String exhibitionName;
	private String applier;
	private String author;
	private String startDate;
	private String endDate;
	private String email;
	private String tel;
	private String genre;
	private String tag;
	private String authorInfo;
	private String exhibitionInfo;
	private int price;
	private String foodorDrink;
	private String extraRestriction;
	private String photo;
	private String openCloseTime;
	
	public AppliedExhibitionVO() { }

	public AppliedExhibitionVO(String applyingNo, String fk_galleryNo, String exhibitionName, String applier,
			String author, String startDate, String endDate, String email, String tel, String genre, String tag,
			String authorInfo, String exhibitionInfo, int price, String foodorDrink, String extraRestriction,
			String photo, String openCloseTime) {
		super();
		this.applyingNo = applyingNo;
		this.fk_galleryNo = fk_galleryNo;
		this.exhibitionName = exhibitionName;
		this.applier = applier;
		this.author = author;
		this.startDate = startDate;
		this.endDate = endDate;
		this.email = email;
		this.tel = tel;
		this.genre = genre;
		this.tag = tag;
		this.authorInfo = authorInfo;
		this.exhibitionInfo = exhibitionInfo;
		this.price = price;
		this.foodorDrink = foodorDrink;
		this.extraRestriction = extraRestriction;
		this.photo = photo;
		this.openCloseTime = openCloseTime;
	}

	public String getApplyingNo() {
		return applyingNo;
	}

	public void setApplyingNo(String applyingNo) {
		this.applyingNo = applyingNo;
	}

	public String getFk_galleryNo() {
		return fk_galleryNo;
	}

	public void setFk_galleryNo(String fk_galleryNo) {
		this.fk_galleryNo = fk_galleryNo;
	}

	public String getExhibitionName() {
		return exhibitionName;
	}

	public void setExhibitionName(String exhibitionName) {
		this.exhibitionName = exhibitionName;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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

	public String getAuthorInfo() {
		return authorInfo;
	}

	public void setAuthorInfo(String authorInfo) {
		this.authorInfo = authorInfo;
	}

	public String getExhibitionInfo() {
		return exhibitionInfo;
	}

	public void setExhibitionInfo(String exhibitionInfo) {
		this.exhibitionInfo = exhibitionInfo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getFoodorDrink() {
		return foodorDrink;
	}

	public void setFoodorDrink(String foodorDrink) {
		this.foodorDrink = foodorDrink;
	}

	public String getExtraRestriction() {
		return extraRestriction;
	}

	public void setExtraRestriction(String extraRestriction) {
		this.extraRestriction = extraRestriction;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getOpenCloseTime() {
		return openCloseTime;
	}

	public void setOpenCloseTime(String openCloseTime) {
		this.openCloseTime = openCloseTime;
	}
	
	

	
}
