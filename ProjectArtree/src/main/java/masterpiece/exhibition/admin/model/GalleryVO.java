package masterpiece.exhibition.admin.model;

public class GalleryVO {

	private String galleryno; 
	private String galleryname;
	private String detailaddress;
	private String mainpicture;
	private String introduction;
	private String website;
	private String location;
	private String openinghour;
	private String holiday;
	private String tel;
	private String status;
	
	public GalleryVO() { }
	
	public GalleryVO(String galleryno, String galleryname, String detailaddress, String mainpicture,
			String introduction, String website, String location, String openinghour, String holiday, String tel,
			String status) {
		super();
		this.galleryno = galleryno;
		this.galleryname = galleryname;
		this.detailaddress = detailaddress;
		this.mainpicture = mainpicture;
		this.introduction = introduction;
		this.website = website;
		this.location = location;
		this.openinghour = openinghour;
		this.holiday = holiday;
		this.tel = tel;
		this.status = status;
	}

	public String getGalleryno() {
		return galleryno;
	}

	public void setGalleryno(String galleryno) {
		this.galleryno = galleryno;
	}

	public String getGalleryname() {
		return galleryname;
	}

	public void setGalleryname(String galleryname) {
		this.galleryname = galleryname;
	}

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public String getMainpicture() {
		return mainpicture;
	}

	public void setMainpicture(String mainpicture) {
		this.mainpicture = mainpicture;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getOpeninghour() {
		return openinghour;
	}

	public void setOpeninghour(String openinghour) {
		this.openinghour = openinghour;
	}

	public String getHoliday() {
		return holiday;
	}

	public void setHoliday(String holiday) {
		this.holiday = holiday;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}
