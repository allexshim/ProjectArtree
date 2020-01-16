package masterpiece.exhibition.member.model;

public class MemberVO {

	private int idx;
	private String email;
	private String name;
	private String password;
	private int agegroup;
	private int gender;
	private String area;
	private String hp;
	
	private int status; // 회원 탈퇴 유무   0: 사용불가(탈퇴) / 1: 사용가능 / 2: 관리자
	
	private String registerday;
	private String lastLoginDate; // 마지막으로 로그인 한 날짜시간 기록용
	private String lastPasswordDate; // 마지막으로 암호를 변경한 날짜시간 기록용
	
	private boolean requirePwdChange = false;
	// 마지막으로 암호를 변경한 날짜가 현재시각으로부터 6개월 지났으면 true
	
	private boolean idleStatus = false;
	// 휴면유무  true: 휴면상태  false: 아닌상태
	// 마지막으로 로그인 한 날짜가 현재시각으로부터 1년 지났으면 true
	
	private String clientIP; // 클라이언트 IP 주소
	
	public MemberVO() {}

	public MemberVO(int idx, String email, String name, String password, int agegroup, int gender, String area,
			String hp, int status, String registerday, String lastLoginDate, String lastPasswordDate,
			boolean requirePwdChange, boolean idleStatus, String clientIP) {
		super();
		this.idx = idx;
		this.email = email;
		this.name = name;
		this.password = password;
		this.agegroup = agegroup;
		this.gender = gender;
		this.area = area;
		this.hp = hp;
		this.status = status;
		this.registerday = registerday;
		this.lastLoginDate = lastLoginDate;
		this.lastPasswordDate = lastPasswordDate;
		this.requirePwdChange = requirePwdChange;
		this.idleStatus = idleStatus;
		this.clientIP = clientIP;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAgegroup() {
		return agegroup;
	}

	public void setAgegroup(int agegroup) {
		this.agegroup = agegroup;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRegisterday() {
		return registerday;
	}

	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}

	public String getLastLoginDate() {
		return lastLoginDate;
	}

	public void setLastLoginDate(String lastLoginDate) {
		this.lastLoginDate = lastLoginDate;
	}

	public String getLastPasswordDate() {
		return lastPasswordDate;
	}

	public void setLastPasswordDate(String lastPasswordDate) {
		this.lastPasswordDate = lastPasswordDate;
	}

	public boolean isRequirePwdChange() {
		return requirePwdChange;
	}

	public void setRequirePwdChange(boolean requirePwdChange) {
		this.requirePwdChange = requirePwdChange;
	}

	public boolean isIdleStatus() {
		return idleStatus;
	}

	public void setIdleStatus(boolean idleStatus) {
		this.idleStatus = idleStatus;
	}

	public String getClientIP() {
		return clientIP;
	}

	public void setClientIP(String clientIP) {
		this.clientIP = clientIP;
	};

}
