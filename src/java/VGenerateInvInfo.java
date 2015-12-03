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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Brijesh Admin
 */
public class VGenerateInvInfo extends HttpServlet {

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

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("Username");
        int tid;
        String query;

        try {

            VCInvoice obj = new VCInvoice();

            tid = Integer.parseInt(request.getParameter("tid"));
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st1 = con.createStatement();
            query = "select Cust_ID,Status from TripMaster where T_ID=" + tid;
            ResultSet rs1 = st1.executeQuery(query);
            if (rs1.next()) {
                obj.setCid(rs1.getString(1));
                obj.setSts(rs1.getString(2));
            }

            query = "select Quotation_Price from Trip_Quotation where T_ID=" + tid + " and Vendor_ID='" + email + "'";
            Statement st2 = con.createStatement();
            ResultSet rs2 = st2.executeQuery(query);
            if (rs2.next()) {
                obj.setTotal(rs2.getInt(1));
            }

            int paid = 0, remaining = obj.getTotal();
            query = "select Amt_Invoiced, Status from Invoice_Customer where Trip_ID=" + tid;
            Statement st3 = con.createStatement();
            ResultSet rs3 = st3.executeQuery(query);
            while (rs3.next()) {
                if ("Paid".equals(rs3.getString(2))) {
                    paid = paid + rs3.getInt(1);
                }
            }
            remaining = remaining - paid;
            obj.setRemaining(remaining);
            obj.setPaid(paid);



            out.println("  <table border =\"0\" class=\"style5\" width=\"100%\">\n"
                    + "                                                <tr>\n"
                    + "                                                    <th width=\"23%\" align=\"left\">Customer ID</th>\n"
                    + "                                                    <td> " + obj.getCid() + "</td>\n"
                    + "                                                </tr>\n"
                    + "                                                <tr>\n"
                    + "                                                    <th align=\"left\" width=\"23%\">Quotation Amount</th>\n"
                    + "                                                    <td>" + obj.getTotal() + "</td>\n"
                    + "                                                </tr>\n"
                    + "                                            </table>\n"
                    + "                                            <br>\n"
                    + "                                            <table border=\"0\" class=\"style5\" width=\"100%\">\n"
                    + "                                                <tr>\n"
                    + "                                                    <th align=\"left\" width=\"23%\">Paid</th>\n"
                    + "                                                    <td>" + obj.getPaid() + "</td>\n"
                    + "                                                </tr>\n"
                    + "                                                <tr>\n"
                    + "                                                    <th align=\"left\" width=\"23%\">Remaining</th>\n"
                    + "                                                    <td>" + obj.getRemaining() + "</td>\n"
                    + "                                                </tr>\n"
                    + "                                            </table>\n"
                    + "                                            <br>\n"
                    + "                                            <table border=\"0\" class=\"style5\" width=\"100%\">\n"
                    + "                                                <tr>\n"
                    + "                                                    <th align=\"left\" width=\"23%\">Enter Amount</th>\n"
                    + "                                                    <td><input type=\"text\" name=\"amt\" id=\"amt\" value=\"0\" onkeypress='return event.charCode >= 48 && event.charCode <= 57' /></td>\n"
                    + "                                                </tr>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td><input type=\"text\" name=\"total\" id=\"total\" value=\"" + obj.getTotal() + "\" hidden=\"hidden\" size=\"10\" /><div id=\"err2\"></div></td>\n"
                    + "                                                    <td><input type=\"text\" name=\"remain\" id=\"remain\" value=\"" + obj.getRemaining() + "\" hidden=\"hidden\" /></td>\n"
                    + "                                                </tr>\n"
                    + "                                                <tr>\n"
                    + "                                                    <td><input type=\"text\" name=\"sts\" id=\"sts\" value=\"" + obj.getSts() + "\"  hidden=\"hidden\" />\n"
                    + "                                                    </td>\n"
                    + "                                                </tr>\n"
                    + "                                            </table>");
            out.println(" <p>\n"
                    + "                                            <input type=\"submit\" value=\"Genrate\" onclick=\"return chkamt();\" />\n"
                    + "                                        </p>");

        } catch (Exception e) {
            System.out.println(e.toString());
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
            Logger.getLogger(VGenerateInvInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VGenerateInvInfo.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(VGenerateInvInfo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(VGenerateInvInfo.class.getName()).log(Level.SEVERE, null, ex);
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
