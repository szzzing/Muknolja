package com.spring.muknolja.hotel.model.vo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import lombok.Getter;
import lombok.Setter;


public class Payment {

	@Getter
	@Setter
	private class Response{
		private PaymentInfo response;
	}

	@Getter
	@Setter
	private class PaymentInfo{
		private int amount;
	}

	public static String getToken() {
		String token = null;

		try {
			URL url = new URL("https://api.iamport.kr/users/getToken");

			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setDoOutput(true);

			JSONObject json = new JSONObject();
			json.put("imp_key", "3363718380830163");
			json.put("imp_secret", "IHH5z1agjWjBY6Cud1AKAR9RmpRvAXC4R5wKzfNdH2lggEidicmsBQPCETUqmUmKogJSx6GAWw0rppkZ");

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			bw.write(json.toString());
			bw.flush();
			bw.close();

			int responseCode = conn.getResponseCode();
			System.out.println("응답코드 : "+responseCode);

			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
				StringBuilder sb = new StringBuilder();
				String line = null;
				while((line = br.readLine())!=null) {
					sb.append(line+"\n");
				}
				br.close();

				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject)jsonParser.parse(sb.toString());
				JSONObject responseData = (JSONObject)jsonObj.get("response");
				token = (String)responseData.get("access_token");
				System.out.println(token);

			} else {
				System.out.println(conn.getResponseCode());
			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return token;
	}


	public static void paymentCancle(String access_token, String merchant_uid, int amount, String reason) {
		System.out.println("결제 취소");
		try {
			HttpsURLConnection conn = null;
			URL url = new URL("https://api.iamport.kr/payments/cancel");

			conn = (HttpsURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", access_token);
			conn.setDoOutput(true);

			JsonObject json = new JsonObject();
			json.addProperty("reason", reason);	// 취소사유
			json.addProperty("merchant_uid", merchant_uid);	// 결제번호
			json.addProperty("amount", amount);	// 환불금액
			json.addProperty("checksum", amount);	// 환불금액

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			bw.write(json.toString());
			bw.flush();
			bw.close();
			
			int responseCode = conn.getResponseCode();
			System.out.println("응답코드 : "+responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

			br.close();
			conn.disconnect();

		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
