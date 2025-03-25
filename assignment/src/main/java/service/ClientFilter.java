package service;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ip2location.IPResult;

/**
 * Servlet Filter implementation class ClientFilter1
 */
@WebFilter(urlPatterns = { "/home", "" })
public class ClientFilter extends HttpFilter implements Filter {
	private IP2LocationService ip2LocationService;

	/**
	 * @see HttpFilter#HttpFilter()
	 */
	public ClientFilter() {
		super();
		this.ip2LocationService = new IP2LocationService();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		HttpSession session = httpRequest.getSession();

		String clientPublicIP = IPAddressUtil.getPublicIPAddress();
		
		String dbPath = getServletContext().getRealPath("/WEB-INF/IP2LOCATION-LITE-DB11.BIN");
		System.out.println("DB Path: " + dbPath); // Kiểm tra đường dẫn
		ip2LocationService = new IP2LocationService(dbPath);

		if (this.ip2LocationService == null) {
			System.out.println("IP2LocationService is not initialized.");
			chain.doFilter(request, response);
			return;
		}

		IPResult result = ip2LocationService.lookup(clientPublicIP);

		if (result != null) {
			System.out.println("IP2Location Result: " + result);
			System.out.println("Country Short: " + result.getCountryShort());
			System.out.println("Country Long: " + result.getCountryLong());
			
		} else {
			System.out.println("IP2Location Result is null");
		}

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		super.init(fConfig);

	}

}
