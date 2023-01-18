package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vo.Customer;
import vo.CustomerAddress;
import service.CustomerService;
import service.CustomerAddressService;

@WebServlet("/customer/addCustomer")
public class AddCustomerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer != null) { // 로그인 된 상태
			response.sendRedirect(request.getContextPath() + "/customer/home");
			return;
		}
		
		request.getRequestDispatcher("/WEB-INF/view/customer/addCustomer.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer != null) { // 로그인 된 상태
			response.sendRedirect(request.getContextPath() + "/customer/home");
			return;
		}
			
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String addressKind = request.getParameter("addressKind");
		System.out.println(phone);
		if(id.equals("") || pw.equals("") || name.equals("") || phone.equals("")
				|| address.equals("") || addressKind.equals("")) {
			System.out.print("AddCustomerController: 빈칸있음");
			response.sendRedirect(request.getContextPath() + "/customer/addCustomer");
			return;
		}
	
		Customer customer = new Customer();
		customer.setCustomerId(id);
		customer.setCustomerPw(pw);
		customer.setCustomerName(name);
		customer.setCustomerPhone(phone);
		
		CustomerAddress customerAddress = new CustomerAddress();
		customerAddress.setCustomerId(id);
		customerAddress.setAddressKind(addressKind);
		customerAddress.setAddress(address);
		
		CustomerService customerService = new CustomerService();
		int result = customerService.addCustomer(customer);
		CustomerAddressService addressService = new CustomerAddressService();
		addressService.addAddress(customerAddress);
		String addMsg = null;
		if(result == 1) { 
			System.out.println("AddCustomerController: 회원가입 완료");
			addMsg = "hello";
			response.sendRedirect(request.getContextPath() + "/customer/login?addMsg="+addMsg);
		} else {
			response.sendRedirect(request.getContextPath() + "/customer/addCustomer");
		}
	}
}