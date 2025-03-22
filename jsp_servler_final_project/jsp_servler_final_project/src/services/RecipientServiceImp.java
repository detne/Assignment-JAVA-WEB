package services;

import java.util.List;

import dao.JDBCRecipientDAO;
import dao.RecipientDAO;
import persistence.Recipient;

public class RecipientServiceImp implements RecipientService{

	private RecipientDAO recipientDao;
	
	public RecipientServiceImp() {
		recipientDao = new JDBCRecipientDAO();
	}
	
	@Override
	public List<Recipient> getAllRecipients() {
		return recipientDao.getAllRecipients();
	}

	@Override
	public void saveRecipient(Recipient recipient) {
		recipientDao.saveRecipient(recipient);
	}
	

}
