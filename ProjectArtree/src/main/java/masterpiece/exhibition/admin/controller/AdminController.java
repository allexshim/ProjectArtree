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
	public String admin() {
		
		return "admin/admin-main.tiles";
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
	public String addExhibition(HttpServletRequest request) {
		
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
		List<GalleryVO> galleryList = null;
		
		// 갤러리 지역 선택옵션
		List<String> galleryLocationList = service.getGalleryLocations();
		
		// --------- gallery 검색 --------- //
		
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
		
		galleryList = service.getGalleries(paraMap);
		
		if(!"".equals(searchWord)) {
			request.setAttribute("paraMap", paraMap);
		}
		
		request.setAttribute("galleryList", galleryList);
		request.setAttribute("galleryLocationList", galleryLocationList);
		
		return "exhibitions/addExhibition.tiles";
	}
	
	@RequestMapping(value="/addEndExhibition.at", method=RequestMethod.POST)
	public String addEndExhibition(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest req) {
		
		String applyingNo = request.getParameter("applyingNo");
		String fk_galleryNo = request.getParameter("fk_galleryNo");	// 갤러리번호를 어디서 받아오고 테이블에는 어떻게 넣지..?
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
		
		// 1 개의 전시회
		HashMap<String, String> newExhibitMap = new HashMap<String, String>();
		newExhibitMap.put("applyingNo", applyingNo);
		newExhibitMap.put("fk_galleryNo", fk_galleryNo);
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
		
		// 
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
					 
					 imageMap.put("fk_galleryNo", fk_galleryNo);
					 imageMap.put("IMAGEFILENAME", newFileName);
					 imageMap.put("IMAGEORGFILENAME", imgMap.get(i).getOriginalFilename());
					 imageMap.put("IMAGEFILESIZE", String.valueOf(fileSize));
					 imageMap.put("THUMBNAILFILENAME", thumbnailFileName);
					 
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
				   m = service.addExhibitimage(exhibitsImgMapList.get(i));
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
			loc = "javascript:history.back()";
		} else {
			msg = "전시회 신청에 실패하였습니다. 관리자에 문의하여주세요.";
			loc = "javascript:history.go(0);";
		}
		    		
		req.setAttribute("msg", msg);
		req.setAttribute("loc", loc);
		
		return "/artree";
		
	}
	
	// 검색어 입력시 목록
	@ResponseBody
	@RequestMapping(value="/wordSearchShow.at", method= {RequestMethod.GET}, produces="text/plain;charset=UTF-8")
	public String wordSearchShow(HttpServletRequest request) { 
		
		String galleryLocation = request.getParameter("galleryLocation");
		String searchWord = request.getParameter("searchWord"); 
		
		System.out.println("============================= " + searchWord);
		System.out.println("============================= " + galleryLocation);
		
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
