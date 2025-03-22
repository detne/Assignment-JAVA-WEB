package utils;

import java.util.Optional;

import persistence.Course;
import services.CourseServiceImp;

public class CourseUtils {

	private CourseUtils() {
	}

	public static Optional<Course> getCourseById(String id) {
		return new CourseServiceImp().getCourseById(id);
	}
}
