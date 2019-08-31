package servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class UpdateItemServlet
 */
@WebServlet("/UpdateItemServlet")
public class UpdateItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateItemServlet() {
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

		String pid=request.getParameter("itemId");
		String item=request.getParameter("item");
		String category= request.getParameter("category");
		int qnt =Integer.parseInt(request.getParameter("qnt"));
		String manufacture= request.getParameter("manufacture");
	    double price=Double.parseDouble(request.getParameter("price"));
	
	    Stockproduct stockproduct = new Stockproduct();
		stockproduct.setPid(pid);
		stockproduct.setPname(item);
		stockproduct.setCategory(category);
		stockproduct.setQty(qnt);
		stockproduct.setManufacture(manufacture);
		stockproduct.setPrice(price);
		
		
		Stockproductservice service = new StockproductServiceIMPL();
		 service.updatestockproducts(stockproduct);
		 
		
		
		request.setAttribute("item",stockproduct);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Stockproducts.jsp");
		dispatcher.forward(request, response);
	}

}
