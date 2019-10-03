package servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Attendancelist;
import service.AttendenceService;
import service.AttendenceServiceIMPL;

/**
 * Servlet implementation class GetMonthlyAttendenceServlet
 */
@WebServlet("/GetMonthlyAttendenceServlet")
public class GetMonthlyAttendenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetMonthlyAttendenceServlet() {
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
		String month = request.getParameter("month");
		String page = request.getParameter("page");
		
		request.setAttribute("month", month);
		
		if(page.equalsIgnoreCase("view")) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AttendanceView.jsp");
			dispatcher.forward(request, response);
		} else {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AttendenceAllList.jsp");
			dispatcher.forward(request, response);
		}
	}

}
