package services;

import java.util.List;
import java.util.Optional;

import dao.CourseDAO;
import dao.JDBCCourseDAO;
import persistence.Course;

public class CourseServiceImp implements CourseService{

	private CourseDAO courseDao;
	
	public CourseServiceImp() {
		courseDao = new JDBCCourseDAO();
	}
	
	@Override
	public List<Course> getAllCourses() {
		return courseDao.getAllCourses();
	}

	@Override
	public Optional<Course> getCourseById(String id) {
		return courseDao.getCourseById(id);
	}

}
