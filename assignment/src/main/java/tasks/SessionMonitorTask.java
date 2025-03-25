package tasks;

import java.util.TimerTask;

import javax.servlet.ServletContext;

import models.Account;

public class SessionMonitorTask extends TimerTask{
	private ServletContext request;
	
	public SessionMonitorTask(ServletContext request) {
		super();
		this.request = request;
	}

	public SessionMonitorTask() {
		super();
	}

	@Override
	public void run() {
		if( request.getAttribute("account") != null) {
			Account account = (Account) request.getAttribute("account");
			
			
		}
		/*
		 * ServletContext context = sce.getServletContext(); MyTask myTask = new
		 * MyTask(context); timer.scheduleAtFixedRate(myTask, 0, 100000);
		 */	
		
	}

}
