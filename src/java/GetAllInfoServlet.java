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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh Admin
 */
public class GetAllInfoServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        RequestDispatcher rd;
        try {

            if ( ("".equals(request.getParameter("nadult")) || "".equals(request.getParameter("nchild")) || "".equals(request.getParameter("tname")) || "".equals(request.getParameter("from")) || "".equals(request.getParameter("to")) || "".equals(request.getParameter("tsdate")) || "".equals(request.getParameter("tedate")) ) && session.getAttribute("Username") == null) {
                session.setAttribute("Status", "Enter valid values for all details.");
                rd = request.getRequestDispatcher("plantrip.jsp");
                rd.forward(request, response);
            } else if ( ("".equals(request.getParameter("nadult")) || "".equals(request.getParameter("nchild")) || "".equals(request.getParameter("tname")) || "".equals(request.getParameter("from")) || "".equals(request.getParameter("to")) || "".equals(request.getParameter("tsdate")) || "".equals(request.getParameter("tedate")) ) && session.getAttribute("Username") != null) {
                session.setAttribute("Status", "Enter valid values for all details.");
                rd = request.getRequestDispatcher("trip.jsp");
                rd.forward(request, response);
            } else if (session.getAttribute("tripdetail") == null && session.getAttribute("Username") == null) {
                session.setAttribute("Status", "Enter area you want to visit.");
                rd = request.getRequestDispatcher("plantrip.jsp");
                rd.forward(request, response);
            }
            else if (session.getAttribute("tripdetail") == null && session.getAttribute("Username") != null) {
                session.setAttribute("Status", "Enter area you want to visit.");
                rd = request.getRequestDispatcher("trip.jsp");
                rd.forward(request, response);
            }
            NewTrip n = new NewTrip();
            n.setTripname((String) request.getParameter("tname"));
            n.setFrom((String) request.getParameter("from"));
            n.setTo((String) request.getParameter("to"));
            n.setTsdate(request.getParameter("tsdate"));
            n.setTedate(request.getParameter("tedate"));
            n.setNoAdult(Integer.parseInt(request.getParameter("nadult")));
            n.setNoChild(Integer.parseInt(request.getParameter("nchild")));

            session.setAttribute("tripInfo", n);


            if (session.getAttribute("Username") == null) {
                request.setAttribute("Status", "Please Register to use the full service and get quotations. If you already have an account then log in to plan new trip.");
                rd = request.getRequestDispatcher("register.jsp");
            } else {
                rd = request.getRequestDispatcher("confirmtripdetails.jsp");
            }
            rd.forward(request, response);


        } finally {
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
