/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Brijesh Admin
 */
public class GetInvoiceServlet extends HttpServlet {

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
        int tid;
        String query;
        ArrayList<InvoiceInfo> invoice;
        
        try {

            tid = Integer.parseInt(request.getParameter("tripid"));
            query = "select * from Invoice_Customer where Trip_ID=" + tid;
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            invoice = new ArrayList<InvoiceInfo>();
            
            while (rs.next()) {
                InvoiceInfo inf = new InvoiceInfo();
                inf.setInv_id(rs.getInt(1));
                inf.setTid(rs.getInt(2));
                inf.setTotal(rs.getInt(3));
                inf.setInvoiced(rs.getInt(4));
                inf.setPaid(rs.getInt(5));
                inf.setRemaining(rs.getInt(6));
                inf.setSts(rs.getString(7));
                
                String q = "select Trip_Name from TripMaster where T_ID = " + rs.getInt(2);
                Statement stn = con.createStatement();
                ResultSet r1 = stn.executeQuery(q);
                while (r1.next()) {
                    inf.setTname(r1.getString(1));
                }
                
                invoice.add(inf);
            }
            
            request.setAttribute("Invoice", invoice);
            con.close();
            rd = request.getRequestDispatcher("tripinvoice.jsp");
            rd.forward(request, response);
            
        } catch (Exception e) {
            rd = request.getRequestDispatcher("trip.jsp");
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
