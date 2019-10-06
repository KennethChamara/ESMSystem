package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Stockproduct;
import service.StockproductServiceIMPL;
import service.Stockproductservice;

/**
 * Servlet implementation class SelectItemServlet
 */
@WebServlet("/SelectItemServlet")
public class SelectItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectItemServlet() {
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
		
		
		Stockproductservice service = new StockproductServiceIMPL();
		 
		Stockproduct stockproduct = service.getOnepoducts(request.getParameter("id"));
		 
		
		
		request.setAttribute("item",stockproduct);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edititem.jsp");
		dispatcher.forward(request, response);
	}

}
