package services;

import java.util.List;
import java.util.Optional;

import dao.CategoryDAO;
import dao.JDBCCategoryDAO;
import persistence.Category;

public class CategoryServiceImp implements CategoryService{

	private CategoryDAO categoryDao;
	
	public CategoryServiceImp() {
		categoryDao = new JDBCCategoryDAO();
	}
	
	@Override
	public List<Category> getAllCategories() {
		return categoryDao.getAllCategories();
	}

	@Override
	public Optional<Category> getCategoryById(String id) {
		return categoryDao.getCategoryById(id);
	}

}
