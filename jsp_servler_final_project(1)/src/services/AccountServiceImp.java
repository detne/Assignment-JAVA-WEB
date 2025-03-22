package services;

import java.util.List;
import java.util.Optional;

import dao.AccountDAO;
import dao.JDBCAccountDAO;
import persistence.Account;

public class AccountServiceImp implements AccountService{

	private AccountDAO accountDAO; 
	
	public AccountServiceImp() {
		accountDAO = new JDBCAccountDAO();
	}
	
	@Override
	public List<Account> getAllAccounts() {
		return accountDAO.getAllAccounts();
	}
	
	public static void main(String[] args) {
		System.out.println(new AccountServiceImp().getAllAccounts());
	}

	@Override
	public void saveAccount(Account account) {
		accountDAO.saveAccount(account);
		return;
	}

	@Override
	public void updatePassword(String email, String newPassword) {
		accountDAO.updatePassword(email, newPassword);
		return;
	}

	@Override
	public Optional<Account> getAccountByUsername(String username) {
		return accountDAO.getAccountByUsername(username);
	}

	@Override
	public void updateRole(String username, String role) {
		accountDAO.updateRole(username, role);
		return;
	}

	@Override
	public void deleteAccountByUsername(String username) {
		accountDAO.deleteAccountByUsername(username);
	}
}
