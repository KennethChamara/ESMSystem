package servlet;

import java.io.IOException;

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

/**
 * Servlet implementation class selectproductdetails
 */
@WebServlet("/selectproductdetails")
public class selectproductdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectproductdetails() {
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

 		String productId = request.getParameter("productid");		//fetching studentid and store in atrrribute called studentId	

 		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();	//create marksAnalyserviceImpl object 
 		
 		ProductDetails dls = service.getproductById(productId);		//select query run using  getmarksById method in marksAnalyserviceIMP
 		
 		
		request.setAttribute("details",dls);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/Selectproducts.jsp");		//direct into select.jsp page
		dispatcher.forward(request, response);
	}

}