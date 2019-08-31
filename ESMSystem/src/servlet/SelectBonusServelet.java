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
 * Servlet implementation class SelectBonusServelet
 */
@WebServlet("/SelectBonusServelet")
public class SelectBonusServelet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBonusServelet() {
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
		
		bonuseService service = new bonuseServiceIMPL();
		Bonuse bonuse = service.selectBounce(request.getParameter("id"));
		
		
		request.setAttribute("Bonuse", bonuse);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/selectbonus.jsp");
		dispatcher.forward(request, response);
	}

}
