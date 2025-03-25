package service;

import models.UserGoogleDto;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;


public class GoogleUtils {
	private final static String GOOGLE_CLIENT_ID = "818352606855-64naicbsoagu0cdmr6af6n1hmrv37a8q.apps.googleusercontent.com";
	private final static String GOOGLE_CLIENT_SECRET = "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";
	private final static String GOOGLE_REDIRECT_URI = "http://localhost:8080/projectGroup6/login-google";
	private final static String GOOGLE_REDIRECT_URI2 = "http://localhost:8080/projectGroup6/signup-google";
	private final static String GOOGLE_GRANT_TYPE = "authorization_code";
	private final static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
	private final static String GOOGLE_LINK_GET_USER_INFO = 		"https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

	private GoogleUtils() {

	}

	public static String getToken(final String code) throws ClientProtocolException,IOException  {
		String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
						.add("client_secret", GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", GOOGLE_REDIRECT_URI)
						.add("code", code).add("grant_type", GOOGLE_GRANT_TYPE)
						.build())
				.execute().returnContent().asString();
		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}
	
	public static String getToken2(final String code) throws ClientProtocolException,IOException  {
		String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
				.bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
						.add("client_secret", GOOGLE_CLIENT_SECRET)
						.add("redirect_uri", GOOGLE_REDIRECT_URI2)
						.add("code", code).add("grant_type", GOOGLE_GRANT_TYPE)
						.build())
				.execute().returnContent().asString();
		JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
		String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
		return accessToken;
	}
	public static UserGoogleDto getUserInfo(final String accessToken) throws ClientProtocolException, 
IOException {
		String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
		String response = Request.Get(link).execute().returnContent().asString();
		UserGoogleDto googlePojo = new Gson().fromJson(response, UserGoogleDto.class);
		System.out.println(googlePojo);
		return googlePojo;
	}
}