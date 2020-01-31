package masterpiece.exhibition.admin.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.net.URLCodec;
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
import org.springframework.web.servlet.ModelAndView;

import masterpiece.exhibition.admin.model.GalleryVO;
import masterpiece.exhibition.admin.service.InterAdminService;
import masterpiece.exhibition.common.AES256;
import masterpiece.exhibition.common.FileManager;
import masterpiece.exhibition.common.MyUtil;
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
	public String isAdmin_admin(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/admin-main.tiles";
	}
	
	// ------------------ 각종 통계페이지 -------------------- //
	
	@RequestMapping(value="/bySales.at")
	public String isAdmin_bySales(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/statistics/bySales.tiles";
	}
	
	@RequestMapping(value="/byGender.at")
	public String isAdmin_byGender(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "admin/statistics/byGender.tiles";
	}
	
	@RequestMapping(value="/byGenre.at")
	public String isAdmin_byGenre(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin/statistics/byGenre.tiles";
	}
	
//	@RequestMapping(value="/byTags.at")
//	public String isAdmin_byTags(HttpServletRequest request, HttpServletResponse response) {
//		
//		
//		return "admin/statistics/byTags.tiles";
//	}
	
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
	
	// 전시중 목록 조회
	@RequestMapping(value="/exhibitionList.at")
	public String isAdmin_exhibitionList(HttpServletRequest request, HttpServletResponse response) {

		List<ExhibitsVO> exhibitionList = service.getExhibitionList();
		
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "admin/exhibitions/adminExhibitionList.tiles";
	}
	
	@RequestMapping(value="/exhibitionDetail.at")
	public String isAdmin_exhibitionDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
	//	System.out.println("====================== " + no);
		
		HashMap<String, String> exhibitionInfo = service.getExhibitionDetail(no);
		
		request.setAttribute("exhibitionInfo", exhibitionInfo);
		
		return "admin/exhibitions/adminExhibitionDetail.tiles";
	}
	
	// 전시예정 목록 조회
	@RequestMapping(value="/newDisplayList.at")
	public String isAdmin_newDisplayList(HttpServletRequest request, HttpServletResponse response) {
		
		List<ExhibitsVO> exhibitionList = service.getNewExhibitionList();
		
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "admin/exhibitions/newDisplayList.tiles";
	}
	
	@RequestMapping(value="/newDisplayDetail.at")
	public String isAdmin_newDisplayDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
	//	System.out.println("====================== " + no);
		
		HashMap<String, String> exhibitionInfo = service.getExhibitionDetail(no);
		
		request.setAttribute("exhibitionInfo", exhibitionInfo);
		
		return "admin/exhibitions/newDisplayDetail.tiles";
	}
	
	// 전시예정 -> 전시중으로 변경
	@RequestMapping(value="/changeExhibitStatus.at")
	public String isAdmin_changeExhibitStatus(HttpServletRequest request, HttpServletResponse response) {
		
		String exhibitionno = request.getParameter("exhibitionno");
		
		int n = service.changeExhibitStatus(exhibitionno);
		
		if(n == 1) {
			String msg = "변경되었습니다.";
			String loc = "/artree/newDisplayList.at";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
		} else {
			String msg = "변경에 실패하였습니다. 다시 시도해주세요.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}
		
		return "msg";
	}
	
	// 종료된 전시목록 조회
	@RequestMapping(value="/afterDisplayList.at")
	public String isAdmin_afterDisplayList(HttpServletRequest request, HttpServletResponse response) {
		
		List<ExhibitsVO> exhibitionList = service.getAfterExhibitionList();
		
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "admin/exhibitions/afterDisplayList.tiles";
	}
	
	// 종료된 전시회 조회
	@RequestMapping(value="/afterDisplayDetail.at")
	public String isAdmin_afterDisplayDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
	//	System.out.println("====================== " + no);
		
		HashMap<String, String> exhibitionInfo = service.getExhibitionDetail(no);
		
		request.setAttribute("exhibitionInfo", exhibitionInfo);
		
		return "admin/exhibitions/afterDisplayDetail.tiles";
	}
	
	// 검토할 전시회 목록 조회
	@RequestMapping(value="/appliedDisplayList.at")
	public String isAdmin_appliedDisplayList(HttpServletRequest request, HttpServletResponse response) {
		
		List<HashMap<String, String>> exhibitionList = service.getAppliedExhibitionList();
		
		request.setAttribute("exhibitionList", exhibitionList);
		
		return "admin/exhibitions/appliedDisplayList.tiles";
	}
	
	// 검토할 전시회 조회
	@RequestMapping(value="/appliedDisplayDetail.at")
	public String isAdmin_appliedDisplayDetail(HttpServletRequest request, HttpServletResponse response) {
		
		String no = request.getParameter("no"); // 목록에서 넘겨준 글번호를 받아옵니다.
		
		HashMap<String, String> exhibitionInfo = service.getAppliedExhibitionDetail(no);
		request.setAttribute("exhibitionInfo", exhibitionInfo);
		
		List<HashMap<String, String>> getImageList = service.getAppliedExhibitionImage(no);
		request.setAttribute("getImageList", getImageList);
		
		request.setAttribute("no", no);
		
		return "admin/exhibitions/appliedDisplayDetail.tiles";
	}
	
	// 지원된 전시회를 전시예정으로 변경하기
	@RequestMapping(value="/displayExhibition.at", method=RequestMethod.POST)
	public String isAdmin_displayExhibition(HttpServletRequest request, HttpServletResponse response) {
		
		String exhibitionno = service.getExhibitionno();
		String fk_galleryno = request.getParameter("galleryno");
		String exhibitionname = request.getParameter("exhibitionname");
		String applier = request.getParameter("applier");
		String author = request.getParameter("author");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String genre = request.getParameter("genre");
		String tag = request.getParameter("tag");
		String authorinfo = request.getParameter("authorinfo");
		String exhibitioninfo = request.getParameter("exhibitioninfo");
		String price = request.getParameter("price");
		String foodordrink = request.getParameter("foodordrink");
		String extrarestriction = request.getParameter("extrarestriction");
		String photo = request.getParameter("photo");
		String openclosetime = request.getParameter("openclosetime");
		
		// 1 개의 전시회
		HashMap<String, String> newExhibitMap = new HashMap<String, String>();
		newExhibitMap.put("exhibitionno", exhibitionno);
		newExhibitMap.put("fk_galleryno", fk_galleryno);
		newExhibitMap.put("exhibitionname", exhibitionname);
		newExhibitMap.put("applier", applier);
		newExhibitMap.put("author", author);
		newExhibitMap.put("startdate", startdate);
		newExhibitMap.put("enddate", enddate);
		newExhibitMap.put("email", email);
		newExhibitMap.put("tel", tel);
		newExhibitMap.put("genre", genre);
		newExhibitMap.put("tag", tag);
		newExhibitMap.put("authorinfo", authorinfo);
		newExhibitMap.put("exhibitioninfo", exhibitioninfo);
		newExhibitMap.put("price", price);
		newExhibitMap.put("foodordrink", foodordrink);
		newExhibitMap.put("extrarestriction", extrarestriction);
		newExhibitMap.put("photo", photo);
		newExhibitMap.put("openclosetime", openclosetime);
		
		String mainposter = request.getParameter("mainposter");
		
		String image1 = "";
		String image2 = "";
		String image3 = "";
		
		if(request.getParameter("image1") != null) {
			image1 = request.getParameter("image1");
		}
		
		if(request.getParameter("image2") != null) {
			image2 = request.getParameter("image2");
		}
		
		if(request.getParameter("image3") != null) {
			image3 = request.getParameter("image3");
		}
		
		String image1info = "";
		String image2info = "";
		String image3info = "";
		
		if(request.getParameter("image1info") != null) {
			image1info = request.getParameter("image1info");
		}
		
		if(request.getParameter("image2info") != null) {
			image2info = request.getParameter("image2info");
		}
		
		if(request.getParameter("image3info") != null) {
			image3info = request.getParameter("image3info");
		}
		
/*		System.out.println("===========mainposter============ " + mainposter);
		System.out.println("===========image1============ " + image1);
		System.out.println("===========image2============ " + image2);
		System.out.println("===========image3============ " + image3);
		System.out.println("===========image1info============ " + image1info);
		System.out.println("===========image2info============ " + image2info);
*/		
		HashMap<String, String> newExhibitImgMap = new HashMap<String, String>();
		newExhibitImgMap.put("fk_exhibitionno", exhibitionno);
		newExhibitImgMap.put("mainposter", mainposter);
		newExhibitImgMap.put("image1", image1);
		newExhibitImgMap.put("image2", image2);
		newExhibitImgMap.put("image3", image3);
		newExhibitImgMap.put("image1info", image1info);
		newExhibitImgMap.put("image2info", image2info);
		newExhibitImgMap.put("image3info", image3info);
		
		// 검토목록에 있던 전시회를 전시예정으로 변경
		int n = service.displayNewExhibition(newExhibitMap);
		
		// 전시회의 이미지 테이블에 insert
		int m = service.displayNewExhibitionImg(newExhibitImgMap);
		
		// 지원된 전시회 테이블(appliedExhibits) 의 status 데이터를 '검토완료'로 변경
		String no = request.getParameter("no");
		int l = service.changeAppliedExhibitsStatus(no);
		
		String msg = "";
		String loc = "";
		
		if(n + m + l != 3) {
			
			msg = "처리중 오류가 발생하였습니다. 다시 시도하여주세요.";
			loc = "javascript:history.back();";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			return "msg";
			
		}
		
		msg = "성공적으로 변경되었습니다.";
		loc = "/artree/appliedDisplayList.at";
		
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		return "msg";
	}
	
	// ------------------------------------------------------------ //
	
	// (일반 사용자) 전시회 등록 신청 폼
	@RequestMapping(value="/addExhibition.at")
	public String requireLogin_applyExhibition(HttpServletRequest request, HttpServletResponse response) {
		
		// --------- 이름 가져오기 --------- //
		HttpSession session = request.getSession();
		
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		request.setAttribute("name", loginuser.getName());
		
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
		
		return "admin/exhibitions/addExhibition.tiles";
	}
	
	@RequestMapping(value="/addEndExhibition.at", method=RequestMethod.POST)
	public String requireLogin_applyEndExhibition(HttpServletRequest request, HttpServletResponse response, MultipartHttpServletRequest mreq) {
		
		String applyingno = String.valueOf(service.getApplyingno());
		String fk_galleryno = request.getParameter("galleryno");
		String exhibitionname = request.getParameter("exhibitionname");
		String applier = request.getParameter("applier");
		String author = request.getParameter("author");
		String startdate = request.getParameter("startdate");
		String enddate = request.getParameter("enddate");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String genre = request.getParameter("genre");
		String tag = request.getParameter("tag");
		String authorinfo = request.getParameter("authorinfo");
		String exhibitioninfo = request.getParameter("exhibitioninfo");
		String price = request.getParameter("price");
		String foodordrink = request.getParameter("foodordrink");
		String extrarestriction = request.getParameter("extrarestriction");
		String photo = request.getParameter("photo");
		String openclosetime = request.getParameter("opentime") + " - " + request.getParameter("closetime");
		
		// 1 개의 전시회
		HashMap<String, String> newExhibitMap = new HashMap<String, String>();
		newExhibitMap.put("applyingno", applyingno);
		newExhibitMap.put("fk_galleryno", fk_galleryno);
		newExhibitMap.put("exhibitionname", exhibitionname);
		newExhibitMap.put("applier", applier);
		newExhibitMap.put("author", author);
		newExhibitMap.put("startdate", startdate);
		newExhibitMap.put("enddate", enddate);
		newExhibitMap.put("email", email);
		newExhibitMap.put("tel", tel);
		newExhibitMap.put("genre", genre);
		newExhibitMap.put("tag", tag);
		newExhibitMap.put("authorinfo", authorinfo);
		newExhibitMap.put("exhibitioninfo", exhibitioninfo);
		newExhibitMap.put("price", price);
		newExhibitMap.put("foodordrink", foodordrink);
		newExhibitMap.put("extrarestriction", extrarestriction);
		newExhibitMap.put("photo", photo);
		newExhibitMap.put("openclosetime", openclosetime);
		
		// 다중이미지 첨부파일
		List<MultipartFile> mulFileList = mreq.getFiles("imageInput");
		
		// 이미지맵리스트
		List<HashMap<String, String>> exhibitsImgMapList = new ArrayList<HashMap<String, String>>();
		
		if(mulFileList != null) {  // 이미지첨부 다중파일을 받아왔다라면 
			// 이미지첨부 다중파일을 업로드할 WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = mreq.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"files";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
			String newFileName = ""; // WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;    // 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
			
			long fileSize = 0;   	// 파일크기를 읽어오기 위한 용도
			
			String thumbnailFileName = "";  // WAS 디스크에 저장될 thumbnail 파일명 
			
			for(int i=0; i < mulFileList.size(); i++) { 
				
				try {
					
					bytes = mulFileList.get(i).getBytes(); // 첨부파일의 내용물(byte)을 읽어옴.
					 
					// 파일업로드 한 후 업로드되어진 파일명  가져오기
					newFileName = fileManager.doFileUpload(bytes, mulFileList.get(i).getOriginalFilename(), path);
					// 예를들어 newFileName 에는  2019012519592316420706146795.png 와 같은 것이 들어옴.
					 
					fileSize = mulFileList.get(i).getSize(); // 첨부파일의 파일크기를 알아온다.
					 
					// ============= >>>> 첨부파일에 대한 thumbnail 파일 생성하기 <<<< =====================  //
					thumbnailFileName = thumbnailManager.doCreateThumbnail(newFileName, path); 
					// ==============================================================================  //
					 
					HashMap<String, String> imageMap = new HashMap<String, String>();
					 
					imageMap = new HashMap<String, String>();
					// 제품1개에 딸린 다중 이미지
					 
					imageMap.put("fk_applyingno", applyingno);
					imageMap.put("imagefilename", newFileName);
					imageMap.put("imageorgfilename", mulFileList.get(i).getOriginalFilename());
					imageMap.put("imagefilesize", String.valueOf(fileSize));
					imageMap.put("thumbnailfilename", thumbnailFileName);
					
					String imageinfo = "";
					
					// 이미지 설명 넣기
					if(request.getParameter("imageinfo") != null) {
						 
					//	String imageinfo = request.getParameter("imageinfo");
						String[] imageinfoArr = request.getParameterValues("imageinfo");
						
						for(int j = 0; j<imageinfoArr.length; j++) {
							imageinfo = imageinfoArr[i];
						}
						
						imageMap.put("imageinfo", imageinfo);
						 
					}
					 
					MultipartFile mainposterFile = mreq.getFile("mainposter"); 
					
					newFileName = fileManager.doFileUpload(bytes, mainposterFile.getOriginalFilename(), path);
					imageMap.put("mainposter", newFileName);
					 
					exhibitsImgMapList.add(imageMap);
					
					System.out.println();
					
				} catch (Exception e) {	}
				
			} // end of for------------------------------------------------
			
		} // end of if---------------------------------------
		
		int n = 0;
		int m = 0;
		
		int count = 0;
		
		if(mulFileList == null) { // 파일이 첨부된것이 없다면
			   n = service.applyExhibition(newExhibitMap);
		   }
		   else if(mulFileList != null) { // 파일이 첨부된것이 있다면
			   n = service.applyExhibition(newExhibitMap);
			   
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
		    		
		mreq.setAttribute("msg", msg);
		mreq.setAttribute("loc", loc);
		
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
	
	//////////////////////////////////// 모든 회원목록 //////////////////////////////////// 
	@RequestMapping(value="/memberList.at")
	public ModelAndView isAdmin_memberList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		List<MemberVO> memberList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
		
		int startRno = 0;           // 시작 행번호
		int endRno = 0;             // 끝 행번호
		
		String searchCondition = request.getParameter("searchCondition"); 
		String searchWord = request.getParameter("searchWord"); 
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>(); 
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchWord", searchWord);
		
	    // 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithoutSearch();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearch(paraMap);
		}
		
		totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );  
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			currentShowPageNo = 1;
		}
		else {
			
			try {
				  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				  if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					  currentShowPageNo = 1;
				  }
			} catch (NumberFormatException e) {
				  currentShowPageNo = 1;
			}
		}
	
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
	
		memberList = service.memberListWithPaging(paraMap);
	
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
	    String url = "memberList.at";
	    
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		// *** [이전] 만들기 *** //    
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[이전]</a></li>";
		}
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:20px; padding:2px 6px; font-weight:bold; font-size:14pt;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:20px;'>"
						+ "<a style='color: black; margin: 0 4px; font-size:12pt;' href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>"
						+pageNo+"</a></li>"; 
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/members/memberList.tiles");
		
		return mav;
	}
	
	//////////////////////////////////// 탈퇴한 회원목록 //////////////////////////////////// 
	@RequestMapping(value="/deactivatedMemberList.at")
	public ModelAndView isAdmin_deactivatedMemberList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		List<MemberVO> memberList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
		
		int startRno = 0;           // 시작 행번호
		int endRno = 0;             // 끝 행번호
		
		String searchCondition = request.getParameter("searchCondition"); 
		String searchWord = request.getParameter("searchWord"); 
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>(); 
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchWord", searchWord);
		
	    // 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithoutSearchDeactivated();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearchDeactivated(paraMap);
		}
		
		totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );  
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			currentShowPageNo = 1;
		}
		else {
			
			try {
				  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				  if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					  currentShowPageNo = 1;
				  }
			} catch (NumberFormatException e) {
				  currentShowPageNo = 1;
			}
		}
	
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
	
		memberList = service.deactivatedMemberList(paraMap);
	
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
	    String url = "deactivatedMemberList.at";
	    
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		// *** [이전] 만들기 *** //    
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[이전]</a></li>";
		}
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:20px; padding:2px 6px; font-weight:bold; font-size:14pt;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:20px;'>"
						+ "<a style='color: black; margin: 0 4px; font-size:12pt;' href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>"
						+pageNo+"</a></li>"; 
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/members/memberList.tiles");
		
		return mav;
	}
	
	//////////////////////////////////// 가입회원목록 //////////////////////////////////// 
	@RequestMapping(value="/activatedMemberList.at")
	public ModelAndView isAdmin_activatedMemberList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		List<MemberVO> memberList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
		
		int startRno = 0;           // 시작 행번호
		int endRno = 0;             // 끝 행번호
		
		String searchCondition = request.getParameter("searchCondition"); 
		String searchWord = request.getParameter("searchWord"); 
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>(); 
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchWord", searchWord);
		
	    // 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithoutSearchActivated();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearchActivated(paraMap);
		}
		
		totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );  
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			currentShowPageNo = 1;
		}
		else {
			
			try {
				  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				  if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					  currentShowPageNo = 1;
				  }
			} catch (NumberFormatException e) {
				  currentShowPageNo = 1;
			}
		}
	
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
	
		memberList = service.activatedMemberList(paraMap);
	
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
	    String url = "activatedMemberList.at";
	    
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		// *** [이전] 만들기 *** //    
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[이전]</a></li>";
		}
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:20px; padding:2px 6px; font-weight:bold; font-size:14pt;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:20px;'>"
						+ "<a style='color: black; margin: 0 4px; font-size:12pt;' href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>"
						+pageNo+"</a></li>"; 
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/members/memberList.tiles");
		
		return mav;
	}
	
	//////////////////////////////////// 관리자목록 //////////////////////////////////// 
	@RequestMapping(value="/adminList.at")
	public ModelAndView isAdmin_adminList(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		List<MemberVO> memberList = null;
		
		String str_currentShowPageNo = request.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물 건수
		int sizePerPage = 10;       // 한 페이지당 보여줄 게시물 수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총 페이지수(웹브라우저상에 보여줄 총 페이지 갯수, 페이지바) 
		
		int startRno = 0;           // 시작 행번호
		int endRno = 0;             // 끝 행번호
		
		String searchCondition = request.getParameter("searchCondition"); 
		String searchWord = request.getParameter("searchWord"); 
		
		if(searchWord == null || searchWord.trim().isEmpty() ) {
			searchWord = "";
		}
		
		HashMap<String,String> paraMap = new HashMap<String,String>(); 
		paraMap.put("searchCondition", searchCondition);
		paraMap.put("searchWord", searchWord);
		
	    // 검색조건이 없을 경우의 총 게시물 건수(totalCount)
		if("".equals(searchWord)) {
			totalCount = service.getTotalCountWithoutSearchAdmin();
		}
		
		// 검색조건이 있을 경우의 총 게시물 건수(totalCount)
		else {
			totalCount = service.getTotalCountWithSearchAdmin(paraMap);
		}
		
		totalPage = (int) Math.ceil( (double)totalCount/sizePerPage );  
		
		if(str_currentShowPageNo == null) {
			// 게시판에 보여지는 초기화면
			currentShowPageNo = 1;
		}
		else {
			
			try {
				  currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				  if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					  currentShowPageNo = 1;
				  }
			} catch (NumberFormatException e) {
				  currentShowPageNo = 1;
			}
		}
	
		startRno = ((currentShowPageNo - 1) * sizePerPage) + 1;
		endRno = startRno + sizePerPage - 1;
		
		paraMap.put("startRno", String.valueOf(startRno));
		paraMap.put("endRno", String.valueOf(endRno));
	
		memberList = service.adminList(paraMap);
	
		if(!"".equals(searchWord)) {
			mav.addObject("paraMap", paraMap);
		}
		
		String pageBar = "<ul style='list-style: none;'>";
		
		int blockSize = 10;
		
		int loop = 1;
		
		int pageNo = ((currentShowPageNo - 1)/blockSize) * blockSize + 1;
		
	    String url = "adminList.at";
	    
		String lastStr = url.substring(url.length()-1);
		if(!"?".equals(lastStr)) 
			url += "?"; 
		
		// *** [이전] 만들기 *** //    
		if(pageNo != 1) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[이전]</a></li>";
		}
		
		while( !(loop>blockSize || pageNo>totalPage) ) {
			
			if(pageNo == currentShowPageNo) {
				pageBar += "<li style='display:inline-block; width:20px; padding:2px 6px; font-weight:bold; font-size:14pt;'>"+pageNo+"</li>";
			}
			else {
				pageBar += "<li style='display:inline-block; width:20px;'>"
						+ "<a style='color: black; margin: 0 4px; font-size:12pt;' href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>"
						+pageNo+"</a></li>"; 
			}
			
			loop++;
			pageNo++;
		}// end of while---------------------------------
		
		// *** [다음] 만들기 *** //
		if( !(pageNo>totalPage) ) {
			pageBar += "<li style='display:inline-block; width:20px;'><a href='"+url+"currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"&searchCondition="+searchCondition+"&searchWord="+searchWord+"'>[다음]</a></li>"; 
		}
		
		pageBar += "</ul>";
		
		mav.addObject("pageBar", pageBar);
		
		String gobackURL = MyUtil.getCurrentURL(request);
		mav.addObject("gobackURL", gobackURL);
		
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/members/memberList.tiles");
		
		return mav;
	}
	
	///////////////////////////// 회원상세정보 //////////////////////////////
	@RequestMapping(value="/memberInfo.at")
	public ModelAndView memberInfo(HttpServletRequest request, HttpServletResponse response, ModelAndView mav) {
		
		String no = request.getParameter("no");
		
		MemberVO memberInfo = null;
		
		try {
			memberInfo = service.getMemberInfo(no);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		}
		
		mav.addObject("memberInfo", memberInfo);
		
		List<HashMap<String, String>> orderList = service.getOrderList(no);
		
		mav.addObject("orderList", orderList);
		
		mav.setViewName("admin/members/memberInfo.tiles");
		
		return mav;
		
	}
	
}
