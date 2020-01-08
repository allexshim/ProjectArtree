package masterpiece.exhibition.admin.controller;

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
		
		return "admin/members.tiles";
	}
	
	@RequestMapping(value="/registerformList.at")
	public String resisterformList() {
		
		return "exhibitions/adminRegisterFormList.tiles";
	}
	
}
