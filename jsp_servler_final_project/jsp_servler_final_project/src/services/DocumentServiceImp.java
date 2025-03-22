package services;

import java.util.List;
import java.util.Optional;

import dao.DocumentDAO;
import dao.JDBCDocumentDAO;
import persistence.Document;

public class DocumentServiceImp implements DocumentService{

	private DocumentDAO documentDao;
	
	public DocumentServiceImp() {
		documentDao = new JDBCDocumentDAO();
	}
	
	@Override
	public List<Document> getAllDocuments() {
		return documentDao.getAllDocuments();
	}

	@Override
	public void saveDocument(Document document) {
		documentDao.saveDocument(document);
		return;
	}

	@Override
	public Optional<Document> getDocumentById(String id) {
		return documentDao.getDocumentById(id);
	}

	@Override
	public void deleteDocumentById(String id) {
		documentDao.deleteDocumentById(id);
	}

	@Override
	public void updateStatus(String id, String status) {
		documentDao.updateStatus(id, status);
	}

	@Override
	public List<Document> searchDocumentByTxt(String txt) {
		return documentDao.searchDocumentByTxt(txt);
	}
}
