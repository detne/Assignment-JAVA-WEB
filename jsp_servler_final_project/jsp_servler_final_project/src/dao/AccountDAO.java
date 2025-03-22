package dao;

import java.util.List;
import java.util.Optional;

import persistence.Account;

public interface AccountDAO {
	
	List<Account> getAllAccounts();
	
	void saveAccount(Account account);
	
	void updatePassword(String email,String newPassword);
	
	Optional<Account> getAccountByUsername(String username);
	
	void updateRole(String username,String role); 
	
	void deleteAccountByUsername(String username);
	
}
