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
import java.util.ArrayList;
import java.util.List;
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
public class ViewQuotationServlet extends HttpServlet {

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
        String query, q1, vendorId, str = "";
        int tid = Integer.parseInt(request.getParameter("tripid"));
        List<TripQuotation> tq;
        RequestDispatcher rd;
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            query = "select * from Trip_Quotation where T_ID= " + tid;
            ResultSet rs = st.executeQuery(query);
            tq = new ArrayList<TripQuotation>();
            

            while (rs.next()) {
                TripQuotation t = new TripQuotation();
                t.setId(rs.getInt(1));
                t.setT_ID(tid);
                t.setVendorId(rs.getString(3));
                t.setQuotedPrice(rs.getInt(4));
                t.setItinerary(rs.getString(5));


                String query1 = "select FName, PhNo from Person_Master where Email = '" + t.getVendorId() + "'";
                Statement st1 = con.createStatement();
                ResultSet rs1 = st1.executeQuery(query1);

                while (rs1.next()) {
                    t.setVendorname(rs1.getString(1));
                    t.setVendorphno(rs1.getString(2));
                }
                tq.add(t);
            }

            Connection con1 = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            q1 = "select Trip_Name from TripMaster where T_ID = " + tid;
            Statement st2 = con1.createStatement();
            ResultSet rs3 = st2.executeQuery(q1);
            while (rs3.next()) {
                str = rs3.getString(1);
            }

            request.setAttribute("TripName", str);
            request.setAttribute("tripquote", tq);

            rd = request.getRequestDispatcher("tripquotation.jsp");
            rd.forward(request, response);



        } catch (Exception e) {
            System.out.println("Hello" + e.toString());
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewQuotationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewQuotationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewQuotationServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewQuotationServlet.class.getName()).log(Level.SEVERE, null, ex);
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
