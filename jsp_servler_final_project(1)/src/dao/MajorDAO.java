package dao;

import java.util.List;
import java.util.Optional;

import persistence.Major;

public interface MajorDAO {
	List<Major> getAllMajors();
	
	Optional<Major> getMajorById(String id);
}
