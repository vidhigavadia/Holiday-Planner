/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Brijesh Admin
 */
public class AInvVendorDetail extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        String query, sd, ed, vid, tst;
        int planned = 0, booked = 0, bookedAmt = 0;
        try {

            sd = request.getParameter("sdt");
            ed = request.getParameter("edt");
            vid = request.getParameter("vid");

            query = "select count(T_ID) as cnt from TripMaster where Planned_Date between '" + sd + "' and '" + ed + "  23:59:59.999'";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                planned = rs.getInt(1);

            }

            query = "select T_ID  from TripMaster where (Vendor_ID = '" + vid + "' and Status = 'Booked') and Booked_Date between '" + sd + "' and '" + ed + "  23:59:59.999'";
            Statement st1 = con.createStatement();
            ResultSet rs1 = st1.executeQuery(query);
            while (rs1.next()) 
            {
                booked++;
                int tid = rs1.getInt(1);
                String q = "select Quotation_Price from Trip_Quotation where T_ID=" + tid + " and Vendor_ID ='" + vid + "'";
                Statement st2 = con.createStatement();
                ResultSet rs2 = st2.executeQuery(q);
                while (rs2.next())
                {
                    bookedAmt = bookedAmt + rs2.getInt(1);
                }
                
            }





            /* TODO output your page here. You may use following sample code. */
            out.println("  <table class=\"style5\">\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total No . of Inquiry</th>\n"
                    + "                                                <td width=\"144\"><input type=\"text\" name=\"tni\" id=\"tni\" value=\"" + planned + "\" readonly=\"readonly\"/></td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Charge Per Inquiry(in Rs)</th>\n"
                    + "                                                <td><input type=\"text\" name=\"c1\" id=\"c1\" value=\"100\" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/></td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total 1</th>\n"
                    + "                                                <td><input type=\"text\" name=\"t1\" id=\"t1\" value=\"\" readonly=\"readonly\" onfocus=\"calc1()\"/></td>\n"
                    + "                                            </tr>\n"
                    + "                                      </table>\n"
                    + "                                        <br>\n"
                    + "                                        <table class=\"style5\" >\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total No. of Booked trips</th>\n"
                    + "                                              <td width=\"150\"><input type=\"text\" name=\"tbt\" id=\"tbt\" value=\""+booked+"\" readonly=\"readonly\" /> </td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total amount of booked trips(in Rs)</th>\n"
                    + "                                                <td><input type=\"text\"  name=\"ctbt\" id=\"ctbt\" value=\""+bookedAmt+"\" readonly=\"readonly\" /></td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">% Charge to total amount</th>\n"
                    + "                                                <td><input type=\"text\" name=\"c2\" id=\"c2\" value=\"5\" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>\n"
                    + "                                            </tr>\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total 2</th>\n"
                    + "                                                <td><input type=\"text\" name=\"t2\" id=\"t2\" value=\"\" readonly=\"readonly\" onfocus=\"calc2()\"/></td>\n"
                    + "                                            </tr>\n"
                    + "                                        </table>\n"
                    + "                                        <br>\n"
                    + "                                        <table class=\"style5\">\n"
                    + "                                            <tr>\n"
                    + "                                                <th width=\"200\" align=\"left\">Total Amount(Rs)</th>\n"
                    + "                                              <td width=\"144\"><input type=\"text\" name=\"t\" id=\"t\" readonly=\"readonly\" onfocus=\"calc3()\"/></td>\n"
                    + "                                            </tr>\n"
                    + "                                        </table>");


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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AInvVendorDetail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AInvVendorDetail.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AInvVendorDetail.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AInvVendorDetail.class.getName()).log(Level.SEVERE, null, ex);
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
