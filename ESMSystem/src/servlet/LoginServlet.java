package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.LoginBean;
import service.LoginDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		// TODO Auto-generated method stub
		doGet(request, response);
		
		 String userName = request.getParameter("email");
		 String password = request.getParameter("pswd");
		 
		 LoginBean loginBean = new LoginBean();
		 
		 loginBean.setUsername(userName);
		 loginBean.setPassword(password);
		 
		 LoginDao loginDao = new LoginDao();
		 
		 try
		 {
		 String userValidate = loginDao.authenticateUser(loginBean);
		 
		 if(userValidate.equals("Admin_Role"))
		 {
		 System.out.println("Admin's Home");
		 
		 HttpSession session = request.getSession(); //Creating a session
		 session.setAttribute("Admin", userName); //setting session attribute
		 request.setAttribute("userName", userName);
		 
		 request.getRequestDispatcher("/salary.jsp").forward(request, response);
		 }
	
		 else if(userValidate.equals("User_Role"))
		 {
		 System.out.println("User's Home");
		 
		 HttpSession session = request.getSession();
		 session.setMaxInactiveInterval(10*60);
		 session.setAttribute("User", userName);
		 request.setAttribute("userName", userName);
		 
		 request.getRequestDispatcher("/leave.jsp").forward(request, response);
		 }
		 else
		 {
		 System.out.println("Error message = "+userValidate);
		 request.setAttribute("errMessage", userValidate);
		 
		 request.getRequestDispatcher("index.jsp").forward(request, response);
		 }
		 }
		 catch (IOException e1)
		 {
		 e1.printStackTrace();
		 }
		 catch (Exception e2)
		 {
		 e2.printStackTrace();
		 }
	}

}
