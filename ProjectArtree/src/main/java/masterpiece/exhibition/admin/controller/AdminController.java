package masterpiece.exhibition.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.admin.model.AppliedExhibitionVO;
import masterpiece.exhibition.admin.service.InterAdminService;

@Component
@Controller
public class AdminController {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private InterAdminService service;
	
	@RequestMapping(value="/adminhome.at")
	public String adminhome() {
		
		return "admin/adminhome.tiles";
	}
	
	@RequestMapping(value="/memberList.at")
	public String memberList() {
		
		return "admin/members/memberList.tiles";
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
	public ModelAndView addEndExhibition(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String applyingNo = request.getParameter("applyingNo");
		String fk_galleryNo = request.getParameter("fk_galleryNo");
		String exhibitionName = request.getParameter("exhibitionName");
		String applier = request.getParameter("applier");
		String author = request.getParameter("author");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String genre = request.getParameter("genre");
		String tag = request.getParameter("tag");
		String authorInfo = request.getParameter("authorInfo");
		String exhibitionInfo = request.getParameter("exhibitionInfo");
		String price = request.getParameter("price");
		String foodorDrink = request.getParameter("foodorDrink");
		String extraRestriction = request.getParameter("extraRestriction");
		String photo = request.getParameter("photo");
		String openCloseTime = request.getParameter("openCloseTime");
		
		AppliedExhibitionVO avo = new AppliedExhibitionVO();
		avo.setApplyingNo(applyingNo);
		avo.setFk_galleryNo(fk_galleryNo);
		avo.setExhibitionName(exhibitionName);
		avo.setApplier(applier);
		avo.setAuthor(author);
		avo.setStartDate(startDate);
		avo.setEndDate(endDate);
		avo.setEmail(email);
		avo.setTel(tel);
		avo.setGenre(genre);
		avo.setTag(tag);
		avo.setAuthorInfo(authorInfo);
		avo.setExhibitionInfo(exhibitionInfo);
		avo.setPrice(Integer.parseInt(price));
		avo.setFoodorDrink(foodorDrink);
		avo.setExtraRestriction(extraRestriction);
		avo.setPhoto(photo);
		avo.setOpenCloseTime(openCloseTime);
		
		int n = service.addExhibition(avo);
		
		if(n == 1) {
			
			String msg = "전시회 신청이 완료되었습니다.";
			String loc = "javascript:history.back()";
			
			mav.addObject(msg);
			mav.addObject(loc);
			
			mav.setViewName("msg");
			
		}
		
		return mav;
		
	}
	
}
