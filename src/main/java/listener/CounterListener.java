package listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import dao.SiteCounterDao;

@WebListener
public class CounterListener implements HttpSessionListener {
	private SiteCounterDao siteCounterDao;
	
	// 세션이 생성될때
    public void sessionCreated(HttpSessionEvent se)  { 
    	// 현재 서브의 접속자 수 -> 서버속성을 이용
    	int num
    		= (int)(se.getSession().getServletContext().getAttribute("currentCount"));
    	se.getSession().getServletContext().setAttribute("currentCount", num+1);
    	System.out.println("세션생성 currentCount : "+ se.getSession().getServletContext().getAttribute("currentCount"));
    	
    	// 전체 or 날짜별 접속자 수 -> db가 필용
    	siteCounterDao = new SiteCounterDao();
    	try {
	    	int todayCount = siteCounterDao.selectTodayCount();
	    	if(todayCount == 0) { // 오늘 첫 접속자
	    		siteCounterDao.insertCounter();
	    	} else { // 오늘 첫 접속자 아님
	    		siteCounterDao.updateCounter();
	    	} 
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    // 세션이 소멸될때
    public void sessionDestroyed(HttpSessionEvent se)  { 
    	int num
			= (int)(se.getSession().getServletContext().getAttribute("currentCount"));
    	se.getSession().getServletContext().setAttribute("currentCount", num-1);
    	System.out.println("세션소멸 currentCount : "+ se.getSession().getServletContext().getAttribute("currentCount"));
    }
}