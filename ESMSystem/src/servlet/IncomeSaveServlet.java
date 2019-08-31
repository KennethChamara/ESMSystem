package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Income;
import service.IncomeService;

/**
 * Servlet implementation class IncomeSaveServlet
 */
@WebServlet("/IncomeSaveServlet")
public class IncomeSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeSaveServlet() {
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
		
		PrintWriter out = response.getWriter();
		
		String iName = request.getParameter("incName");
		String iType = request.getParameter("type");
		double iAmount = Double.parseDouble(request.getParameter("amount"));
		
		Income i = new Income();
		
		i.setIname(iName);
		i.setItype(iType);
		i.setIamount(iAmount);
		
		int status = IncomeService.save(i);
		
		if(status>0) {
			request.getRequestDispatcher("NewFile.jsp").include(request, response);
		}else {
			out.println("Sorry! unable to save record");
		}
		out.close();
	}

}
