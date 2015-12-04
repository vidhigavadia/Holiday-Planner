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
 * @author Brijesh 
 */
public class ChangePasswordServlet extends HttpServlet {

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
        try {

            String opass, npass, cpass, email, sts = "Password Changing Failed.";
            String query, page = "index.jsp", role, query1;
            opass = request.getParameter("opass");
            npass = request.getParameter("npass");
            cpass = request.getParameter("cpass");
            email = (String) session.getAttribute("Username");

            if (npass.equals(cpass)) {
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
                Statement st = con.createStatement();

                query1 = "select Role from Person_Master where Email = '" + email + "' and Password = HASHBYTES('MD5','" + opass + "')";
                ResultSet rs1 = st.executeQuery(query1);

                if (rs1.next()) {
                    query = "update Person_Master set Password = (HASHBYTES('MD5','" + npass + "')) where Email = '" + email + "'";
                    Statement st2 = con.createStatement();
                    int i = st2.executeUpdate(query);

                    if (i == 1) {
                        sts = "Password Changed.";
                    } else {
                        sts = "Password Changing Failed.";
                    }

                    role = rs1.getString(1);

                    if (role.equals("customer")) {
                        page = "cprofile.jsp";
                    } else if (role.equals("vendor")) {
                        page = "vprofile.jsp";
                    } else {
                        page = "aprofile.jsp";
                    }

                } else {
                    
                    
                    role = (String) session.getAttribute("role");
                    if (role.equals("customer")) {
                        page = "cprofile.jsp";
                    } else if (role.equals("vendor")) {
                        page = "vprofile.jsp";
                    } else {
                        page = "aprofile.jsp";
                    }
                }

            }
            request.setAttribute("Update", sts);
            RequestDispatcher rd = request.getRequestDispatcher(page);
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
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ChangePasswordServlet.class.getName()).log(Level.SEVERE, null, ex);
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
