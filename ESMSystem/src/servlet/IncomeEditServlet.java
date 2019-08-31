package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Income;
import service.IncomeService;

/**
 * Servlet implementation class IncomeEditServlet
 */
@WebServlet("/IncomeEditServlet")
public class IncomeEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		out.print("<h1>Update Income</h1>");
		
		
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		
		Income i = IncomeService.getIncomeById(id);
		
		request.setAttribute("i", i);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/incomeEdit.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
