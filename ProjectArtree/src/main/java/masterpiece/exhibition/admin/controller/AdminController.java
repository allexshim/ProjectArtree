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
	public String memberInfo() {
		return "admin/members/memberInfo.tiles";
	}
	
	@RequestMapping(value="/registerformList.at")
	public String resisterformList() {
		
		return "exhibitions/adminRegisterFormList.tiles";
	}
	
	@RequestMapping(value="/registerformDetail.at")
	public String registerformDetail(HttpServletRequest request) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
		return "exhibitions/adminregisterformDetail.tiles";
	}
	
}
