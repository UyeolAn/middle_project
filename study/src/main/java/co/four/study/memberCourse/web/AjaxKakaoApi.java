package co.four.study.memberCourse.web;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/ajaxkakaoapi.do")
public class AjaxKakaoApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxKakaoApi() {
        super();
    }

	public String kakaopay(String memberId){
		
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection connection = (HttpURLConnection) url.openConnection(); //서버를 연결해주는 객체..
			connection.setRequestMethod("POST");
			connection.setRequestProperty("Authorization", "KakaoAK 2e1c7d7e214565a107689093ca97d286");
			connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			connection.setDoOutput(true); //연결을 통해 서버에게 전해줄것이 있는 지 여부..(true:내보낼것이 있다)
			String param = "cid=TC0ONETIME&partner_order_id=323&partner_user_id=jyj&"
					+ "item_name=인터넷강의&quantity=1&total_amount=100&vat_amount=10&tax_free_amount=0&"
					+ "approval_url=http://192.168.0.4/study/membercoursekakaopay.do?memberId=" + memberId + "&"
					+ "fail_url=http://192.168.0.4/study/bucketlist.do?memberId="+ memberId +"&"
					+ "cancel_url=http://192.168.0.4/study/bucketlist.do?memberId="+ memberId;
			OutputStream outputStream = connection.getOutputStream();
			DataOutputStream dataOutputStream = new DataOutputStream(outputStream);
			dataOutputStream.writeBytes(param);
			dataOutputStream.close();
			
			int result = connection.getResponseCode();
			
			InputStream inputStream;
			if(result == 200) {
				inputStream = connection.getInputStream();
			} else {
				inputStream = connection.getErrorStream();
			}
			InputStreamReader reader = new InputStreamReader(inputStream);
			BufferedReader bufferedReader = new BufferedReader(reader);
			
			return bufferedReader.readLine();
		} catch (NullPointerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "{\"result\":\"no\"}";
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		// 멤버 아이디 겟
		String memberId = request.getParameter("memberId");
		
		String kakaopay = kakaopay(memberId);
		
		String text = objectMapper.writeValueAsString(kakaopay); // list형태의 데이터 => json형태로
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(text); //ajax를 return
		return;
	}

}
