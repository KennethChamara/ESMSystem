package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Income;
import model.IncomeService;

/**
 * Servlet implementation class ViewIncome
 */
@WebServlet("/ViewIncome")
public class ViewIncome extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewIncome() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");  
        PrintWriter out=response.getWriter();
        
        out.println("<a href='NewFile.jsp'>Add New income</a>");  
        out.println("<h1>Income List</h1>");  
          
        List<Income> list=IncomeService.getAllIncomes();
          
        out.print("<table border='1' width='100%'");  
        out.print("<tr><th>Id</th><th>Name</th><th>Type</th><th>Amount</th><th>Edit</th><th>Delete</th></tr>");  
        for(Income i:list){  
         out.print("<tr><td>"+i.getId()+"</td><td>"+i.getIname()+"</td><td>"+i.getItype()+"</td><td>"+i.getIamount()+"</td><td><a href='IncomeEditServlet?id="+i.getId()+"'>edit</a></td><td><a href='IncomeDeleteServlet?id="+i.getId()+"'>delete</a></td></tr>");  
        }  
        out.print("</table>");  
        
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
