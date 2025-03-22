package utils;

import java.util.Optional;

import persistence.Category;
import services.CategoryServiceImp;

public class CategoryUtils {
	private CategoryUtils() {
	}
	
	public static Optional<Category> getCategoryById(String id) {
		return new CategoryServiceImp().getCategoryById(id);
	}
	
}
