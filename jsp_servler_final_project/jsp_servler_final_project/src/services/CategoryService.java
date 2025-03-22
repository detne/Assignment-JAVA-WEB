package services;

import java.util.List;
import java.util.Optional;

import persistence.Category;

public interface CategoryService {
	List<Category> getAllCategories();
	
	Optional<Category> getCategoryById(String id);
}
