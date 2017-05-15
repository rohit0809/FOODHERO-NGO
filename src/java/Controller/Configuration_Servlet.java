package Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Bean.Configuration_Bean;
public class Configuration_Servlet extends HttpServlet{
    
    
@Override
public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

try
{	    

     Configuration_Bean user = new Configuration_Bean();
     user.setMax(request.getParameter("max"));
     user.setMin(request.getParameter("min"));
     user.setShlife(request.getParameter("shlife"));

     
	   		    
     if (true)
     {
	        
          HttpSession session = request.getSession(true);
          request.setAttribute("configdata", user);
        //  session.setAttribute("currentSessionUser",user);
          //request.setAttribute("login_msg","SUCCESS");
          request.getRequestDispatcher("Request_Filtration.jsp").forward(request, response);   		
     }
	        
     else {   
          request.setAttribute("login_msg","Error");  
          request.getRequestDispatcher("Configuration.jsp").forward(request, response); //error page 
     }
} 
		
		
catch (ServletException theException) 	    
{
     System.out.println(theException); 
}   catch (IOException theException) {
    System.out.println(theException);
    }
       }
@Override
public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      doGet(request, response);
   }
}