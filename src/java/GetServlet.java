/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class GetServlet extends HttpServlet {

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
        String page = "GetInfoServlet";
        String value1 = (String)request.getParameter("st");
 
        try {
          
            if( value1.equals("View Quotation") )
            {
                page = "ViewQuotationServlet";
            }
            else if (value1.equals("Back"))
            {
                page = "SubmittedTripServlet";
            }
            else if (value1.equals("Approve"))
            {
                page = "ApproveTripServlet";
            }
            else if (value1.equals("View Invoice"))
            {
                page = "ViewInvoiceServlet";
            }
            else if (value1.equals("Get Invoice"))
            {
                page = "GetInvoiceServlet";
            }
            else if(value1.equals("Get Ticket"))
            {
                page = "DownloadServlet";
            }
            
            
            RequestDispatcher rd = request.getRequestDispatcher(page);
            rd.forward(request, response);
                
        } 
        catch(Exception e)
        {
            System.out.println("Hi"+e.toString());
             RequestDispatcher rd = request.getRequestDispatcher("trip.jsp");
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
