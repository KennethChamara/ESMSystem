package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.leaveService;
import service.leaveSeviceIMPL;

/**
 * Servlet implementation class denyRequestLeavesServlet
 */
@WebServlet("/denyRequestLeavesServlet")
public class denyRequestLeavesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public denyRequestLeavesServlet() {
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
		leaveService addleave = new leaveSeviceIMPL();
		addleave.DeleteLeave(request.getParameter("ID"));
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/LeavelistTab.jsp");
		dispatcher.forward(request, response);
	}

}
