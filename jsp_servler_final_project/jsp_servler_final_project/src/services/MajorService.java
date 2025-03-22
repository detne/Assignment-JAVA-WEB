package services;

import java.util.List;
import java.util.Optional;

import persistence.Major;

public interface MajorService {
	List<Major> getAllMajors();
	
	Optional<Major> getMajorById(String id);
}
