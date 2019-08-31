package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Bonuse;
import service.bonuseService;
import service.bonuseServiceIMPL;

/**
 * Servlet implementation class UpdateBonusServelet
 */
@WebServlet("/UpdateBonusServelet")
public class UpdateBonusServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBonusServelet() {
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

		String eId=request.getParameter("eId");
		int brate= Integer.parseInt( request.getParameter("brate"));
		String bType = request.getParameter("bType");
		String id= request.getParameter("id");
		
		
		Bonuse bonuse = new Bonuse();
		bonuse.setEid(eId);
		bonuse.setRate(brate);
		bonuse.setType(bType);
		bonuse.setBid(id);
		
		
		bonuseService service = new bonuseServiceIMPL();
		service.bounceUpdate(bonuse);
		
			
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/bonuseTable.jsp");
		dispatcher.forward(request, response);
	}

}
