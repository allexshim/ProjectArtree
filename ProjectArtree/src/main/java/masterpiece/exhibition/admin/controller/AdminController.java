package masterpiece.exhibition.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@RequestMapping(value="/admin.at")
	public String admin() {
		
		return "admin/admin-main.tiles";
	}
	
	@RequestMapping(value="/members.at")
	public String members() {
		
		return "admin/members/members.tiles";
	}
	
	@RequestMapping(value="/memberInfo.at")
	public String memberInfo(HttpServletRequest request) {
		
		String no = request.getParameter("no");
		
		return "admin/members/memberInfo.tiles";
	}
	
	// ------------------ 각종 통계페이지 -------------------- //
	
	@RequestMapping(value="/bySales.at")
	public String bySales() {
		return "admin/statistics/bySales.tiles";
	}
	
	@RequestMapping(value="/byGender.at")
	public String byGender() {
		return "admin/statistics/byGender.tiles";
	}
	
	@RequestMapping(value="/byGenre.at")
	public String byGenre() {
		return "admin/statistics/byGenre.tiles";
	}
	
	@RequestMapping(value="/byTags.at")
	public String byTags() {
		return "admin/statistics/byTags.tiles";
	}
	
	@RequestMapping(value="/byTicketingRate.at")
	public String byTicketingRate() {
		return "admin/statistics/byTicketingRate.tiles";
	}
	
	// ----------------------------------------------------- //
	
	@RequestMapping(value="/registerformList.at")
	public String resisterformList() {
		
		return "exhibitions/adminRegisterFormList.tiles";
	}
	
	@RequestMapping(value="/registerformDetail.at")
	public String registerformDetail(HttpServletRequest request) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
		return "exhibitions/adminregisterformDetail.tiles";
	}
	
	// ------------------------------------------------------------ //
	
	// (일반 사용자) 전시회 등록 신청 폼
	@RequestMapping(value="/addExhibition.at")
	public String addExhibition() {
		return "exhibitions/addExhibition.tiles";
	}
	
	@RequestMapping(value="/addEndExhibition.at")
	public String addEndExhibition() {
		
		
		
		
		return "";
		
	}
	
}
