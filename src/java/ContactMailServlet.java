/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class ContactMailServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
        String sts="";
        RequestDispatcher rd;
        
        
        try {
            
        String[] recipients = new String[]{};  
        String[] bccRecipients = new String[]{"customizedholidayplanner@gmail.com",request.getParameter("email")};  
        String subject = request.getParameter("subject");  
        String messageBody = "Name: "+request.getParameter("name")+"\n\nEmail ID: "+request.getParameter("email")+"\n\nMessage: "+request.getParameter("message")+"\n\nThis is auto generated message. Do not reply.";
  
        if(new MailUtil().sendMail(recipients, bccRecipients, subject, messageBody))
        {
            sts ="Submitted Successfully";
        }
        else
        {
           sts = "Unable to send. Try again later.";
        }
        
        
        }
        catch(Exception e)
        {
            System.out.println(e.toString());
            sts ="Unable to send. Try again later.";
        }
        
        finally {        
            request.setAttribute("Status", sts);
            rd = request.getRequestDispatcher("contact.jsp");
            rd.forward(request, response);
                    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
