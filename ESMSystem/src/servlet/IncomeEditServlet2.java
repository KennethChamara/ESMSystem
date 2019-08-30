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
 * Servlet implementation class IncomeEditServlet2
 */
@WebServlet("/IncomeEditServlet2")
public class IncomeEditServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeEditServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		
		String iName = request.getParameter("name");
		String iType = request.getParameter("type");
		double iAmount = Double.parseDouble(request.getParameter("amount"));
		
		Income i = new Income();
		i.setID(id);
		i.setIname(iName);
		i.setItype(iType);
		i.setIamount(iAmount);
		
		int status=IncomeService.update(i);
		if(status>0) {
			request.getRequestDispatcher("NewFile.jsp").include(request, response);
		}else {
			out.println("Sorry! unable to update record");
		}
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
