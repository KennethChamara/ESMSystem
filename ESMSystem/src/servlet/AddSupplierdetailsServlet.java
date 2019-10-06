
package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class addvacancyServlet
 */
@WebServlet("/AddSupplierdetailsServlet")
public class AddSupplierdetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSupplierdetailsServlet() {
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
		String CompanyName = request.getParameter("CompanyName");
		String FullName = request.getParameter("FullName");
		String address = request.getParameter("address");
		String phonenumber = request.getParameter("phonenumber");
		String emailaddress = request.getParameter("emailaddress");

		String SupplierId;

		SupplierAnalyseServiceIMPL IMPL = new SupplierAnalyseServiceIMPL();
		ArrayList arr = IMPL.getSupplierdetailsList();

		GenerateSupplierID ID = new GenerateSupplierID();
		SupplierId = ID.generateSupplierID(arr);

		SupplierDetails supDes = new SupplierDetails();
		supDes.setSupplierId(SupplierId);
		supDes.setCompanyName(CompanyName);
		supDes.setFullName(FullName);
		supDes.setAddress(address);
		supDes.setPhonenumber(phonenumber);
		supDes.setEmailaddress(emailaddress);

		SupplierAnalyseService AnalyseService = new SupplierAnalyseServiceIMPL();

		AnalyseService.addsupplier(supDes);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/supplier.jsp");

		dispatcher.forward(request, response);

	}

}
