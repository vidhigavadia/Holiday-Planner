/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh Admin
 */
public class AddAreaServlet2 extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        List<NewTripDetail> tripdetails;
        try {
            
            NewTripDetail n = new NewTripDetail();
            n.setArea((String)request.getParameter("area"));
            n.setHtype((String)request.getParameter("htype"));
            n.setAsdate((String)request.getParameter("asdate"));
            n.setAedate((String)request.getParameter("aedate"));
            
            if (session.getAttribute("tripdetail") == null) {
                tripdetails = new ArrayList<NewTripDetail>();
            }
            else
            {
                tripdetails = (ArrayList<NewTripDetail>)session.getAttribute("tripdetail");
            }
            tripdetails.add(n);
           
            NewTrip nt = new NewTrip();
            nt.setTripname(request.getParameter("tname"));
            nt.setFrom(request.getParameter("from"));
            nt.setTo(request.getParameter("to"));
            nt.setTsdate(request.getParameter("tsdate"));
            nt.setTedate(request.getParameter("tedate"));
            nt.setNoAdult(Integer.parseInt(request.getParameter("nadult")));
            nt.setNoChild(Integer.parseInt(request.getParameter("nchild")));
            
            
            
            /* TODO output your page here. You may use following sample code. */
          
           /* out.println("<table width=100% border=1>");
            out.println("<tr><th>Area</th><th>Hotel Type</th><th>Start Date</th><th> End date</th><th>Remove</th>");
           while(it.hasNext())
           {    NewTripDetail nt = it.next();
              out.println("<tr>");
               out.println("<td align=center>"+nt.getArea()+"</td>");
               out.println("<td align=center>"+nt.getHtype()+"</td>");
               out.println("<td align=center>"+nt.getAsdate()+"</td>");
               out.println("<td align=center>"+nt.getAedate()+"</td>");
               out.println("<td align=center><img src=\"images/delete.gif\" alt=\"delete item\" width=20px height=20px></td>");
               out.println("</tr>");
           }
          out.println("</table>");*/
          session.setAttribute("tripdetail", tripdetails);
          session.setAttribute("trip",nt);
          RequestDispatcher rd = request.getRequestDispatcher("trip.jsp");
          rd.forward(request, response);
            
        } finally {            
            out.close();
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
