package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

import model.SupplierDetails;
import service.SupplierAnalyseService;
import service.SupplierAnalyseServiceIMPL;
import utill.GenerateSupplierID;


/**
 * Servlet implementation class UpdateSupplierServlet
 */
@WebServlet("/UpdateSupplierServlet")
public class UpdateSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateSupplierServlet() {
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
		String CompanyName= request.getParameter("CompanyName");
		String FullName = request.getParameter("FullName");
		String address= request.getParameter("address");
		String phonenumber=request.getParameter("phonenumber");
		String emailaddress=request.getParameter("emailaddress");
		
		SupplierDetails dls = new SupplierDetails();//create Marks object using Marks class
		dls.setSupplierId(supplierId);
		dls.setCompanyName(CompanyName);
		dls.setFullName(FullName);
		dls.setAddress(address);
		dls.setPhonenumber(phonenumber);
		dls.setEmailaddress(emailaddress);

		SupplierAnalyseService service = new SupplierAnalyseServiceIMPL();//create marksAnalyserviceIMPL object
 		
		service.updateSupplierdetails(dls);//calling  in  class

		request.setAttribute("mks", dls);//setattribute to send Listmarks.jsp 
		//RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/WEB-INF/views/Listsupplier.jsp");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Listsupplier.jsp");
		dispatcher.forward(request, response);
	}

}
