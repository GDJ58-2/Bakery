package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class BootListener implements ServletContextListener {
	
	// 톰켓 on시 자동으로 실행되는 코드
    public void contextInitialized(ServletContextEvent sce)  { 
    	// context(application)영역에 현재접속자 수를 저장할 속성변수(attribute) 생성(초시화) 
    	sce.getServletContext().setAttribute("currentCount", 0);
    	System.out.println("context currentCount속성값 초기화");
    	
    	// 드라이브 로딩
    	try {
			Class.forName("org.mariadb.jdbc.Driver");
			System.out.println("BootListener 드라이브 로딩 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이브 로딩 실패");
			e.printStackTrace();
		}
    }
	
    // 톰켓 off시 자동으로 실행되는 코드
    public void contextDestroyed(ServletContextEvent sce)  { 
    }
}