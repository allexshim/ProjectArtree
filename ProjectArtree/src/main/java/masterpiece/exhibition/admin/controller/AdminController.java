package masterpiece.exhibition.admin.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import masterpiece.exhibition.admin.model.GalleryVO;
import masterpiece.exhibition.admin.service.InterAdminService;
import masterpiece.exhibition.common.FileManager;
import masterpiece.exhibition.common.ThumbnailManager;
import masterpiece.exhibition.exhibits.model.ExhibitsVO;
import masterpiece.exhibition.member.model.MemberVO;

@Component
@Controller
public class AdminController {

	// 의존객체 주입 ( DI: Dependency Injection )
	@Autowired
	private InterAdminService service;
	
	// 파일업로드 및 다운로드를 해주는 FileManager 클래스 의존객체 주입
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private ThumbnailManager thumbnailManager;
	
	@RequestMapping(value="/admin.at")
	public String isAdmin__admin(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/admin-main.tiles";
	}
	
	@RequestMapping(value="/memberList.at")
	public String isAdmin__memberList(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		
		return "admin/members/memberList.tiles";
	}
	
	@RequestMapping(value="/memberInfo.at")
	public String isAdmin__memberInfo(HttpServletRequest request, HttpServletResponse response) {
		
		
		String no = request.getParameter("no");
		
		return "admin/members/memberInfo.tiles";
	}
	
	// ------------------ 각종 통계페이지 -------------------- //
	
	@RequestMapping(value="/bySales.at")
	public String isAdmin__bySales(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/statistics/bySales.tiles";
	}
	
	@RequestMapping(value="/byGender.at")
	public String isAdmin__byGender(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/statistics/byGender.tiles";
	}
	
	@RequestMapping(value="/byGenre.at")
	public String isAdmin_byGenre(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin/statistics/byGenre.tiles";
	}
	
	@RequestMapping(value="/byTags.at")
	public String isAdmin_byTags(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/statistics/byTags.tiles";
	}
	
	@RequestMapping(value="/byTicketingRate.at")
	public String isAdmin_byTicketingRate(HttpServletRequest request, HttpServletResponse response) {
		
		// 관리자의 접근만 허용
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		if(!"artree0213@gmail.com".equals(loginuser.getEmail())) {
			
			String msg = "접근권한이 없습니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);

			return "msg";
		}
		
		return "admin/statistics/byTicketingRate.tiles";
	}
	
	// ------------------------- 전시회 관리 ---------------------------- //
	
	@RequestMapping(value="/exhibitionList.at")
	public String isAdmin_exhibitionList(HttpServletRequest request, HttpServletResponse response) {

		List<ExhibitsVO> exhibitionList = service.getExhibitionList();
		
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "exhibitions/adminExhibitionList.tiles";
	}
	
	@RequestMapping(value="/exhibitionDetail.at")
	public String isAdmin_exhibitionDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
	//	System.out.println("====================== " + no);
		
		HashMap<String, String> exhibitionInfo = service.getExhibitionDetail(no);
		
		request.setAttribute("exhibitionInfo", exhibitionInfo);
		
