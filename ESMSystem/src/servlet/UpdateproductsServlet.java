package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierDetails;
import model.ProductDetails;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;

/**
 * Servlet implementation class UpdateproductsServlet
 */
@WebServlet("/UpdateproductsServlet")
public class UpdateproductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateproductsServlet() {
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
		String productId=request.getParameter("productId");
		String ProductName= request.getParameter("ProductName");
		int Quantity = Integer.parseInt(request.getParameter("Quantity"));
		double Discount=Double.parseDouble(request.getParameter("Discount"));
		double unitprice=Double.parseDouble(request.getParameter("unitprice"));
		
		ProductDetails dls = new ProductDetails();//create Marks object using Marks class
		dls.setProductId(productId);
		dls.setProductName(ProductName);
		dls.setQuantity(Quantity);
		dls.setQuantity(Quantity);
		dls.setDiscount(Discount);
		dls.setUnitprice(unitprice);

		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();//create marksAnalyserviceIMPL object
 		
		service.updateproductsdetails(dls);//calling  in  class

		request.setAttribute("mks", dls);//setattribute to send Listmarks.jsp 
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/Listproducts.jsp");
		dispatcher.forward(request, response);
	}

}
