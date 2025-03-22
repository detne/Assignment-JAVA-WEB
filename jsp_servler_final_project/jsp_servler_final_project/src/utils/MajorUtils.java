package utils;

import java.util.Optional;

import persistence.Major;
import services.MajorServiceImp;

public class MajorUtils {
	private MajorUtils() {
	}

	public static Optional<Major> getMajorById(String id) {
		return new MajorServiceImp().getMajorById(id);
	}
	
	
}
