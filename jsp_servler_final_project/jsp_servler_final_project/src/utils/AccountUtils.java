package utils;

import java.util.Optional;

import persistence.Account;
import services.AccountServiceImp;

public class AccountUtils {
	private AccountUtils() {
	}
	
	public static boolean isExistedUsername(String username) {
		return new AccountServiceImp().getAllAccounts().stream().filter(a -> username.equals(a.getUsername()))
														.findFirst()
														.isPresent();
	}

	public static Optional<Account> login(String username,String password) {
		return new AccountServiceImp().getAllAccounts().stream()
											   .filter(s -> username.equals(s.getUsername()))
											   .filter(s -> password.equals(s.getPassword()))
											   .findFirst();
	}
	
	public static Optional<Account> getAccountByEmail(String email) {
		return new AccountServiceImp().getAllAccounts().stream()
				.filter(s -> email.equals(s.getEmail()))
				.findFirst();
	}
	
}
