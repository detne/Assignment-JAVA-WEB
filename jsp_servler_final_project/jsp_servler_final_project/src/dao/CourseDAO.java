package dao;

import java.util.List;
import java.util.Optional;

import persistence.Course;

public interface CourseDAO {
	List<Course> getAllCourses();
	
	Optional<Course> getCourseById(String id);
}
