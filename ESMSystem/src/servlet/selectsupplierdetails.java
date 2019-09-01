package servlet;
import javax.servlet.RequestDispatcher;
import java.io.IOException;
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
 * Servlet implementation class selectsupplierdetails
 */
@WebServlet("/selectsupplierdetails")
public class selectsupplierdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectsupplierdetails() {
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

 		String supplierId = request.getParameter("supplierid");		//fetching studentid and store in atrrribute called studentId	

 		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();	//create marksAnalyserviceImpl object 
 		
 		SupplierDetails dls = service.getsupplierById(supplierId);			//select query run using  getmarksById method in marksAnalyserviceIMP
 		
 		
		request.setAttribute("details",dls);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/Selectsupplier.jsp");		//direct into select.jsp page
		dispatcher.forward(request, response);
	}

}
