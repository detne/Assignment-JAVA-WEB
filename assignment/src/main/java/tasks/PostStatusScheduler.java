package tasks;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.TimerTask;

import models.AccountService;
import models.Post;
import dao.AccountServiceDAO;
import dao.PostDAO;

public class PostStatusScheduler extends TimerTask {

	@Override
	public void run() {

		PostDAO postDAO = new PostDAO();
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		if (postDAO.listAccountID().size() > 0) {
			for (int i : postDAO.listAccountID()) {
				if (isExists(i)) {

					List<Post> posts = postDAO.findPostByAccountID(i);
					for (Post post : posts) {
						post.setStatus(true);
						postDAO.update(post);
					}
					if (checkExpiredService(new Timestamp(new Date().getTime()))) {
						for (Post post : posts) {
							post.setStatus(false);
							postDAO.update(post);
						}
					}

				} else if (!isExists(i)) {

					List<Post> posts = postDAO.findPostByAccountID(i);

					for (Post post : posts) {
						post.setStatus(false);
						postDAO.update(post);

					}
				}

			}
		}
	}

	public static boolean isExists(int accountID) {
		PostDAO postDAO = new PostDAO();
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		for (AccountService accountService : accountServiceDAO.findAll()) {
			if (accountService.getAccountID() == accountID) {
				return accountService.isStatus();
			}
		}
		return false;
	}

	// Hàm check đã hết hạn gói dịch vụ chưa
	public static boolean checkExpiredService(Timestamp current) {
		AccountServiceDAO accountServiceDAO = new AccountServiceDAO();
		for (AccountService accountService : accountServiceDAO.findAll()) {
			if (current.after(accountService.getEndService())) {
				accountService.setStatus(false);
				accountServiceDAO.update(accountService);
				return true;
			}
		}
		return false;
	}

}
