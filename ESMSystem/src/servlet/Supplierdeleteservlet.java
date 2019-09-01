package servlet;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SupplierDetails;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;
import utill.GenerateSupplierID;



/**
 * Servlet implementation class Supplierdeleteservlet
 */
@WebServlet("/Supplierdeleteservlet")
public class Supplierdeleteservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Supplierdeleteservlet() {
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
		String supplierId=request.getParameter("supplierId");
		
		SupplierDetails spd=new SupplierDetails();
		spd.setSupplierId(supplierId);
		
		SupplierAnalyseService service =new SupplierAnalyseServiceIMPL();
		service.deleteallrelatedsupplierById(spd);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/Listsupplier.jsp");	//directed in to Listmarks.jsp
		dispatcher.forward(request, response);
	}

}
