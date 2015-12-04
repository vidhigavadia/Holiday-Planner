/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh 
 */
public class AddHotel extends HttpServlet {

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
        try {
            String sts = "Failed";

            String query;
            RequestDispatcher rd;
            // int d=Integer.parseInt(request.getParameter("state1"));
            int a = Integer.parseInt(request.getParameter("area2"));
            String hotel = request.getParameter("hotel2");
            String type = request.getParameter("htype");
            String street = request.getParameter("street");
            String city = request.getParameter("city");
            String pin = request.getParameter("pincode");
            String ph = request.getParameter("phno");
            String hemail = request.getParameter("email");
            int state = Integer.parseInt(request.getParameter("state2"));


            HttpSession session = request.getSession();

            String email = (String) session.getAttribute("Username");
            query = "insert into Hotel_Master (Vendor_ID,Hotel_Name,Hotel_Type,Street, City,Pincode,Area_ID,Hotel_PhNo,Hotel_Email,Dest_ID) values ('" + email + "','" + hotel + "','" + type + "','" + street + "','" + city + "','" + pin + "'," + a + ",'" + ph + "','" + hemail + "'," + state + ")";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();


            int i = st.executeUpdate(query);
            if (i == 1) {
                sts = "Hotel added successfully.";

            }

            request.setAttribute("Status", sts);
            rd = request.getRequestDispatcher("DestinationServlet1");
            rd.forward(request, response);

        } catch (Exception e) {
            RequestDispatcher rd = request.getRequestDispatcher("DestinationServlet1");
            rd.forward(request, response);
            System.out.println(e.toString());
        }  finally {            
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
