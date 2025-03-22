package services;

import java.util.List;
import java.util.Optional;

import persistence.Document;

public interface DocumentService {
	List<Document> getAllDocuments();
	
	Optional<Document> getDocumentById(String id);
	
	void saveDocument(Document document);
	
	void deleteDocumentById(String id);
	
	void updateStatus(String id,String status);
	
	List<Document> searchDocumentByTxt(String txt);
}
