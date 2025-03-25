package utils;

import models.Log;
import dao.LogDAO;

public class LogServiceImpl {
	public static boolean insert(Log log) {
		LogDAO logDAO = new LogDAO();
		for (Log log1 : logDAO.findAll()) {
			if(log1.getIp().equals(log.getIp()) && log1.getLevel().equals(log.getLevel())) {
				System.out.println("aaa");
				logDAO.updateTime(log);
				return false;
			}
		}
		
		return logDAO.create(log);
		
	}


	
}
