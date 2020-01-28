package masterpiece.exhibition.common;

import javax.servlet.http.HttpServletRequest;

public class MyUtil {

	// 크로스 사이트 스크립트 공격에 대응하는 secure 코드
	public static String replaceParameter(String param) {
		String result = param;
		
		if(param != null) {
			/*result = result.replaceAll("<","&lt;");
			result = result.replaceAll(">","&gt;");
			result = result.replaceAll("&","&amp;");
			result = result.replaceAll("\"","&quot;");*/
			result = result.replaceAll("<script","&lt;script");
		}
		return result;
	} // end of replaceParameter---------------------------
	
	public static String getCurrentURL(HttpServletRequest request){
		
		// ?다음의 데이터까지 포함한 url 주소를 알아온다.
		
		String currentURL = request.getRequestURI().toString();
		// http://localhost:9090/MyMVC/shop/prodView.up?pnum=1 에서 ? 전까지 받아옴
		
		// String queryString = request.getQueryString();
		// pnum=1을 받아온다.
		
		// 절대경로
		// currentURL += "?"+queryString;
		// http://localhost:9090/MyMVC/shop/prodView.up?pnum=1
		
		//상대경로로 잡는 방법
		String ctxpath = request.getContextPath(); // /MyMVC
		//>>> /shop/MyMVC/shop/prodView.up URL 패턴에 매핑된 클래스는 없습니다. <<<
		int beginIndex = currentURL.indexOf(ctxpath)+ctxpath.length(); // 현재 String에서 /MyMVC이 시작되는 위치값을 알려준다.
		// 21						6
		// currentURL에서 /MyMVC/ 이후의 index
		
		currentURL = currentURL.substring(beginIndex+1); // shop/prodView.up?pnum=1 을 return한다.
		
		//	beginIndex = currentURL.indexOf("/");
		//	currentURL = currentURL.substring(beginIndex+1); // /prodView.up?pnum=1 (상대경로)
	
		return currentURL;
	} // end of getCurrentURL------------------------------
	
}
