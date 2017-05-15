/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

/**
 *
 * @author Shri89
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Bean.Allotment_Bean;
public class Allotment_Servlet extends HttpServlet{
    
    

public void doGet(HttpServletRequest request, HttpServletResponse response) 
			           throws ServletException, java.io.IOException {

try
{	    

     Allotment_Bean user = new Allotment_Bean();
     
	   		    
     if (true)
     {
	        
          HttpSession session = request.getSession(true);	    
          session.setAttribute("currentSessionUser",user);
          request.setAttribute("Allotment_msg","SUCCESS");
          request.getRequestDispatcher("Allotment.jsp").forward(request, response);   		
     }
	        
     else {   
          request.setAttribute("Allotment_msg","Error");  
          request.getRequestDispatcher("Allotment.jsp").forward(request, response); //error page 
     }
} 
		
		
catch (Throwable theException) 	    
{
     System.out.println(theException); 
}
       }
public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
      doGet(request, response);
   }
}
