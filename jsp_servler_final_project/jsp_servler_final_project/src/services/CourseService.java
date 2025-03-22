package services;

import java.util.List;
import java.util.Optional;

import persistence.Course;

public interface CourseService {
	List<Course> getAllCourses();
	
	Optional<Course> getCourseById(String id);
}
