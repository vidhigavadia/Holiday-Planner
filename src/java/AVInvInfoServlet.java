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

/**
 *
 * @author Brijesh Admin
 */
public class AVInvInfoServlet extends HttpServlet {

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

        RequestDispatcher rd;
        String query;
        int invId;
        int t1 = 0, t2 = 0;

        try {
            invId = Integer.parseInt(request.getParameter("invid"));
            query = "select * from Invoice_Vendor where Invoice_ID=" + invId;

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(query);

            AVInvInfo inf = new AVInvInfo();
            while (rs.next()) {
              
                Statement st1 = con.createStatement();
                String str ="select FName from Person_Master where Email='" + rs.getString(2)+"'";
                ResultSet rs1 = st1.executeQuery(str);

                inf.setInvid(rs.getInt(1));
                inf.setDatetime(rs.getString(5));
                if(rs1.next()) {
                    inf.setVname(rs1.getString(1));
                }
                inf.setSdate(rs.getString(8));
                inf.setEdate(rs.getString(9));
                inf.setTotal_inq(rs.getInt(10));
                inf.setCp_inq(rs.getInt(6));
                inf.setTotal_bkamt(rs.getInt(11));
                inf.setCp_bkamt(rs.getInt(7));
                inf.setTotal((int) rs.getFloat(4));
                inf.setSts(rs.getString(3));
                inf.setVid(rs.getString(2));

                t1 = inf.getTotal_inq() * inf.getCp_inq();
                t2 = (inf.getTotal_bkamt() * inf.getCp_bkamt()) / 100;


            }
            request.setAttribute("Info", inf);
            request.setAttribute("t1", t1);
            request.setAttribute("t2", t2);

            rd = request.getRequestDispatcher("avinvinfo.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.print(e.toString());
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
            Logger.getLogger(AVInvInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AVInvInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AVInvInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AVInvInfoServlet.class.getName()).log(Level.SEVERE, null, ex);
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
