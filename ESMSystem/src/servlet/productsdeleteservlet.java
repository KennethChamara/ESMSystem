package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierDetails;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;
import model.ProductDetails;

/**
 * Servlet implementation class productsdeleteservlet
 */
@WebServlet("/productsdeleteservlet")
public class productsdeleteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productsdeleteservlet() {
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
		String prodId=request.getParameter("productId");
		
		ProductDetails prdId=new ProductDetails();
		prdId.setProductId(prodId);
		
		SupplierAnalyseService service =new SupplierAnalyseServiceIMPL();
		service.deleteallrelatedproductById(prdId);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listproducts.jsp");	//directed in to Listmarks.jsp
		dispatcher.forward(request, response);
	}

}
