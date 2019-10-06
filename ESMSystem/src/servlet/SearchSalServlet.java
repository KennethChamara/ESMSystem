package servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * Servlet implementation class SearchSalServlet
 */
@WebServlet("/SearchSalServlet")
public class SearchSalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchSalServlet() {
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
		
		String reslut=request.getParameter("searchatb");
		 System.out.println("error in Search Servlet 1");
    	
    	request.setAttribute("result", reslut);
    	 System.out.println("error in Search Servlet 2");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Salary_Search_Result.jsp");
		 System.out.println("error in Search Servlet 3");
		dispatcher.forward(request, response);
		 System.out.println("error in Search Servlet 4");
		
		
		
	}

}
