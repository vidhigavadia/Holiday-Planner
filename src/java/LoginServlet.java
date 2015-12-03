/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
public class LoginServlet extends HttpServlet {

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
        RequestDispatcher rd;
        HttpSession session = request.getSession();
        try {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            String uname = request.getParameter("uname");
            String pass = request.getParameter("pwd");
            String status = "Username and Password do not match. Try again.";
            String str = "select Role from Person_Master where Email='" + uname + "' and Password = HASHBYTES('MD5','" + pass + "')";
            Statement st = con.createStatement();
            String role;
            String page = "login.jsp";
            ResultSet rs = st.executeQuery(str);
            while (rs.next()) {
                status = "Success";
                role = rs.getString(1);
                session.setAttribute("role", role);
                    if (role.equals("admin")) {
                        page = "aprofile.jsp";
                    } else if (role.equals("vendor")) {
                        page = "vprofile.jsp";
                    } else if (role.equals("customer")) {
                        page = "cprofile.jsp";
                    }
                }
            
            
            session.removeAttribute("tripdetail");
            session.removeAttribute("tripInfo");
            request.setAttribute("Status", status);
            session.setAttribute("Username", uname);
            request.setAttribute("Username", uname);
            session.setAttribute("PageLoad", page);
            request.setAttribute("PageLoad", page);
            if (status.equals("Success")) {
                rd = request.getRequestDispatcher("SetProfileServlet");
            } else {
                rd = request.getRequestDispatcher("login.jsp");
            }

            rd.forward(request, response);
        } catch (Exception e) {
            System.out.println(e.toString());
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
