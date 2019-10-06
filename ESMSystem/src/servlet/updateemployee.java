package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeDetails;
import service.EmployeeService;
import service.EmployeeServiceIMPL;

/**
 * Servlet implementation class updateemployee
 */
@WebServlet("/updateemployee")
public class updateemployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateemployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String empID=request.getParameter("empID");
		String empName= request.getParameter("empname");
		String empEmail = request.getParameter("Email");
		String empGender= request.getParameter("Gender");
		String empAddress=request.getParameter("Address");
		String empDesignation=request.getParameter("Designation");
		
		EmployeeDetails dls = new EmployeeDetails();
		dls.setEmpID(empID);
		dls.setEmpName(empName);
		dls.setEmpEmail(empEmail);
		dls.setEmpGender(empGender);
		dls.setEmpAddress(empAddress);
		dls.setEmpDesignation(empDesignation);
		

		EmployeeService empService = new EmployeeServiceIMPL();
 		
		empService.updatemployeedetails(dls);
		
		//request.setAttribute("employee", dls);


		
		// <% EmployeeDetails dls = request.getAttribute("employee"); %>
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listemployers.jsp");
		dispatcher.forward(request, response);
	}
		
	

}
