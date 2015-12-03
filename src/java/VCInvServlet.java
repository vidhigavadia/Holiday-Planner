/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
public class VCInvServlet extends HttpServlet {

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
        String email = (String)session.getAttribute("Username");
        RequestDispatcher rd;
        String query;
        ArrayList<VCInvoice> invlist;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            query = "select * from Invoice_Customer";
            ResultSet rs = st.executeQuery(query);
            invlist = new ArrayList<VCInvoice>();

            while (rs.next()) {
                VCInvoice in = new VCInvoice();
                
              int t = rs.getInt(2);
              String query2 = "select Cust_ID, Vendor_ID,Trip_Name from TripMaster where T_ID ="+t;
              Statement st2 = con.createStatement();
              ResultSet rs2 = st2.executeQuery(query2);
              if(rs2.next()) {
                    if(email.equals(rs2.getString(2)))
                    {
                        in.setTid(t);
                        in.setCid(rs2.getString(1));
                        in.setTname(rs2.getString(3));
                        in.setInid(rs.getInt(1));
                        in.setInvoiced(rs.getInt(4));
                        in.setSts(rs.getString(7));
                        
                        invlist.add(in);
                    
                    }
                }
              
            }
            request.setAttribute("InvList", invlist);
            rd = request.getRequestDispatcher("vinvoice.jsp");
            rd.forward(request, response);


        } catch (Exception e) {
            System.out.println(e.toString());
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
