package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Salary;
import service.IsalaryService;
import service.SalaryServiceImpl;

/**
 * Servlet implementation class UpdateSalaryServlet
 */
@WebServlet("/UpdateSalaryServlet")
public class UpdateSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSalaryServlet() {
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
		response.setContentType("text/html");

		Salary salary = new Salary();
		salary.setSalaryID(request.getParameter("btn"));
		salary.setEmpName(request.getParameter("usr"));
		salary.setMonth(request.getParameter("month"));
		salary.setDate(request.getParameter("date"));
		salary.setAmount(Double.parseDouble(request.getParameter("amount")));
		salary.setEmpId("EID222");
		

		IsalaryService isalaryService = new SalaryServiceImpl();
		isalaryService.updateSalary(salary.getSalaryID(), salary);

		request.setAttribute("salary", salary);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/salaryTab.jsp");
		dispatcher.forward(request, response);
		
	}

}
