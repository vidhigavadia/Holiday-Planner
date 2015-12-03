/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
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
public class EditServlet extends HttpServlet {

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
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName="+DBPara.dbname+";username="+DBPara.uname+";password="+DBPara.pwd+";");
            String update = "Update Failed...";
            String email, fname, lname, gender, street, city, pincode, state, phno;
            fname = request.getParameter("fname");
            lname = request.getParameter("lname");
            gender = request.getParameter("gender");
            street = request.getParameter("street");
            city = request.getParameter("city");
            pincode = request.getParameter("pincode");
            state = request.getParameter("state");
            phno = request.getParameter("phno");

            HttpSession session = request.getSession();
            
            email = (String)session.getAttribute("Username");
            Statement st = con.createStatement();
            String query = "update Person_Master set FName='" + fname + "',LName='" + lname + "',Gender='" + gender + "',Street='" + street + "',PhNo='" + phno + "',City='" + city + "',Pincode='" + pincode + "',State='" + state + "' where Email='" + email + "'";

            int i = st.executeUpdate(query);
            if (i == 1) {
                update = "Successfully Updated...";
            }

            request.setAttribute("Update", update);
            RequestDispatcher rd = request.getRequestDispatcher("SetProfileServlet");
            //  RequestDispatcher rd = request.getRequestDispatcher("ParentPage.jsp");
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
