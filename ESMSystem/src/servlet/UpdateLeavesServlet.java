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
 * Servlet implementation class UpdateLeavesServlet
 */
@WebServlet("/UpdateLeavesServlet")
public class UpdateLeavesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateLeavesServlet() {
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
		leaveOne.setLeaveID(request.getParameter("ID"));
		leaveOne.setStartDate(request.getParameter("formDate"));
		leaveOne.setEndDate(request.getParameter("toDate"));
		leaveOne.setLeaveType(request.getParameter("type"));
		leaveOne.setReason(request.getParameter("reason"));
		
		leaveService addleave = new leaveSeviceIMPL();
		addleave.updateLeave(leaveOne);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/requstingLeavesTab.jsp");
		dispatcher.forward(request, response);
	}

}
