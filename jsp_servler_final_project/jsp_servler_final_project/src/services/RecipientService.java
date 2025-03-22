package services;

import java.util.List;

import persistence.Recipient;

public interface RecipientService {

	List<Recipient> getAllRecipients();
	
	void saveRecipient(Recipient recipient);
}