		return "exhibitions/adminExhibitionDetail.tiles";
	}
	
	// ------------------------------------------------------------ //
	
	// (일반 사용자) 전시회 등록 신청 폼
	@RequestMapping(value="/addExhibition.at")
	public String requireLogin_addExhibition(HttpServletRequest request, HttpServletResponse response) {
		
		// --------- tag 가져오기 --------- //
		HashMap<String, List<String>> tagList = service.getTags();
		
		List<String> genre = tagList.get("장르별");
		List<String> expression = tagList.get("표현별");
		List<String> adjective = tagList.get("형용별");
		List<String> color = tagList.get("색상별");
		
		request.setAttribute("genre", genre);
		request.setAttribute("expression", expression);
		request.setAttribute("adjective", adjective);
		request.setAttribute("color", color);
		
		// --------- gallery 가져오기 --------- //
		
		// 갤러리 목록
		List<GalleryVO> galleryList = service.getGalleries();
		
		// 갤러리 지역 선택옵션
		List<String> galleryLocationList = service.getGalleryLocations();
		
		request.setAttribute("galleryList", galleryList);
		request.setAttribute("galleryLocationList", galleryLocationList);
		
		return "exhibitions/addExhibition.tiles";
	}
	
	@RequestMapping(value="/addEndExhibition.at", method=RequestMethod.POST)
	public String requireLogin_addEndExhibition(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req) {
		
		String applyingno = String.valueOf(service.getApplyingno());
		String fk_galleryno = request.getParameter("galleryno");
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
		String openCloseTime = request.getParameter("openTime") + " - " + request.getParameter("closeTime");
		
		// 1 개의 전시회
		HashMap<String, String> newExhibitMap = new HashMap<String, String>();
		newExhibitMap.put("applyingno", applyingno);
		newExhibitMap.put("fk_galleryno", fk_galleryno);
		newExhibitMap.put("exhibitionName", exhibitionName);
		newExhibitMap.put("applier", applier);
		newExhibitMap.put("author", author);
		newExhibitMap.put("startDate", startDate);
		newExhibitMap.put("endDate", endDate);
		newExhibitMap.put("email", email);
		newExhibitMap.put("tel", tel);
		newExhibitMap.put("genre", genre);
		newExhibitMap.put("tag", tag);
		newExhibitMap.put("authorInfo", authorInfo);
		newExhibitMap.put("exhibitionInfo", exhibitionInfo);
		newExhibitMap.put("price", price);
		newExhibitMap.put("foodorDrink", foodorDrink);
		newExhibitMap.put("extraRestriction", extraRestriction);
		newExhibitMap.put("photo", photo);
		newExhibitMap.put("openCloseTime", openCloseTime);
		
		// 다중이미지 첨부파일
		List<MultipartFile> imgMap = req.getFiles("imageInput");
		
		// 이미지맵리스트
		List<HashMap<String, String>> exhibitsImgMapList = new ArrayList<HashMap<String, String>>();
		
		if(imgMap != null) {  // 이미지첨부 다중파일을 받아왔다라면 
			// 이미지첨부 다중파일을 업로드할 WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"files";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			String newFileName = ""; // WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;    // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
			
			long fileSize = 0;   	// 파일크기를 읽어오기 위한 용도
			
			String thumbnailFileName = "";  // WAS 디스크에 저장될 thumbnail 파일명 
			
			for(int i=0; i < imgMap.size(); i++) { 
				
				try {
					 bytes = imgMap.get(i).getBytes(); // 첨부파일의 내용물(byte)을 읽어옴.
					 
					 // 파일업로드 한 후 업로드되어진 파일명  가져오기
					 newFileName = fileManager.doFileUpload(bytes, imgMap.get(i).getOriginalFilename(), path);
					 // 예를들어 newFileName 에는  2019012519592316420706146795.png 와 같은 것이 들어옴.
					 
					 fileSize = imgMap.get(i).getSize(); // 첨부파일의 파일크기를 알아온다.
					 
					// ============= >>>> 첨부파일에 대한 thumbnail 파일 생성하기 <<<< =====================  //
					 thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path); 
					// ==============================================================================  //
					 
					 HashMap<String, String> imageMap = new HashMap<String, String>();
					// 제품1개에 딸린 다중 이미지
					 
					 imageMap.put("fk_applyingno", applyingno);
					 imageMap.put("imagefilename", newFileName);
					 imageMap.put("imageorgfilename", imgMap.get(i).getOriginalFilename());
					 imageMap.put("imagefilesize", String.valueOf(fileSize));
					 imageMap.put("thumbnailfilename", thumbnailFileName);
					 
					 // 이미지 설명 넣기
					 String imageinfo = request.getParameter("imageinfo");
					 
					 imageMap.put("imageinfo", imageinfo);
					 
					 exhibitsImgMapList.add(imageMap);
					 
					 
					 
				} catch (Exception e) {	}
				
			} // end of for------------------------------------------------
			
		} // end of if---------------------------------------
		
		int n = 0;
		int m = 0;
		
		int count = 0;
		
		if(imgMap == null) { // 파일이 첨부된것이 없다면
			   n = service.addExhibition(newExhibitMap);
		   }
		   else if(imgMap != null) { // 파일이 첨부된것이 있다면
			   n = service.addExhibition(newExhibitMap);
			   
			   for(int i=0; i<exhibitsImgMapList.size(); i++) {
				   m = service.addExhibitImage(exhibitsImgMapList.get(i));
				   if(m==1) count++;
			   }
			   
			   if(exhibitsImgMapList.size() == count) {
				   n=1;
			   }
			   else {
				   n=0;
			   }
		   }
		
		String msg = "";
		String loc = "";
		
		
		if(n==1) {
			msg = "전시회 신청이 완료되었습니다.";
			loc = "/artree";
		} else {
			msg = "전시회 신청에 실패하였습니다. 관리자에 문의하여주세요.";
			loc = "javascript:history.go(0);";
		}
		    		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "msg";
		
	}
	
	// 검색어 입력시 목록
	@ResponseBody
	@RequestMapping(value="/wordSearchShow.at", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String wordSearchShow(HttpServletRequest request) { 
		
		String galleryLocation = request.getParameter("galleryLocation");
		String searchWord = request.getParameter("searchWord"); 
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		if(galleryLocation == null || galleryLocation.trim().isEmpty() ) {
			galleryLocation = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>(); 
		paraMap.put("galleryLocation", galleryLocation);
		paraMap.put("searchWord", searchWord);
		
		List<GalleryVO> wordList = service.wordSearchShow(paraMap); 
		
	//	System.out.println("===================== " + wordList.size());
		
		JSONArray jsonArr = new JSONArray();
		
		if(wordList != null) {
			for(GalleryVO vo : wordList) {
				JSONObject jsonObj = new JSONObject();
				jsonObj.put("galleryno", vo.getGalleryno());
				jsonObj.put("location", vo.getLocation());
				jsonObj.put("galleryname", vo.getGalleryname());
				jsonObj.put("detailaddress", vo.getDetailaddress());
				jsonObj.put("tel", vo.getTel());
				
				jsonArr.put(jsonObj);
			}
		}
		
		return jsonArr.toString(); 
	}
	
}
