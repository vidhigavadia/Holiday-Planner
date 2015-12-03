/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class VInfoServlet extends HttpServlet {

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
        RequestDispatcher rd;
        String query, status = "";
        int dp=0;
        try {

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            query = "select * from Person_Master where Email = '" + request.getParameter("vid") + "'";
            ResultSet rs = st.executeQuery(query);
            Profile p = new Profile();
            while (rs.next()) {
                p.setEmail(rs.getString(1));
                p.setFName(rs.getString(3));
                p.setLname(rs.getString(4));
                p.setPhno(rs.getString(5));
                p.setGender(rs.getString(7));
                p.setStreet(rs.getString(8));
                p.setCity(rs.getString(9));
                p.setPincode(rs.getString(10));
                p.setState(rs.getString(11));

            }

            query = "select DepositeRs from VendorDeposit where Vendor_ID ='" + request.getParameter("vid")+"'";
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(query);
            while(rs2.next())
            {
                dp = rs2.getInt(1);
            }
            
            request.setAttribute("dipamt", dp);

            request.setAttribute("P", p);
            rd = request.getRequestDispatcher("avendorinfo.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.print("Hi" + e.toString());
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
