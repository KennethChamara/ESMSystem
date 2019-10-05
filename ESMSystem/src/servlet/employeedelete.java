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
 * Servlet implementation class employeedelete
 */
@WebServlet("/employeedelete")
public class employeedelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public employeedelete() {
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
		// TODO Auto-generated method stub
		
    String empID=request.getParameter("empID");
		
		EmployeeDetails spd=new EmployeeDetails();
		spd.setEmpID(empID);
		
		EmployeeService IMPL =new EmployeeServiceIMPL();
		
		EmployeeService empce =new EmployeeServiceIMPL();
		empce.deleteEmployeeById(empID);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listemployers.jsp");
		dispatcher.forward(request, response);
		
		
		

		
		
	}

}
