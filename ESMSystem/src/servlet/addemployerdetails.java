package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.EmployeeDetails;
import service.EmployeeService;
import service.EmployeeServiceIMPL;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;
import utill.GenerateEmployeeID;

/**
 * Servlet implementation class addemployerdetails
 */
@WebServlet("/addemployerdetails")
public class addemployerdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private GenerateEmpID GenerateEmpID;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addemployerdetails() {
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
		
		    response.setContentType("text/html");
	
		
			String empName= request.getParameter("empname");
			String empEmail = request.getParameter("Email");
			String empGender =request.getParameter("Gender");
			String empAddress =request.getParameter("Address");
			String empDesignation  =request.getParameter("Designaton");
			String empID;
			
			;
			
			EmployeeService IMPL = new EmployeeServiceIMPL();
			ArrayList arr=IMPL.getemployeedetailsList(null);
			
			GenerateEmployeeID ID = new GenerateEmployeeID();
			empID=ID.GenerateEmpID(arr);
			
			EmployeeDetails erdd=new EmployeeDetails();
			erdd.setEmpID(empID);
			erdd.setEmpName(empName);
			erdd.setEmpEmail(empEmail);
			erdd.setEmpGender(empGender);
			erdd.setEmpAddress(empAddress);
			erdd.setEmpDesignation(empDesignation);
			
			
			EmployeeService empService  = new EmployeeServiceIMPL();
			empService.addemployee(erdd);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listemployers.jsp");
			dispatcher.forward(request, response);
	}

}
