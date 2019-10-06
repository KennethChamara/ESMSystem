

package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ProductDetails;
import model.SupplierDetails;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;
import utill.GenerateProductId;



/**
 * Servlet implementation class addvacancyServlet
 */

@WebServlet("/AddProductServlet")
public class AddProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddProductServlet() {
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
		
		String CompanyName=request.getParameter("CompanyName");
		String ProductName= request.getParameter("ProductName");
		double unitprice= Double.parseDouble(request.getParameter("unitprice"));
		int quantity=Integer.parseInt(request.getParameter("quantity"));
		double discount=Double.parseDouble(request.getParameter("discount"));
		//String description=request.getParameter("description");
		
		String productId;
		
		SupplierAnalyseServiceIMPL IMPL =new SupplierAnalyseServiceIMPL();
		ArrayList arr=IMPL.getProductdetailsList();
		
		GenerateProductId  ID=new GenerateProductId();
		productId= ID.generateProductId(arr);
		
		
		
		
		
		
		ProductDetails prodDet=new ProductDetails();
		prodDet.setProductId(productId);
		prodDet.setPsupplierName(CompanyName);
		prodDet.setProductName(ProductName);
		prodDet.setUnitprice(unitprice);
		prodDet.setQuantity(quantity);
		prodDet.setDiscount(discount);
	
		
		
		SupplierAnalyseService AnalyseService  = new SupplierAnalyseServiceIMPL();
		AnalyseService.addproductdetails(prodDet);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/supplier.jsp");
		dispatcher.forward(request, response);
		
		
	
	}

}
