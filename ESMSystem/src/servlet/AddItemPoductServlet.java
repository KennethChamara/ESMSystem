package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Salary;
import model.Stockproduct;
import service.IsalaryService;
import service.SalaryServiceImpl;
import service.StockproductServiceIMPL;
import service.Stockproductservice;
import service.SupplierAnalyseServiceIMPL;
import utill.GenerateStockId;

/**
 * Servlet implementation class AddItemPoductServlet
 */
@WebServlet("/AddItemPoductServlet")
public class AddItemPoductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddItemPoductServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");

		int quantity = Integer.parseInt(request.getParameter("Quntity"));
		double price = Double.parseDouble(request.getParameter("price"));

		String productId;

		StockproductServiceIMPL IMPL = new StockproductServiceIMPL();
		ArrayList arr = IMPL.getpoducts();

		GenerateStockId ID = new GenerateStockId();
		productId = ID.generateStockId(arr);

		Stockproduct stockproduct = new Stockproduct();
		stockproduct.setPid(productId);
		stockproduct.setPname(request.getParameter("itemname"));
		stockproduct.setCategory(request.getParameter("category"));
		stockproduct.setQty(quantity);
		stockproduct.setManufacture(request.getParameter("manufacture"));
		stockproduct.setPrice(price);

		Stockproductservice service = new StockproductServiceIMPL();
		service.addProduct(stockproduct);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/additem.jsp");
		dispatcher.forward(request, response);
	}

}
