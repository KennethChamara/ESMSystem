package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bonuse;
import model.Salary;
import service.IsalaryService;
import service.SalaryServiceImpl;
import service.bonuseServiceIMPL;
import service.bonuseService;

/**
 * Servlet implementation class AddBonuseServlet
 */
@WebServlet("/AddBonuseServlet")
public class AddBonuseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBonuseServlet() {
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
		int rate;
		rate = Integer.parseInt(request.getParameter("brate"));

		Bonuse bonus = new Bonuse();
		
		bonus.setEid(request.getParameter("eId"));
		bonus.setRate(rate);
		bonus.setType(request.getParameter("bType"));
	
		bonuseService service = new bonuseServiceIMPL();
		service.addBounce(bonus);
		
		
		//request.setAttribute("salary", salary);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/bonuseTable.jsp");
		dispatcher.forward(request, response);
	}

}
