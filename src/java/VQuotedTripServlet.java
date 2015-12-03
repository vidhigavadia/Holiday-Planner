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
public class VQuotedTripServlet extends HttpServlet {

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
        ArrayList<VTripQuote> quotes;
        String email, query1, query2;
        try {
            email = (String) session.getAttribute("Username");
            query1 = "select * from Trip_Quotation where Vendor_ID ='" + email + "'";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query1);
            quotes = new ArrayList<VTripQuote>();
            while (rs1.next()) {
                query2 = "select Trip_Name, From_Place, To_Place, Cust_ID from TripMaster where Status ='Quoted' and T_ID =" + rs1.getInt(2);
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(query2);

                while (rs2.next()) {
                    VTripQuote vt = new VTripQuote();

                    vt.setId(rs1.getInt(1));
                    vt.setTid(rs1.getInt(2));
                    vt.setTname(rs2.getString(1));
                    vt.setFrom(rs2.getString(2));
                    vt.setTo(rs2.getString(3));
                    vt.setCstid(rs2.getString(4));
                    vt.setQuotation(rs1.getInt(4));

                    quotes.add(vt);
                }


            }
            request.setAttribute("Quotes", quotes);
            RequestDispatcher rd = request.getRequestDispatcher("vquotedtrip.jsp");
            rd.forward(request, response);

        } 
        catch(Exception e){
            
            System.out.println(e.toString());
        }
        finally {            
           
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
            Logger.getLogger(VQuotedTripServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VQuotedTripServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(VQuotedTripServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VQuotedTripServlet.class.getName()).log(Level.SEVERE, null, ex);
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
