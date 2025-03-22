package dao;

import java.util.List;

import persistence.Recipient;

public interface RecipientDAO {
	
	List<Recipient> getAllRecipients();
	
	void saveRecipient(Recipient recipient);
}
