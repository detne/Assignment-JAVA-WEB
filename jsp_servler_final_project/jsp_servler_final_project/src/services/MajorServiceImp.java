package services;

import java.util.List;
import java.util.Optional;

import dao.JDBCMajorDAO;
import dao.MajorDAO;
import persistence.Major;

public class MajorServiceImp implements MajorService{

	private MajorDAO majorDao;
	
	public MajorServiceImp() {
		majorDao = new JDBCMajorDAO();
	}
	
	@Override
	public List<Major> getAllMajors() {
		return majorDao.getAllMajors();
	}

	@Override
	public Optional<Major> getMajorById(String id) {
		return majorDao.getMajorById(id);
	}

}
