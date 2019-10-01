package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.leave;
import service.leaveService;
import service.leaveSeviceIMPL;

/**
 * Servlet implementation class AddLeavesServlet
 */
@WebServlet("/AddLeavesServlet")
public class AddLeavesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddLeavesServlet() {
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
		leave leaveOne = new leave();
		
		
		
		leaveOne.setEmployeeID("002ID");
		leaveOne.setNoOfDate(1);
		leaveOne.setStartDate(request.getParameter("formDate"));
		leaveOne.setEndDate(request.getParameter("toDate"));
		leaveOne.setLeaveType(request.getParameter("type"));
		leaveOne.setReason(request.getParameter("reason"));
		
		leaveService addleave = new leaveSeviceIMPL();
		addleave.addLeaves(leaveOne);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/leave.jsp");
		dispatcher.forward(request, response);
	}

}
