/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import models.Account;
import models.Accountdetails;
import models.Log;
import models.Transaction;
import utils.IPConfigUtil;
import dao.AccountDetailsDAO;
import dao.TransactionDAO;
import service.Config;
import dao.LogDAO;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

@WebServlet("/payment")
/**
 *
 * @author CTT VNPAY
 */
public class PaymentServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
		if (action == null) {
			doGet_Index(req, resp);
		} else if (action.equalsIgnoreCase("return")) {
			doGet_Return(req, resp);
		} else if (action.equalsIgnoreCase("returnPaypal")) {
			doGet_ReturnPaypal(req, resp);
		}

	}

	protected void doGet_Index(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/payment.jsp").forward(req, resp);

	}

	protected void doGet_Return(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Account account = (Account) req.getSession().getAttribute("account");
		AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
		Accountdetails accountdetails = new Accountdetails();
		LogDAO logDAO = new LogDAO();
		System.out.println(account);
		if (account == null) {
			req.getSession().setAttribute("msg", "Bạn cần đăng nhập để nạp tiền");
			resp.sendRedirect("home");
		} else {
			accountdetails = accountDetailsDAO.findAccountByAccountID(account.getId());
			System.out.println(accountdetails);
			if (accountdetails == null) {
				req.getSession().setAttribute("msg", "Bạn cần phải cập nhật thông tin tài khoản để nạp tiền");
				resp.sendRedirect("account");
			} else {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
				SimpleDateFormat dateFormat2 = new SimpleDateFormat("dd/MM/yyyy");
				String statusCode = req.getParameter("vnp_ResponseCode");
				String orderInfo = req.getParameter("vnp_OrderInfo");
				String transactionNo = req.getParameter("vnp_TransactionNo");
				String paymentType = req.getParameter("vnp_CardType");

				if (statusCode.equals("00")) {
					double beforeTransaction = accountdetails.getBalance();
					String amount = req.getParameter("vnp_Amount");
					System.out.println(Double.parseDouble(amount) / 100);
					double afterTransaction = accountdetails.getBalance() + Double.parseDouble(amount) / 100;
					String date = req.getParameter("vnp_PayDate");
					accountdetails.setBalance(afterTransaction);
					Transaction transaction = new Transaction(1, Double.parseDouble(amount) / 100, new Date(),
							account.getId(), orderInfo, paymentType, transactionNo);
					TransactionDAO transactionDAO = new TransactionDAO();
					if (accountDetailsDAO.updateBalance(accountdetails) && transactionDAO.create(transaction)) {
						logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AccountID: " + account.getId() + " nạp tiền vào tài khoản bằng VNPay",new IPConfigUtil().ipconfig(req).getCountryLong(), new java.util.Date(), "Số tiền trước khi nạp: " + beforeTransaction, "Số tiền sau khi nạp: " + afterTransaction));
						req.getSession().removeAttribute("accountdetails");
						req.getSession().setAttribute("accountdetails",
								accountDetailsDAO.findAccountByAccountID(account.getId()));
						req.getRequestDispatcher("/WEB-INF/views/user/return.jsp").forward(req, resp);
					} else {
						System.out.println("That bai");
					}
					try {
						System.out.println(dateFormat2.format(dateFormat.parse(date)));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			}

		}

	}
	protected void doGet_ReturnPaypal(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		   String urlString = "https://portal.vietcombank.com.vn/Usercontrols/TVPortal.TyGia/pXML.aspx?b=10"; 
		   String usdSellRate = null;
	        HttpURLConnection connection = null;
	        InputStream inputStream = null;
	        try {
	        
	            URL url = new URL(urlString);
	            connection = (HttpURLConnection) url.openConnection();
	            connection.setRequestMethod("GET");

	          
	            if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
	          
	                inputStream = connection.getInputStream();

	              
	                DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	                DocumentBuilder builder = factory.newDocumentBuilder();

	              
	                Document document = builder.parse(inputStream);

	           
	                NodeList nodeList = document.getElementsByTagName("Exrate");

	               

	          
	                for (int i = 0; i < nodeList.getLength(); i++) {
	                    Element element = (Element) nodeList.item(i);
	                    if ("USD".equals(element.getAttribute("CurrencyCode"))) {
	                        usdSellRate = element.getAttribute("Transfer");
	                        break;
	                    }
	                }

	            } else {
	                throw new ServletException("Failed to fetch XML file: HTTP code " + connection.getResponseCode());
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new ServletException("Error processing XML file: " + e.getMessage(), e);
	        } finally {
	         
	            if (inputStream != null) {
	                try {
	                    inputStream.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                }
	            }
	            if (connection != null) {
	                connection.disconnect();
	            }
	        }
		Account account = (Account) req.getSession().getAttribute("account");
		AccountDetailsDAO accountDetailsDAO = new AccountDetailsDAO();
		Accountdetails accountdetails = new Accountdetails();
		LogDAO logDAO = new LogDAO();
		if (account == null) {
			req.getSession().setAttribute("msg", "Bạn cần đăng nhập để nạp tiền");
			resp.sendRedirect("home");
		} else {
			accountdetails = accountDetailsDAO.findAccountByAccountID(account.getId());
			if (accountdetails == null) {
				req.getSession().setAttribute("msg", "Bạn cần phải cập nhật thông tin tài khoản để nạp tiền");
				resp.sendRedirect("account");
			} else {
				String amount = req.getParameter("payment_gross");
				String transactionNo = req.getParameter("txn_id");
				String orderInfo = "Nạp tiền " + Double.parseDouble(amount)* Double.parseDouble(usdSellRate.replace(",", "")) + " vào tài khoản.";
				String paymentType = "paypal-" + req.getParameter("payer_email");
				String statusCode = req.getParameter("payment_status");
				if (statusCode.equals("Completed")) {
					double beforeTransaction = accountdetails.getBalance();
					double afterTransaction = accountdetails.getBalance() + Double.parseDouble(amount)* Double.parseDouble(usdSellRate.replace(",", ""));
					accountdetails.setBalance(afterTransaction);
					Transaction transaction = new Transaction(1, Double.parseDouble(amount)* Double.parseDouble(usdSellRate.replace(",", "")), new Date(),
							account.getId(), orderInfo, paymentType, transactionNo);
					TransactionDAO transactionDAO = new TransactionDAO();
					if (accountDetailsDAO.updateBalance(accountdetails) && transactionDAO.create(transaction)) {
						logDAO.create(new Log(IPConfigUtil.clientPublicIP, "alert","AccountID: " + account.getId() + " nạp tiền vào tài khoản bằng PayPal",new IPConfigUtil().ipconfig(req).getCountryLong(), new java.util.Date(), "Số tiền trước khi nạp: " + beforeTransaction, "Số tiền sau khi nạp: " + afterTransaction));
						req.getSession().removeAttribute("accountdetails");
						req.getSession().setAttribute("accountdetails",
								accountDetailsDAO.findAccountByAccountID(account.getId()));
						req.getRequestDispatcher("/WEB-INF/views/user/return.jsp").forward(req, resp);
					} else {
						System.out.println("That bai");
					}
					
				}

			}

		}
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String vnp_Version = "2.1.0";
		String vnp_Command = "pay";
		String orderType = "other";
		long amount = Integer.parseInt(req.getParameter("amount")) * 100;
		String bankCode = req.getParameter("bankCode");

		String vnp_TxnRef = Config.getRandomNumber(8);
		String vnp_IpAddr = Config.getIpAddress(req);

		String vnp_TmnCode = Config.vnp_TmnCode;

		Map<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", String.valueOf(amount));
		vnp_Params.put("vnp_CurrCode", "VND");

		if (bankCode != null && !bankCode.isEmpty()) {
			vnp_Params.put("vnp_BankCode", bankCode);
		}
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", "Nap vao " + amount / 100 + "  tai khoan");
		vnp_Params.put("vnp_OrderType", orderType);

		String locate = req.getParameter("language");
		if (locate != null && !locate.isEmpty()) {
			vnp_Params.put("vnp_Locale", locate);
		} else {
			vnp_Params.put("vnp_Locale", "vn");
		}
		vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		cld.add(Calendar.MINUTE, 15);
		String vnp_ExpireDate = formatter.format(cld.getTime());
		vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

		List fieldNames = new ArrayList(vnp_Params.keySet());
		Collections.sort(fieldNames);
		StringBuilder hashData = new StringBuilder();
		StringBuilder query = new StringBuilder();
		Iterator itr = fieldNames.iterator();
		while (itr.hasNext()) {
			String fieldName = (String) itr.next();
			String fieldValue = (String) vnp_Params.get(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				// Build hash data
				hashData.append(fieldName);
				hashData.append('=');
				hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				// Build query
				query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
				query.append('=');
				query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
				if (itr.hasNext()) {
					query.append('&');
					hashData.append('&');
				}
			}
		}
		String queryUrl = query.toString();
		String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
		queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
		String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
		System.out.println(paymentUrl);
		resp.sendRedirect(paymentUrl);
	}

}
