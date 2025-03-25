package service;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;

public class IPAddressUtil {
	 public static String getPublicIPAddress() {
	        String ip = "";
	        try {
	            CloseableHttpClient httpClient = HttpClients.createDefault();
	            HttpGet request = new HttpGet("https://api.ipify.org?format=json");

	            JSONObject  jsonObject;
	            try (CloseableHttpResponse response = httpClient.execute(request)) {
	                String jsonResponse = EntityUtils.toString(response.getEntity());
	                jsonObject = new JSONObject(jsonResponse);
	            }

	            ip = jsonObject.getString("ip");
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return ip;
	    }
}
