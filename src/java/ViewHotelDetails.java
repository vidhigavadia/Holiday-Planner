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
public class ViewHotelDetails extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        ArrayList<Hotel> hl;
        try {

            hl = new ArrayList<Hotel>();

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=" + DBPara.dbname + ";username=" + DBPara.uname + ";password=" + DBPara.pwd + ";");
            Statement st1 = con.createStatement();
            int n = Integer.parseInt(request.getParameter("hotel"));

            String email = (String) session.getAttribute("Username");

            String str1 = "select * from Hotel_Master where No=" + n + "";
            ResultSet rs = st1.executeQuery(str1);
            while (rs.next()) {
                Hotel h = new Hotel();

                h.setName(rs.getString(3));
                h.setType(rs.getString(4));
                h.setStreet(rs.getString(5));
                h.setCity(rs.getString(6));
                h.setPincode(rs.getString(7));

                h.setPhno(rs.getString(9));
                h.setHemail(rs.getString(10));

                Statement st2 = con.createStatement();
                String str2 = "select Area from Vendor_Area where no =" + rs.getInt(8);
                ResultSet rs2 = st2.executeQuery(str2);
                
                while (rs2.next()) {
                    h.setArea(rs2.getString(1));
                }
                Statement st3 = con.createStatement();
                String str3 = "select Destination from Destination_Master where Dest_ID =" + rs.getInt(11);
                ResultSet rs3 = st3.executeQuery(str3);
                
                while(rs3.next())
                {
                    h.setDestination(rs3.getString(1));
                }
                hl.add(h);
            }
            request.setAttribute("Hotel", hl);
            con.close();
            RequestDispatcher rd = request.getRequestDispatcher("viewhotel.jsp");
            rd.forward(request, response);
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
