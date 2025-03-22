package dao;

import java.util.List;
import java.util.Optional;

import persistence.Category;

public interface CategoryDAO {
	List<Category> getAllCategories();
	
	Optional<Category> getCategoryById(String id);
}
