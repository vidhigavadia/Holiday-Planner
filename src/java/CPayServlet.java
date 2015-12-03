/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class CPayServlet extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        
        String query;
        int amt=0, tid = 0;
        String tname="";
        String vacc = "",vid="";
        
        try {
            int inv_id = Integer.parseInt(request.getParameter("invid"));
            query = "select Amt_Invoiced,Trip_ID from Invoice_Customer where Invoice_ID=" + inv_id;

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(query);
            while (rs.next()) {
                amt = rs.getInt(1);
                tid = rs.getInt(2);
            }
            query = "select Trip_Name,Vendor_ID from TripMaster where T_ID =" + tid;
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(query);
            while (rs2.next()) {

                tname = rs2.getString(1);
                vid = rs2.getString(2);
            
            }
            
            query = "select AccID from PaymentAccInfo where EID= '"+vid+"'";
            Statement st3 = con.createStatement();
            ResultSet rs3 = st.executeQuery(query);
            if(rs3.next())
            {
                vacc = rs3.getString(1);
            }
            
            String strng = amt + "";
            request.setAttribute("tname", tname);
            request.setAttribute("amt",amt);
            request.setAttribute("vaccid", vacc);
            
            Integer i = new Integer(inv_id);
            session.setAttribute("invid", i);
            
            RequestDispatcher rd = request.getRequestDispatcher("cpayconfirm.jsp");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CPayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CPayServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CPayServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CPayServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
