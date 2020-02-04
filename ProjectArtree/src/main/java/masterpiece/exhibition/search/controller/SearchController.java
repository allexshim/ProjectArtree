package masterpiece.exhibition.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import masterpiece.exhibition.search.service.InterSearchService;

@Controller
public class SearchController {

	@Autowired
	InterSearchService service;
	
	// 검색 페이지로 이동하는 url
	@RequestMapping(value="/search.at")
	public String goSearchPage(HttpServletRequest request) {

		return "search/search.tiles";
	} // end of reviewList --------------------------------------------

	// 전시회 정보 가져오기
	@ResponseBody
	@RequestMapping(value="/locationSearch.at", produces="text/plain;charset=UTF-8")
	public String locationSearch() {
		
		// ajax로 호출, 모든 전시회를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getAllExhibition();
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			//  detailAddress, exhibitionName, galleryName, startDate, endDate, mainPoster, exhibitionno
			jsobj.put("detailAddress",single.get("detailAddress"));
			jsobj.put("exhibitionName",single.get("exhibitionName"));
			jsobj.put("galleryName",single.get("galleryName"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("exhibitionno",single.get("exhibitionno"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();
	} // end of locationSearch ---------------------------------------
	
	@ResponseBody
	@RequestMapping(value="/locationJSON.at", produces="text/plain;charset=UTF-8", method=RequestMethod.POST)
//	public String locationJSON(HttpServletRequest request, @RequestParam(value="coordsArr[]") List<HashMap<String,String>> coordsArr) {
	public String locationJSON(HttpServletRequest request) {
		
		String[] coordsArr = request.getParameterValues("coordsArr");
		/*System.out.println("controller coordsArr.length : "+coordsArr.length);*/ //221
		
		JSONObject jsobj = new JSONObject();
		
		JSONArray jsArr = new JSONArray();
		for(int i=0; i<coordsArr.length; i++) {
			/*System.out.println("coordsArr[i] : "+coordsArr[i]);*/
			// {"galleryName":item.galleryName, "lat":35.20459722797615,"lng":129.21270222887753}
			
			// "\"KT&G 상상마당 춘천 아트센터 갤러리\""
			int galleryNamestart = coordsArr[i].indexOf(":");
			int galleryNameend = coordsArr[i].indexOf(",");
			String galleryName = coordsArr[i].substring(galleryNamestart+1, galleryNameend);
			
			int latstart = coordsArr[i].indexOf(":", galleryNamestart+1);
			int latend = coordsArr[i].indexOf(",", galleryNameend+1);
			String lat = coordsArr[i].substring(latstart+1, latend);
			
			int lngstart = coordsArr[i].lastIndexOf(":");
			int lngend = coordsArr[i].lastIndexOf("}");
			String lng = coordsArr[i].substring(lngstart+1, lngend);
			
			JSONObject singlecoord = new JSONObject();
			singlecoord.put("galleryName", galleryName);
			singlecoord.put("lat", lat);
			singlecoord.put("lng", lng);
			jsArr.put(singlecoord);				
		}
		jsobj.put("positions", jsArr);
		/*System.out.println("result :"+jsobj.toString());*/
		
		return jsobj.toString();
		
	} // end of locationJSON ---------------------------------------
	
	// 클릭한 갤러리 이름에 해당하는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/selectedLocationSearch.at", produces="text/plain;charset=UTF-8")
	public String selectedLocationSearch(HttpServletRequest request) {
		
		String galleryName = request.getParameter("galleryName");
		galleryName = galleryName.substring(1, galleryName.length()-1);
		
		// System.out.println("galleryName : "+galleryName);
		
		// ajax로 호출, 선택한 갤러리에서 열리는 전시회를 가지고 옵니다.
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionByLocation(galleryName);

		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();

			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();
	} // end of selectedLocationSearch ---------------------------------------
	
	
	
	// 해당 월에 열리는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/monthSearch.at", produces="text/plain;charset=UTF-8")
	public String monthSearch(HttpServletRequest request) {
		String year = request.getParameter("year");
		String month = request.getParameter("month"); // 1월 2020
		
		String str = (Integer.parseInt(month)>=10)?"":"0";
		month = year+"-"+str+month+"-01"; //2020-01-01
		
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyMonth(month);
		
		//System.out.println(exhibitionList.size()); // 45
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
   
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
	} // end of monthSearch ------------------------------------------------------
	
	// 해당 날짜에 열리는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/dateSearch.at", produces="text/plain;charset=UTF-8")
	public String dateSearch(HttpServletRequest request) {
		String date = request.getParameter("date");

		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyDate(date);
		
		//System.out.println(exhibitionList.size());
		
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
   
			jsarr.put(jsobj);
		}
		
		return jsarr.toString();
		
	} // end of dateSearch ------------------------------------------------------
	
	// 모든 전시회의 테마를 가져온다. (오늘 기준으로 전시중인 전시회만)
	@ResponseBody
	@RequestMapping(value="/allSearch.at", produces="text/plain;charset=UTF-8")
	public String allThemeSearch(HttpServletRequest request) {
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbyTheme();
		
		//System.out.println(exhibitionList.size());
		String allTag = "";
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));
			
			allTag += ","+single.get("tag");
			
			jsarr.put(jsobj);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("allTag", allTag);

		return jsarr.toString();	
	} // end of allThemeSearch ------------------------------------------------------
	
	
	// 선택한 테마에 해당하는 전시회 목록을 가져온다.
	@ResponseBody
	@RequestMapping(value="/selectThemeSearch.at", produces="text/plain;charset=UTF-8")
	public String selectThemeSearch(HttpServletRequest request) {
		
		String tag = request.getParameter("tag");
		
		JSONArray jsarr = new JSONArray();
		List<HashMap<String,String>> exhibitionList =  null;
		exhibitionList = service.getExhibitionbySelectTheme(tag);
		
	//	System.out.println(exhibitionList.size());
		for(HashMap<String,String> single :exhibitionList) {
			JSONObject jsobj = new JSONObject();
			
			jsobj.put("exhibitionno",single.get("exhibitionno"));
			jsobj.put("fk_galleryno",single.get("fk_galleryno"));
			jsobj.put("exhibitionname",single.get("exhibitionname"));
			jsobj.put("author",single.get("author"));
			jsobj.put("startdate",single.get("startdate"));
			jsobj.put("enddate",single.get("enddate"));
			jsobj.put("mainposter",single.get("mainposter"));
			jsobj.put("galleryname",single.get("galleryname"));
			jsobj.put("galleryno",single.get("galleryno"));
			jsobj.put("location",single.get("location"));

			jsarr.put(jsobj);
		}
		return jsarr.toString();	
	} // end of selectThemeSearch ------------------------------------------------------
	
	////////////////////////////////////////////////////////////////////////////////
	
	// 관리자 페이지 차트 ~ 태그
	@RequestMapping(value="/byTags.at")
	public String isAdmin_byTags(HttpServletRequest request, HttpServletResponse response) {
		
		// 통계를 내기 위해 총 회원수를 구해서 request영역에 저장한다.
		int totalcnt = service.getMemberCnt();
		request.setAttribute("totalcnt", totalcnt);

		// System.out.println("controller"+totalcnt);
		
		return "admin/statistics/byTags.tiles";
	}
	
	// /getChartDataByTags.at
	@ResponseBody
	@RequestMapping(value="/getChartDataByTags.at", produces="text/plain;charset=UTF-8")
	public String getChartDataByTags(HttpServletRequest request) {
		
		//HttpSession session = request.getSession();
		
		// 각각 tag이름, tag의 빈도수를 저장하는 HashMap
		List<HashMap<String,String>> TagList = service.getChartDataByTags();
		// tag, CNT
		
		//int totalTagCnt = 0;
		JSONArray jsarr = new JSONArray();
		for(HashMap<String,String> map : TagList) {
			JSONObject jsobj = new JSONObject();
			jsobj.put("tag", map.get("tag"));
			jsobj.put("cnt", map.get("CNT"));
			jsarr.put(jsobj);
			
			//totalTagCnt += Integer.parseInt(map.get("CNT"));
			
		}
		/*System.out.println("tagArr[i].tag : "+totalTagCnt*1.0);
		session.setAttribute("tagArr[i].tag", totalTagCnt*1.0);*/
		
		return jsarr.toString();
	} // end of getChartDataByTags ----------------------------------------
	
	
	@ResponseBody
	@RequestMapping(value="/getAgeDataByTags.at", produces="text/plain;charset=UTF-8")
	public String getAgeDataByTags(HttpServletRequest request) {
		
		String tag = request.getParameter("tag");
		// 해당 태그를 선호하는 연령대,해당회원수 를 가져온다.
		List<HashMap<String,String>> ageRange = service.getAgeDataByTags(tag);
		// agegroup, agecnt
		JSONArray jsarr = new JSONArray();
		for(HashMap<String,String> map : ageRange) {
			JSONObject jsobj = new JSONObject();
			jsobj.put("agegroup", map.get("agegroup"));
			jsobj.put("agecnt", map.get("agecnt"));
			jsobj.put("tag", map.get("tag"));
			jsarr.put(jsobj);
			
			//System.out.println("agegroup"+map.get("agegroup"));
			//System.out.println("agecnt"+map.get("agecnt"));
		}
		return jsarr.toString();
	} // end of getAgeDataByTags ----------------------------------------
	
	
	// 엑셀 파일로 출력하기 /printTagbyExcel.at
	@RequestMapping(value="/printTagbyExcel.at", produces="text/plain;charset=UTF-8")
	public String isAdmin_printTagbyExcel(HttpServletRequest request, HttpServletResponse response, Model model) {
		
		String totalcnt_str = request.getParameter("totalcnt");
		
		int totalcnt = 0;
		if(!"".equals(totalcnt_str)) {
			totalcnt = Integer.parseInt(totalcnt_str);
		}
		//System.out.println("totalcnt"+totalcnt); // 42
		
		// 프린트할 정보를 가져온다. (태그 별 선호 회원 수, 인원 비율)
		List<HashMap<String,String>> TagList = service.getChartDataByTags();
		// tag, CNT, ratio
		
		for(HashMap<String,String> map : TagList) {
			
			double ratio = Math.round((Integer.parseInt(map.get("CNT"))/(totalcnt*1.0))*100.0*100.0)/100.0;
			map.put("ratio", String.valueOf(ratio)+"%");
		}
		
		// === 조회 결과물인 TagList로 엑셀 시트 생성하기 === //
		// 시트 생성, 행 생성, 셀 생성, 셀 안에 내용 입력
		SXSSFWorkbook workbook = new SXSSFWorkbook();
		
		// 시트 생성
		SXSSFSheet sheet = workbook.createSheet("태그 별 선호도"); // 해당 workbook에서 시트를 생성한다. createSheer(시트 이름)
		
		// 시트 열 너비 설정 (column 개수만큼 너비를 지정한다.)
		sheet.setColumnWidth(0, 4000);
		sheet.setColumnWidth(1, 7000);
		sheet.setColumnWidth(2, 7000);
		
		// 행의 위치를 나타내는 변수 0,1,2... 행 (header행 (열 이름 ex/부서번호, 성별...을 적는 행 과 body행으로 구분)
		int rowLocation = 0;
		
		/////////////////////////////////// start of style /////////////////////////////////////////////////////
		// CellStyle 정렬하기(Alignment)
		// CellStyle 객체를 생성하여 Alignment 세팅하는 메소드를 호출해서 인자값을 넣어준다.
		// 아래는 HorizontalAlignment(가로)와 VerticalAlignment(세로)를 모두 가운데 정렬 시켰다.
		CellStyle mergeRowStyle = workbook.createCellStyle();
		mergeRowStyle.setAlignment(HorizontalAlignment.CENTER);
		mergeRowStyle.setVerticalAlignment(VerticalAlignment.CENTER);
		// import org.apache.poi.ss.usermodel.VerticalAlignment 으로 해야함.
		
		CellStyle headerStyle = workbook.createCellStyle();
		headerStyle.setAlignment(HorizontalAlignment.CENTER);
		headerStyle.setVerticalAlignment(VerticalAlignment.CENTER);

		// Cell 폰트(Font) 설정하기
		// 폰트 적용을 위해 POI 라이브러리의 Font 객체를 생성해준다.
		// 해당 객체의 세터를 사용해 폰트를 설정해준다. 대표적으로 글씨체, 크기, 색상, 굵기만 설정한다.
		// 이후 CellStyle의 setFont 메소드를 사용해 인자로 폰트를 넣어준다.
		Font mergeRowFont = workbook.createFont(); // import org.apache.poi.ss.usermodel.Font; 으로 한다.
		mergeRowFont.setFontName("나눔고딕");
		mergeRowFont.setFontHeight((short)500);
		mergeRowFont.setColor(IndexedColors.BLACK.getIndex());
		mergeRowFont.setBold(true);
		
		mergeRowStyle.setFont(mergeRowFont); 
			
		// Cell Merge 셀 병합시키기
		/* 셀병합은 시트의 addMergeRegion 메소드에 CellRangeAddress 객체를 인자로 하여 병합시킨다.
		CellRangeAddress 생성자의 인자로(시작 행, 끝 행, 시작 열, 끝 열) 순서대로 넣어서 병합시킬 범위를 정한다. 배열처럼 시작은 0부터이다.  
		*/
		// 병합할 행 만들기
		Row mergeRow = sheet.createRow(rowLocation);  // 엑셀에서 행의 시작은 0 부터 시작한다.
		
		for(int i=0; i<2; i++) {
			Cell cell = mergeRow.createCell(i);
			cell.setCellStyle(mergeRowStyle);
			cell.setCellValue("태그별 선호도");
		}
		
		// 셀 병합하기 
		sheet.addMergedRegion(new CellRangeAddress(rowLocation, rowLocation, 0, 2)); // 시작 행, 끝 행, 시작 열, 끝 열 
		
		// header 행 생성, sheet.createRow(행번호)
		Row headerRow = sheet.createRow(++rowLocation); // 행 번호 : 0,1,2,..로 시작하는 점 주의! 
		// ++로 지정하면 두 칸 비우고 선택된다.
		
		// 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0); // 엑셀에서 열의 시작은 0 부터 시작한다.
        headerCell.setCellValue("태그");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("선호하는 회원 수");
        headerCell.setCellStyle(headerStyle);
        
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("전체 회원 대비 비율");
        headerCell.setCellStyle(headerStyle);
		        
        // 내용에 해당하는 행 및 셀 생성하기 
        Row bodyRow = null;
        Cell bodyCell = null;
        
        for(int i=0; i<TagList.size(); i++) {
        	HashMap<String,String> map = TagList.get(i);
        	//tag, CNT, ratio
            // 행 생성
            bodyRow = sheet.createRow(i + (rowLocation+1) ); // 기존 행에서 +1한 위치에 새로운 행 생성
            
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(map.get("tag")); 
            
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(map.get("CNT"));

            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(map.get("ratio"));
                  
        }// end of for----------------------------------
        
        // 데이터를 저장하는 model
        model.addAttribute("locale", Locale.KOREA); // 지역 표시, 한국 통화로 표기한다.
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "태그 별 선호도");
		
		return "excelDownloadView";

	} // end of getAgeDataByTags ----------------------------------------
	
}
