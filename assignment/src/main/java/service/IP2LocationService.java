package service;

import com.ip2location.IP2Location;
import com.ip2location.IPResult;

public class IP2LocationService {
	private IP2Location ip2Location;

	public IP2LocationService() {
		super();
		this.ip2Location = new IP2Location();
	}

	public IP2LocationService(String dbPath) {
		try {
			ip2Location = new IP2Location();
			ip2Location.Open(dbPath);
		} catch (Exception e) {
			ip2Location = null;
			e.printStackTrace();
		}
	}

	public IPResult lookup(String ip) {
		try {
			 if (ip2Location == null) {
		            System.out.println("IP2Location is not initialized.");
		            return null;
		        }
		        IPResult result = ip2Location.IPQuery(ip);
		        if (result == null) {
		            System.out.println("IP2Location query result is null.");
		            return null;
		        }
		        return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		String dbPath = "D:\\T-Apartment\\IP2LOCATION-LITE-DB11.BIN"; // Đặt đường dẫn đến file DB của bạn
		IP2LocationService ip2LocationService = new IP2LocationService(dbPath);
		System.out.println(ip2LocationService.lookup("27.77.254.9"));
	}
}
