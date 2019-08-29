package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

import model.Salary;
import service.IsalaryService;
import service.SalaryServiceImpl;

/**
 * Servlet implementation class GetSalaryServlet
 */
@WebServlet("/GetSalaryServlet")
public class GetSalaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSalaryServlet() {
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

 		String salaryID = request.getParameter("salaryID");			
		IsalaryService iSalaryService = new SalaryServiceImpl();
		Salary salary = iSalaryService.getSalaryByID(salaryID);

		request.setAttribute("salary", salary);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updateSalary.jsp");
		dispatcher.forward(request, response);
	}

}
