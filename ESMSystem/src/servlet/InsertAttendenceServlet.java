package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Attendance;
import model.listleave;
import service.AttendenceService;
import service.AttendenceServiceIMPL;
import service.leaveService;
import service.leaveSeviceIMPL;

/**
 * Servlet implementation class InsertAttendenceServlet
 */
@WebServlet("/InsertAttendenceServlet")
public class InsertAttendenceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAttendenceServlet() {
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
		
		String date = request.getParameter("date");
		
		Attendance attendence = new Attendance();		
		System.out.println(request.getParameter("e_id"));
		attendence.setEmployeeID(request.getParameter("e_id"));
		attendence.setIntime(request.getParameter("intime"));
		attendence.setOuttime(request.getParameter("outtime"));
		attendence.setDate(date);
		
		AttendenceService service = new AttendenceServiceIMPL();
		
		service.insertAttendence(attendence);
		
		request.setAttribute("date", date);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AttendenceEnter.jsp");
		dispatcher.forward(request, response);
	}

}
