package masterpiece.exhibition.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//===== Google메일서버를 사용할 수 있도록 Google email 계정 및 암호 입력하기 =====
public class MySMTPAuthenticator extends Authenticator {
	
	@Override
	public PasswordAuthentication getPasswordAuthentication() { 
	
		// Gmail 인 경우 @gmail.com 을 제외한 아이디만 입력한다.
		return new PasswordAuthentication("artree0213","qwer1234$");
	}
}
