package tasks;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import javax.servlet.ServletContext;

import models.AccountService;
import models.Chat;
import dao.AccountServiceDAO;
import dao.ChatDAO;

public class NotificationScheduler extends TimerTask {
	private ServletContext request;

	public NotificationScheduler(ServletContext request) {
		super();
		this.request = request;
	}

	@Override
	public void run() {
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		ChatDAO chatDAO = new ChatDAO();
		LocalDate date2 = LocalDate.now(); // Ngày hiện tại
		List<AccountService> accountServices = new ArrayList<AccountService>();
		for (AccountService accountService : accountServiceDAO.findAll()) {

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(accountService.getEndService());
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH);
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			LocalDate date1 = LocalDate.of(year, month + 1, day);
			long daysBetween = ChronoUnit.DAYS.between(date2, date1);
			if (daysBetween == 5 || daysBetween == 1) {
				chatDAO.newChat(new Chat(accountService.getAccountID(), 29,
						"Gói cước của bạn sắp hết hạn, nếu muốn gia hạn hãy reply!", 0, new Date()));
				accountServices.add(accountService);
				request.setAttribute("notiService", "Gói cước của bạn sắp hết hạn, hãy liên hệ với admin để trao đổi về dịch vụ mới!");
				request.setAttribute("services", accountServices);
			}
		}
	}
	public static void main(String[] args) {
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		ChatDAO chatDAO = new ChatDAO();
		LocalDate date2 = LocalDate.now(); // Ngày hiện tại
		List<AccountService> accountServices = new ArrayList<AccountService>();
		for (AccountService accountService : accountServiceDAO.findAll()) {

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(accountService.getEndService());
			int year = calendar.get(Calendar.YEAR);
			int month = calendar.get(Calendar.MONTH);
			int day = calendar.get(Calendar.DAY_OF_MONTH);
			LocalDate date1 = LocalDate.of(year, month + 1, day);
			long daysBetween = ChronoUnit.DAYS.between(date2, date1);
			if (daysBetween == 5 || daysBetween == 1) {
				chatDAO.newChat(new Chat(accountService.getAccountID(), 29,
						"Gói cước của bạn còn hạn 5 ngày, nếu muốn gia hạn hãy reply!", 0, new Date()));
				accountServices.add(accountService);
			}
		}
		System.out.println(accountServices);
	}
	
}
	