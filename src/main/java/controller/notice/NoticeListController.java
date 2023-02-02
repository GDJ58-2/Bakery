package controller.notice;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import vo.Notice;

@WebServlet("/notice/noticeList")
public class NoticeListController extends HttpServlet {
	private NoticeService noticeService;
	// noticeList 출력
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 비회원 열람가능 
		
		// 검색기능, 페이징 
		String search = request.getParameter("search");
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage")!=null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		this.noticeService = new NoticeService();
		int count = noticeService.getNoticeCount(search);
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage+=1;
		}
		if(currentPage<1) {
			currentPage = 1;
		} 
		if(count!=0&&currentPage>lastPage) {
			currentPage = lastPage;
		}
		int startPage = (currentPage-1)/10*10+1;
		int endPage = startPage + 9;
		if(startPage<1) {
			startPage = 1;
		}
		if(endPage>lastPage) {
			endPage = lastPage;
		}
		System.out.println("---------");
		System.out.println(search+"<-- NoticeListController search");
		System.out.println(currentPage+"<-- NoticeListController currentPage");
		System.out.println(rowPerPage+"<-- NoticeListController rowPerPage");
		System.out.println(count+"<-- NoticeListController count");
		System.out.println(lastPage+"<-- NoticeListController lastPage");
		System.out.println(startPage+"<-- NoticeListController startPage");
		System.out.println(endPage+"<-- NoticeListController endPage");
		System.out.println("---------");
		
		ArrayList<HashMap<String, Object>> list = noticeService.getNoticeList(search, currentPage, rowPerPage);
		request.setAttribute("noticeList", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("search", search);
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeList.jsp").forward(request, response);
	}
}