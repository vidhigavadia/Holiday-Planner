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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh Admin
 */
public class AllInvoiceServlet extends HttpServlet {

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

        HttpSession session = request.getSession();
        RequestDispatcher rd;
        String query, email;
        int i;
        ArrayList<InvoiceInfo> inf;

        try {
            email = (String) session.getAttribute("Username");
            if (email == null || email.equals("")) {
                rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();

            query = "select T_ID,Trip_Name from TripMaster where Cust_ID='" + email + "'";
            ResultSet rs = st.executeQuery(query);
            inf = new ArrayList<InvoiceInfo>();
            while (rs.next()) {
                String q = "select * from Invoice_Customer where Trip_ID=" + rs.getInt(1);
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(q);
                while (rs2.next()) {
                    InvoiceInfo obj = new InvoiceInfo();
                    obj.setInv_id(rs2.getInt(1));
                    obj.setTid(rs2.getInt(2));
                    obj.setTotal(rs2.getInt(3));
                    obj.setInvoiced(rs2.getInt(4));
                    obj.setPaid(rs2.getInt(5));
                    obj.setRemaining(rs2.getInt(6));
                    obj.setSts(rs2.getString(7));
                    obj.setTname(rs.getString(2));

                    inf.add(obj);
                }

            }
            
            request.setAttribute("AllInvoice", inf);
            rd = request.getRequestDispatcher("invoice.jsp");
            rd.forward(request, response);


        } catch (Exception e) {
            System.out.println("Hi" + e.toString());
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
