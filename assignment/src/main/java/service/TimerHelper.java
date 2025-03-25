package service;

import java.util.Timer;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import tasks.NotificationScheduler;
import tasks.PostStatusScheduler;

@WebListener
/**
 * Application Lifecycle Listener implementation class TimerHelper
 *
 */
public class TimerHelper implements ServletContextListener {
	private Timer timer;

	/**
	 * Default constructor.
	 */
	public TimerHelper() {
		timer = new Timer();
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {

		if (timer != null) {
			timer.cancel();
		}
	}

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {

		PostStatusScheduler postStatusScheduler = new PostStatusScheduler();
		timer.scheduleAtFixedRate(postStatusScheduler, 0, 1000*60*60*23);
		NotificationScheduler notificationScheduler = new NotificationScheduler(sce.getServletContext());
		timer.scheduleAtFixedRate(notificationScheduler, 0, 1000*60*60*23);
	
	}

}
